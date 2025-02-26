//
//  CollectionView.swift
//  Mousy-Water
//
//  Created by Paul Jaime Felix Flores on 14/10/23.
//

import SwiftUI

struct CollectionView: View {
    
    @EnvironmentObject var cartManager: CartManager
    @Environment(\.presentationMode)var mode
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    HStack{
                        //Header
                        Text("Ordena tus botellones")
                            .font(.system(size:30))
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Image(systemName: "arrow.left")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 70,height: 90)
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                    }
                    .padding(30)
                    LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())], content: {
                        ForEach(productList,id:\.id){
                            item in SmallProductCard(product: item)
                        }
                    })
                    .padding(.horizontal)
                    
                    
                }
            }
        }
    }
    
    struct CollectionView_Previews: PreviewProvider {
        static var previews: some View {
            CollectionView()
                .environmentObject(CartManager())
        }
    }
}


//Product Card View

struct SmallProductCard: View {
    var product: Product
    
    var body: some View{
        ZStack{
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding(.trailing,-200)
                .rotationEffect(Angle(degrees: 30))
            ZStack{
                VStack(alignment: .leading, content: {
                    Text("\(product.name)")
                        .font(.system(size: 18,weight: .semibold))
                        .frame(width: 70)
                    Text(product.category)
                        .font(.system(size: 10))
                        .padding()
                        .background(.white.opacity(0.5))
                        .clipShape(Capsule())
                    Spacer()
                    HStack{
                        Text("$\(product.price).0")
                            .font(.system(size: 14,weight: .semibold))
                        Spacer()
                        Button{
                            
                        }label: {
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .frame(width: 45,height: 40)
                                .background(.black)
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                        }
                        
                        
                    }
                    .padding(.trailing,-12)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(.white.opacity(0.9))
                    .clipShape(Capsule())
                    
                })
            }
            .padding(20)
            .frame(width: 170,height: 215)
        }
        .padding(30)
        .frame(width: 170,height: 215)
        .background(product.color.opacity(0.13))
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .padding(.leading,10)
        
    }
}
