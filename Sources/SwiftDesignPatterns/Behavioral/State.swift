//
//  State.swift
//
//
//  Created by Gal Yedidovich on 19/01/2024.
//

import Foundation
fileprivate class Context {
	fileprivate var state: State = StateOne()
	
	func one() {
		state.one(context: self)
	}
	
	func two() {
		state.two(context: self)
	}
}

fileprivate protocol State {
	func one(context: Context)
	func two(context: Context)
}

fileprivate struct StateOne: State {
	func one(context: Context) {
		print("One One")
	}
	
	func two(context: Context) {
		print("One Two")
		context.state = StateTwo()
	}
}

fileprivate struct StateTwo: State {
	func one(context: Context) {
		print("Two One")
	}
	
	func two(context: Context) {
		print("Two Two")
	}
}

private func example() {
	let context = Context()
	context.one()
	context.two()

	context.one()
	context.two()
}
