//
//  CardView.swift
//  marketapp
//
//  Created by Andres Lopez on 19/05/22.
//

import SwiftUI
import Kingfisher

struct CardView: View {
    var product: ProductModel
    
    @ObservedObject var viewModel = CardViewModel()
    
    var body: some View {
        HStack() {
            KFImage(URL(string: product.image)!)
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
                .padding()
            VStack(alignment: .leading) {
                Text(viewModel.formatTitle)
                
                    .multilineTextAlignment(.leading)
                    .font(Font.custom("Roboto-Regular", size: 15))
                    .foregroundColor(Color("TextBackground"))
                Text(viewModel.formatPrice)
                    .font(Font.custom("Roboto-Medium", size: 20))
                    .foregroundColor(Color("TextBackground"))
                HStack(alignment: .center) {
                    Text(product.shipping ? "Envío gratis" : "Envío con costo")
                        .font(Font.custom("Roboto-Regular", size: 10))
                        .foregroundColor(Color("TextOptionBackground"))
                    if(product.shipping) {
                        Image("freedeliveryicon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 14, alignment: .center)
                    }
                }
                .padding(.top, 10)
                .padding(.bottom, 0)
                Spacer()
            }
            .padding([.top, .bottom, .trailing], 10)
            .frame(
                  minWidth: 0,
                  maxWidth: .infinity,
                  minHeight: 0,
                  alignment: .leading)
            .background(Color.white)
            
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
        .padding([.top, .bottom], 2.5)
        .padding([.leading, .trailing], 10)
        .onAppear {
            viewModel.getFormatTitle(title: product.title)
            viewModel.getFormatPrice(price: product.price)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(product: productList[0])
    }
}
