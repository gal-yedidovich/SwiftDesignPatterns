//
//  Adapter.swift
//  
//
//  Created by Gal Yedidovich on 18/06/2023.
//

import Foundation

protocol Target {
	func targetedMethod()
}

protocol Adaptee {
	func similarMethod()
	
}

struct Adapter: Target {
	let adaptee: Adaptee
	
	func targetedMethod() {
		adaptee.similarMethod()
	}
}

func operation(target: Target) {
	target.targetedMethod()
}


private func ecample() {
	struct AdapteeExample: Adaptee {
		func similarMethod() {
			print("hello from adaptee instance")
		}
	}
	
	let adaptee = AdapteeExample()
	let adapter = Adapter(adaptee: adaptee)
	
	operation(target: adapter)
}
