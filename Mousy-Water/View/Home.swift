//
//  Home.swift
//  Mousy-Water
//
//  Created by Paul Jaime Felix Flores on 14/10/23.
//

import SwiftUI

struct Home: View {
    //Category View Properties
    @State var selectedCategory = "Choco"
    @EnvironmentObject var cartManager: CartManager
    
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
                        Image(systemName: "line.3.horizontal")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 70,height: 90)
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                    }
                    .padding(30)
                    //Category List
                    CategoryListView
                    //Collection View
                    
                    HStack{
                        Text("Choco ** collection")
                            .font(.system(size: 24))
                        Spacer()
                        
                        NavigationLink{
                            CollectionView()
                        }label:{
                            Image(systemName: "arrow.right")
                                .imageScale(.large)
                        }
                        
                        .foregroundColor(.black)
                    }
                    .padding(.horizontal,30)
                    .padding(.vertical,30)
                    //Product List
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack{
                            ForEach(productList,id:\.id){
                                item in
                                ProductCard(product: item)
                            }
                        }
                    }
                    
                }
            }
        }
    }
    //Category List View
    var CategoryListView: some View{
        HStack{
            //Text("Hello")
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(categoryList,id: \.id){ item in
                        Button{
                            selectedCategory = item.title
                        }label:{
                            HStack{
                                if item.title != "ALL"{
                                    Image(item.icon)
                                        .foregroundColor(selectedCategory == item.title ? .yellow: .black)
                                }
                             
                                Text(item.title)
                            }
                            .padding(20)
                            .background(selectedCategory == item.title ? .black : .gray.opacity(0.1))
                            .foregroundColor(selectedCategory != item.title ? .black : .white)
                            .clipShape(Capsule())
                        }
                    }
                }
                .padding(.horizontal,30)
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(CartManager())
    }
}

//Product Card View

struct ProductCard: View {
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
                        .font(.system(size: 36,weight: .semibold))
                        .frame(width: 140)
                    Text(product.category)
                        .font(.callout)
                        .padding()
                        .background(.white.opacity(0.5))
                        .clipShape(Capsule())
                    Spacer()
                    HStack{
                        Text("$\(product.price).0")
                            .font(.system(size: 24,weight: .semibold))
                        Spacer()
                        Button{
                            
                        }label: {
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .frame(width: 90,height: 68)
                                .background(.black)
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                        }
                        
                        
                    }
                    .padding(.leading)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background(.white.opacity(0.9))
                    .clipShape(Capsule())
                    
                })
            }
            .padding(30)
            .frame(width: 336,height: 422)
        }
        //.padding(30)
        .frame(width: 336,height: 422)
        .background(product.color.opacity(0.13))
        .clipShape(RoundedRectangle(cornerRadius: 57))
        .padding(.leading,20)
        
    }
}



