//
//  ProductListView.swift
//  marketapp
//
//  Created by Andres Lopez on 22/05/22.
//

import SwiftUI

struct ProductListView: View {
    var productList: [ProductModel]
    
    var body: some View {
        ScrollView {
            ForEach(productList, id: \.id) { product in
                NavigationLink(destination: DetailView(productInfo: product)) {
                    CardView(product: product)
                }
            }
        }
        VStack {}
        .frame(maxWidth: .infinity)
        .background(Color("Background"))
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(productList: productList)
    }
}
