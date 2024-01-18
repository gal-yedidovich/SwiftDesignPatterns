//
//  ChainOfResponsibility.swift
//
//
//  Created by Gal Yedidovich on 17/04/2023.
//

import Foundation

struct TupleComparator<Compared, Left: SortComparator, Right: SortComparator>: SortComparator where Left.Compared == Compared, Right.Compared == Compared {
	typealias Compared = Compared
	
	let first: Left
	let next: Right
	var order: SortOrder = .forward
	
	func compare(_ lhs: Compared, _ rhs: Compared) -> ComparisonResult {
		let result = first.compare(lhs, rhs)
		if result != .orderedSame {
			return result
		}
		
		return next.compare(lhs, rhs)
	}
}

extension SortComparator {
	func then<Comparator: SortComparator>(
		_ next: Comparator
	) -> TupleComparator<Compared, Self, Comparator> where Compared == Comparator.Compared {
		return TupleComparator(first: self, next: next)
	}
}

private func example() {
	struct Person {
		var name: String
		var age: Int
		var isAlive: Bool
	}
	
	let people = [
		Person(name: "Bubu", age: 5, isAlive: true),
		Person(name: "Groot", age: 5, isAlive: true),
		Person(name: "Deadpool", age: 35, isAlive: true),
		Person(name: "Tony Stark", age: 50, isAlive: false),
	]
	
	struct NameComparator: SortComparator {
		var order: SortOrder = .forward
		
		func compare(_ lhs: Person, _ rhs: Person) -> ComparisonResult {
			return lhs.name.compare(rhs.name)
		}
	}
	
	struct AgeComparator: SortComparator {
		var order: SortOrder = .forward
		
		func compare(_ lhs: Person, _ rhs: Person) -> ComparisonResult {
			return ComparisonResult.from(number: lhs.age - rhs.age)
		}
	}
	
	let chainedComparator = AgeComparator().then(NameComparator())
	let sorted = people.sorted(using: chainedComparator)
	print(sorted)
	
	let sorted2 = people.sorted { left, right in
		if left.age == right.age {
			return left.name < right.name
		}
		return left.age < right.age
	}
	print(sorted2)
}

extension ComparisonResult {
	static func from(number value: Int) -> ComparisonResult {
		if value < 0 { return .orderedAscending }
		if value > 0 { return .orderedDescending }
		return .orderedSame
	}
}
