//
//  AbstractFactory.swift
//  
//
//  Created by Gal Yedidovich on 03/04/2023.
//

import Foundation
protocol Bike {
	var topSpeed: Int { get }
	func wheely()
}

protocol Truck {
	var weight: Int { get }
}

protocol MotorFactory {
	func createBike() -> Bike
	func createTruck() -> Truck
}

struct AmericanFactory: MotorFactory {
	struct AmericanBike: Bike {
		var topSpeed: Int = 150
		
		func wheely() {
			print("M'erica wheely")
		}
	}
	
	struct AmericanTruck: Truck {
		var weight: Int = 2000
	}
	
	func createBike() -> Bike {
		AmericanBike()
	}
	
	func createTruck() -> Truck {
		AmericanTruck()
	}
}

struct ItalianFactory: MotorFactory {
	struct ItalianBike: Bike {
		var topSpeed: Int = 160
		
		func wheely() {
			print("Italian wheely!")
		}
	}
	
	struct ItalianTruck: Truck {
		var weight: Int = 1900
	}
	
	func createBike() -> Bike {
		ItalianBike()
	}
	
	func createTruck() -> Truck {
		ItalianTruck()
	}
}
