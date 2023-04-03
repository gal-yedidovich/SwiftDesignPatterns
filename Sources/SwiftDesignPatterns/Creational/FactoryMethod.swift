//
//  FactoryMethod.swift
//  
//
//  Created by Gal Yedidovich on 03/04/2023.
//

import Foundation
struct Pizza {
	var toppings: [String]
	var size: Size
	
	enum Size {
		case small
		case medium
		case large
		case extraLarge
	}
	
	static func createPizza() -> Pizza {
		return Pizza(toppings: ["Tuna", "Onion"], size: .large)
	}
}
