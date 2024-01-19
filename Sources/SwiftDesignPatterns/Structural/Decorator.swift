//
//  Decorator.swift
//
//
//  Created by Gal Yedidovich on 19/01/2024.
//

import Foundation

protocol Weapon {
	var sound: Double { get }

	var weight: Double { get }
	
	var clipCount: Int { get }
}

protocol WeaponDecorator: Weapon {
	init(weapon: Weapon)
}

class Pistol: Weapon {
	var sound: Double = 1.5
	
	var weight: Double = 0.5
	
	var clipCount: Int = 17
}

class Silencer: WeaponDecorator {
	private let weapon: Weapon
	required init(weapon: Weapon) {
		self.weapon = weapon
	}
	
	var sound: Double { weapon.sound / 2 }
	
	var weight: Double { weapon.weight + 0.3 }
	
	var clipCount: Int { weapon.clipCount }
}

class ClipExtender: WeaponDecorator {
	private let weapon: Weapon
	required init(weapon: Weapon) {
		self.weapon = weapon
	}
	
	var sound: Double { weapon.sound }
	
	var weight: Double { weapon.weight + 0.2 }
	
	var clipCount: Int { weapon.clipCount + 8 }
}

private func example() {
	let pistol = Pistol()
	fire(weapon: pistol)
	
	let silenced = Silencer(weapon: pistol)
	fire(weapon: silenced)
	
	let extended = Silencer(weapon: silenced)
	fire(weapon: extended)
}

private func fire(weapon: Weapon) {
	print("firing on weapon with sound: \(weapon.sound), weight: \(weapon.weight), clipCount: \(weapon.clipCount)")
}
