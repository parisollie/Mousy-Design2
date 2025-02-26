//
//  CartManager.swift
//  Mousy-Water
//
//  Created by Paul Jaime Felix Flores on 14/10/23.
//

import SwiftUI

class CartManager: ObservableObject{
    @Published private(set) var products: [Product] = []
    @Published private(set) var total : Int = 0
    
    func addToCart(product:Product){
        products.append(product)
        total += product.price
    }
    func removeFromCart(product:Product){
        products = products.filter { $0.id != product.id}
        total -= product.price
    }
        
    }


