//
//  Observer.swift
//
//
//  Created by Gal Yedidovich on 19/01/2024.
//

import Foundation

class Subject {
	var value = "" {
		didSet {
			observers.forEach { $0(value) }
		}
	}
	private var observers: [(String) -> Void] = []
	
	func register(observer: @escaping (String) -> Void) {
		observers.append(observer)
	}
}

private func example() {
	let subject = Subject()
	subject.register { value in
		print("got that value changed \"\(value)\"")
	}
	subject.register { value in
		print("Capital value is \(value.uppercased())")
	}
	
	subject.value = "bubu"
	subject.register { value in
		print("another observer got it \(value)")
	}
	
	subject.value = "Groot"
}
