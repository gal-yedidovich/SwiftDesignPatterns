//
//  Builder.swift
//  
//
//  Created by Gal Yedidovich on 03/04/2023.
//

import Foundation
public struct Person {
	public let name: String
	public let birthDate: Date
	public let sex: Sex?
	
	private init(name: String, birthDate: Date, sex: Sex?) {
		self.name = name
		self.birthDate = birthDate
		self.sex = sex
	}
}

extension Person {
	public enum Sex {
		case male
		case female
	}
	
	public struct Builder {
		private var name: String
		private var birthDate: Date = Date()
		private var sex: Sex?
		
		public init(name: String) {
			self.name = name
		}
		
		public func set(birthDate: Date) -> Builder {
			var copy = self
			copy.birthDate = birthDate
			return copy
		}
		
		public func set(sex: Sex) -> Builder {
			var copy = self
			copy.sex = sex
			return copy
		}
		
		public func build() -> Person {
			Person(name: name, birthDate: birthDate, sex: sex)
		}
	}
}


func example() {
	let Gal = Person.Builder(name: "Gal Yedidovich")
		.set(birthDate: Date(timeIntervalSince1970: 10000))
		.build()
	
	print(Gal)
}
