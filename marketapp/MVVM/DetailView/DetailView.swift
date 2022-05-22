//
//  DetailView.swift
//  marketapp
//
//  Created by Andres Lopez on 19/05/22.
//

import SwiftUI
import Kingfisher

struct DetailView: View {
    var productInfo: ProductModel
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            ScrollView {
                GeometryReader() { proxy in
                    VStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: 0) {
                            HStack(spacing: 0) {
                                Text(productInfo.title)
                                    .font(Font.custom("Roboto-Medium", size: 22))
                                    .foregroundColor(Color("TextBackground"))
                                    .frame(width: (proxy.size.width / 10) * 6)
                                VStack(alignment: .center) {
                                    KFImage(URL(string: productInfo.image)!)
                                    //Image("macbookpro")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 90)
                                        .padding()
                                }
                                .frame(width: (proxy.size.width / 10) * 4, height: 200)
                            }
                            .frame(height: 35)
                            .frame(maxWidth: .infinity)
                            .background(.clear)
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity)
                        .frame(height: 200)
                        .background(.clear)
                        
                        VStack {
                            
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 80)
                        .background(
                            RoundedCornersShape(corners: [.topLeft, .topRight], radius: 50)
                                .fill(Color.white)
                        )
                        .shadow(color: Color("ShadowEffect"), radius: 8)
                        
                        VStack {
                            Text("HOLA")
                            Spacer()
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .frame(height: 400)
                        .background(.white)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .background(Color("Background"))
        }
        .navigationTitle("Producto")
        .toolbar {
            VStack {
                Button {
                    self.presentation.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 17, weight: .bold))
                        .frame(width: 36, height: 36)
                        .foregroundColor(Color("TextBackground"))
                        .background(.ultraThinMaterial)
                        .backgroundStyle(cornerRadius: 14, opacity: 0.4)
                }
                .padding(.top, 5)
            }
        }
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .navigationBar(backgroundColor: Color("Background"), titleColor: Color("TextBackground"))
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(productInfo: productList[0])
    }
}
