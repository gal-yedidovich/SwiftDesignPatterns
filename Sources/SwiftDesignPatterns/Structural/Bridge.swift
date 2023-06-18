//
//  Bridge.swift
//  
//
//  Created by Gal Yedidovich on 18/06/2023.
//

import Foundation

/// Abstraction
protocol Element {
	var platform: Platform { get }
	var name: String { get }
}

extension Element {
	func performClick() {
		platform.onClick(element: self)
	}
}

/// Implementor
protocol Platform {
	func onClick(element: Element)
}

struct Button: Element {
	let platform: Platform
	var name: String { "Button" }
}

struct Text: Element {
	let platform: Platform
	var name: String { "Text" }
}

struct Mac: Platform {
	func onClick(element: Element) {
		print("clicking element on \(element.name) on a MacOS")
	}
}

struct Windows: Platform {
	func onClick(element: Element) {
		print("Windows: clicking on \(element.name)")
	}
}

private func example() {
	let mac = Mac()
	let windows = Windows()
	
	let elements: [Element] = [
		Button(platform: mac),
		Button(platform: windows),
		Text(platform: mac),
		Text(platform: windows),
	]
	
	for element in elements {
		element.performClick()
	}
}
