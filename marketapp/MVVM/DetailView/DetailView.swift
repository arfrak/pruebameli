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
    
    @ObservedObject var viewModel = DetailViewModel()
    
    var body: some View {
        VStack {
            GeometryReader() { proxy in
                ScrollView {
                    VStack(spacing: 0) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(viewModel.formatTitle)
                                    .multilineTextAlignment(.leading)
                                    .font(Font.custom("Roboto-Medium", size: 20))
                                    .foregroundColor(Color("TextBackground"))
                            }
                            .padding()
                            
                            VStack(alignment: .center) {
                                KFImage(URL(string: productInfo.image)!)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 90)
                                    .padding()
                                    .background(.white)
                                    .cornerRadius(10)
                            }
                            .frame(width: (proxy.size.width / 10) * 4, height: 200)
                        }
                        .frame(height: 200)
                        .frame(maxWidth: .infinity)
                        .background(.clear)
                        
                        VStack(alignment: .center) {
                            HStack(alignment: .center) {
                                ForEach(0..<(viewModel.arrayStarComponent.count), id: \.self) { index in
                                    viewModel.arrayStarComponent[index]
                                }
                                Text("(\(productInfo.user_ratings))")
                                    .font(Font.custom("Roboto-Regular", size: 12))
                                    .foregroundColor(Color("ShadowEffect"))
                            }
                            .frame(width: 190, height: 20)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 80)
                        .background(
                            RoundedCornersShape(corners: [.topLeft, .topRight], radius: 50)
                                .fill(Color.white)
                        )
                        
                        VStack {
                            VStack(alignment: .leading, spacing: 0) {
                                HStack {
                                    Text("$")
                                        .font(Font.custom("Roboto-Regular", size: 30))
                                        .foregroundColor(Color("TextBackground"))
                                    Text("\(productInfo.price)")
                                        .font(Font.custom("Roboto-Regular", size: 30))
                                        .foregroundColor(Color("TextBackground"))
                                    Spacer()
                                }
                                .padding([.leading, .trailing], 20)
                                
                                Text("Hasta 36 cuotas")
                                    .font(Font.custom("Roboto-Regular", size: 12))
                                    .foregroundColor(Color("TextBackground"))
                                    .padding(.top, 15)
                                    .padding([.leading, .trailing], 20)
                                
                                Text("Con cualquier tarjeta")
                                    .font(Font.custom("Roboto-Regular", size: 12))
                                    .foregroundColor(Color("ShadowEffect"))
                                    .padding(.bottom, 15)
                                    .padding(.top, 2)
                                    .padding([.leading, .trailing], 20)
                            }
                            .padding([.top, .bottom], 15)
                            
                            Text("Stock disponible")
                                .font(Font.custom("Roboto-Medium", size: 14))
                                .foregroundColor(Color("TextBackground"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.leading, .trailing], 20)
                                .padding([.top, .bottom], 5)
                                .multilineTextAlignment(.leading)
                            
                            HStack(spacing: 0) {
                                Text("Cantidad:")
                                    .font(Font.custom("Roboto-Regular", size: 14))
                                    .foregroundColor(Color("TextBackground"))
                                    .padding(.leading, 20)
                                Text("1")
                                    .font(Font.custom("Roboto-Medium", size: 14))
                                    .foregroundColor(Color("TextBackground"))
                                    .padding(.leading, 10)
                                Text("(Disponibles \(productInfo.available_quantity))")
                                    .font(Font.custom("Roboto-Regular", size: 14))
                                    .foregroundColor(Color("ShadowEffect"))
                                    .padding(.leading, 10)
                                Spacer()
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 45)
                            .background(Color("BackgroundInfo"))
                            .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                            .padding([.leading, .trailing], 20)
                            .padding([.top, .bottom], 5)
                            
                            Text("Estado del producto")
                                .font(Font.custom("Roboto-Medium", size: 14))
                                .foregroundColor(Color("TextBackground"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.leading, .trailing], 20)
                                .padding([.top, .bottom], 5)
                                .multilineTextAlignment(.leading)
                            
                            HStack(spacing: 0) {
                                Text(viewModel.productCondition)
                                    .font(Font.custom("Roboto-Regular", size: 14))
                                    .foregroundColor(Color("TextBackground"))
                                    .padding(.leading, 20)
                                Spacer()
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 45)
                            .background(Color("BackgroundInfo"))
                            .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                            .padding([.leading, .trailing], 20)
                            .padding([.top, .bottom], 5)
                            
                            Text("Acepta mercadopago")
                                .font(Font.custom("Roboto-Medium", size: 14))
                                .foregroundColor(Color("TextBackground"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.leading, .trailing], 20)
                                .padding([.top, .bottom], 5)
                                .multilineTextAlignment(.leading)
                            
                            HStack(spacing: 0) {
                                Text(viewModel.mercadopagoCondition)
                                    .font(Font.custom("Roboto-Regular", size: 14))
                                    .foregroundColor(Color("TextBackground"))
                                    .padding(.leading, 20)
                                Spacer()
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 45)
                            .background(Color("BackgroundInfo"))
                            .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                            .padding([.leading, .trailing], 20)
                            .padding([.top, .bottom], 5)
                            
                            VStack(spacing: 0) {
                                VStack() {
                                }
                                .frame(height: 1)
                                .frame(maxWidth: .infinity)
                                .background(Color("BackgroundInfo"))
                                .padding([.top, .bottom], 20)
                                
                                Text("Información del vendedor")
                                    .font(Font.custom("Roboto-Medium", size: 14))
                                    .foregroundColor(Color("TextBackground"))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding([.leading, .trailing], 20)
                                    .padding([.top, .bottom], 5)
                                    .multilineTextAlignment(.leading)
                                
                                HStack {
                                    VStack {
                                    }
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 10)
                                    .background(viewModel.colorStatus)
                                    .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
    
                                    Text("\(Int(productInfo.ratings.positive * 100))")
                                        .font(Font.custom("Roboto-Regular", size: 14))
                                        .foregroundColor(Color("TextBackground"))
                                }
                                .padding([.leading, .trailing], 20)
                                .padding([.top, .bottom], 5)
    
                                Text("Porcentage de ventas realizadas con exito")
                                    .font(Font.custom("Roboto-Regular", size: 14))
                                    .foregroundColor(Color("TextBackground"))
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.white)
                        
                        VStack {
                            
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 80)
                        .background(
                            RoundedCornersShape(corners: [.bottomLeft, .bottomRight], radius: 50)
                                .fill(Color.white)
                        )
                    }
                }
                .frame(maxWidth: .infinity)
                .background(Color("Background"))
            }
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
        .onAppear {
            viewModel.getcalificationValue(value: productInfo.user_calification)
            viewModel.getProductCondition(condition: productInfo.condition)
            viewModel.getMercadoPagoCondition(condition: productInfo.accepts_mercadopago)
            viewModel.getColorStatus(value: productInfo.ratings.positive)
            viewModel.getFormatTitle(title: productInfo.title)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(productInfo: productList[0])
    }
}
