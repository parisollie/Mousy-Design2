//
//  ProductModel.swift
//  Mousy-Water
//
//  Created by Paul Jaime Felix Flores on 14/10/23.
//

import SwiftUI

struct Product: Identifiable {
    var id: UUID = .init()
    var name : String
    var category: String
    var image: String
    var color: Color
    var price: Int
}

//Sample products
var productList = [
    Product(name: "Botellon 20 litros", category: "Choco", image: "botellon1",color: .pink, price: 15),
    Product(name: "Botellon 10 litros", category: "Choco", image: "botellon2",color: .yellow, price: 10),
    Product(name: "Tapas", category: "Chips", image: "tapas",color: .yellow, price: 0),
]
