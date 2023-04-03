//
//  SingletonCounter.swift
//  
//
//  Created by Gal Yedidovich on 03/04/2023.
//

import Foundation
public class SingletonCounter {
	public private(set) static var instance = SingletonCounter()
	
	private var count = 0
	
	private init() {}
	
	public func nextCount() -> Int {
		defer { count += 1 }
		return count
	}
}
