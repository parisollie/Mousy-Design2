//
//  CartVIew.swift
//  Mousy-Water
//
//  Created by Paul Jaime Felix Flores on 14/10/23.
//

import SwiftUI

struct CartVIew: View {
    
    @EnvironmentObject var cartManagerR: CartManager
    
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    HStack{
                        //Header
                        Text("Carrito")
                            .font(.system(size: 30))
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Button {
                            mode.wrappedValue.dismiss()
                        }label:{
                            Text("3")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 70,height: 90)
                            .background(.yellow.opacity(0.5))
                            .clipShape(Capsule())
                        }
                        .foregroundColor(.black)
                        
                        Button {
                            mode.wrappedValue.dismiss()
                        }label:{
                            Image(systemName: "arrow.letf")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 70,height: 90)
                            .background(.yellow.opacity(0.5))
                            .clipShape(Capsule())
                        }
                        .foregroundColor(.black)
                            
                    }
                    .padding(30)
                    
                    //Cart products
                    VStack(spacing: 20){
                        ForEach(productList){item in
                            CartProductCard(product: item)
                        }
                    }
                   
                    .padding(.horizontal)
                    //Total ammout
                    //Button to make payment
                    //Card Total
                    VStack(alignment: .leading){
                        HStack{
                            Text("Cantidad entregada")
                            Spacer()
                            Text("$4.00")
                                .font(.system(size: 24,weight: .semibold))
                        }
                        Divider()
                        
                        Text("Total a pagar")
                            .font(.system(size: 24,weight: .semibold))
                        
                        Text("MXN 30.00")
                            .font(.system(size: 36,weight: .semibold))
                        
                    }
                    .padding(30)
                    .frame(maxWidth: .infinity)
                    .background(.yellow.opacity(0.5))
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .padding()
                    
                    //BUTTON
                    Button{
                        
                    }label: {
                        Text("Make Payment")
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .background(.yellow.opacity(0.5))
                            .font(.system(size: 20,weight: .semibold))
                            .foregroundColor(.black)
                            .clipShape(Capsule())
                            .padding()
                    }
                    
                }
            }
        }
    }
}

struct CartVIew_Previews: PreviewProvider {
    static var previews: some View {
        CartVIew()
            .environmentObject(CartManager())
    }
}


//Cart product View

struct CartProductCard: View {
    var product: Product
    
    var body: some View{
        HStack(alignment: .center, spacing: 20){
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: 80,height: 80)
                .background(.gray.opacity(0.1))
                .clipShape(Circle())
            VStack(alignment: .leading, content: {
                Text("\(product.name)")
                    .font(.headline)
                Text(product.category)
                    .font(.callout)
                    .opacity(0.5)
            })
            
            Spacer()
            Text("\(product.price)")
                .padding()
                .background(.yellow.opacity(0.5))
                .clipShape(Capsule())
        }
    }
}
