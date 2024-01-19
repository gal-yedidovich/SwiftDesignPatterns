//
//  Command.swift
//
//
//  Created by Gal Yedidovich on 18/01/2024.
//

import Foundation

protocol Command {
	func run()
	func undo()
}

class Invoker {
	private var commandStack: [Command] = []
	private var undoStack: [Command] = []
	
	func execute(command: Command) {
		undoStack = []
		commandStack.append(command)
		command.run()
	}
	
	func undo() {
		guard let command = commandStack.popLast() else {
			return
		}
		
		undoStack.append(command)
		command.undo()
	}
	
	func redo() {
		guard let command = undoStack.popLast() else {
			return
		}
		
		commandStack.append(command)
		command.run()
	}
}

private func example() {
	class State {
		var number = 0
	}
	
	class AddCommand: Command {
		let state: State
		let value: Int
		
		init(state: State, value: Int) {
			self.state = state
			self.value = value
		}
		
		func run() {
			state.number += value
		}
		
		func undo() {
			state.number -= value
		}
	}
	
	let invoker = Invoker()
	let state = State()
	
	invoker.execute(command: AddCommand(state: state, value: 10))
	print("add 10, value \(state.number)")
	invoker.execute(command: AddCommand(state: state, value: 3))
	print("add 3, value \(state.number)")
	invoker.undo()
	print("undo 3, value \(state.number)")
	invoker.undo()
	print("undo 10, value \(state.number)")
}
