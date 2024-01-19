//
//  Strategy.swift
//
//
//  Created by Gal Yedidovich on 19/01/2024.
//

import Foundation
fileprivate class Context {
	private let strategy: ()->Void
	
	init(strategy: @escaping () -> Void) {
		self.strategy = strategy
	}
	
	func operation() {
		print("running the flow")
		strategy()
	}
}

private func example() {
	let strategy = { print("strategy ONE") }
	let context = Context(strategy: strategy)
	context.operation()
}
