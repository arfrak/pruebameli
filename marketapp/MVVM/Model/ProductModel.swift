//
//  ProductModel.swift
//  marketapp
//
//  Created by Andres Lopez on 19/05/22.
//

import SwiftUI

struct ProductModel: Codable {
    var id: String = UUID().uuidString
    var price: Int = 0
    var title: String = ""
    var image: String = ""
    var shipping: Bool = false
    var accepts_mercadopago: Bool = false
    var available_quantity: Int = 0
    var condition: String = ""
    var power_seller_status: String = ""
    var level_id: String = ""
    var ratings: Rating = Rating()
    var user_ratings: Int = Int.random(in: 1..<999)
}

var productList = [ProductModel(id: "1234567", price: 15000, title: "Macbook Pro AV56 con Procesasdor M1", shipping: true)]
