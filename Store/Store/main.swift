//
//  main.swift
//  Store
//
//  Created by Ted Neward on 2/29/24.
//

import Foundation

protocol SKU {
    var name: String {get}
    func price() -> Int
}

class Item: SKU {
    var name: String
    var priceEach: Int
    
    init(name: String, priceEach: Int) {
        self.name = name
        self.priceEach = priceEach
    }
    
    func price() -> Int {
        return priceEach
    }
    
    
}

class Receipt {
    
    var current_items: [SKU] = []
    
    func add(_ item: SKU) {
        current_items.append(item)
    }
    
    func items() -> [SKU] {
        return current_items
    }
    
    func total() -> Int {
        var totalPrice = 0
        for item in current_items {
            totalPrice += item.price()
        }
        return totalPrice
    }
    
    func output() -> String {
        var toString = "Receipt:\n"
        for item in current_items {
            toString += item.name + ": $" + String(Double(item.price())/100) + "\n"
        }
        toString += "------------------\nTOTAL: $" + String(Double(self.total())/100)
        return toString
    }
}

class Register {
    
    var total_receipt = Receipt()
    
    func scan(_ Scanned: SKU) {
        total_receipt.add(Scanned)
    }
    
    func subtotal() -> Int {
        return total_receipt.total()
    }
    
    func total() -> Receipt {
        let final_receipt = total_receipt
        total_receipt = Receipt()
        return final_receipt
    }
}

class Store {
    let version = "0.1"
    func helloWorld() -> String {
        return "Hello world"
    }
}

