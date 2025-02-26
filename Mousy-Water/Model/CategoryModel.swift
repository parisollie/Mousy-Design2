//
//  CategoryModel.swift
//  Mousy-Water
//
//  Created by Paul Jaime Felix Flores on 14/10/23.
//

import SwiftUI

struct CategoryModel:Identifiable,Hashable{
    var id: UUID = .init()
    var icon: String
    var title: String
}

var categoryList:[CategoryModel] = [
    CategoryModel(icon : "",title: "All"),
    CategoryModel(icon : "choco",title: "Bot1"),
    CategoryModel(icon : "waffles",title: "Bot2"),
    CategoryModel(icon : "toffee",title: "Tapas"),

]
