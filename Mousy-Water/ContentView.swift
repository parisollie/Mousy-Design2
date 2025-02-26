//
//  ContentView.swift
//  Mousy-Water
//
//  Created by Paul Jaime Felix Flores on 14/10/23.
// Actualizando

import SwiftUI

struct ContentView: View {
    
    @StateObject var cartManager = CartManager()
    
    var body: some View {
        ZStack(alignment: .bottom){
            Home()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
