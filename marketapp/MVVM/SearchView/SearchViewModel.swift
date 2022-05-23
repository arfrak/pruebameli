//
//  SearchViewModel.swift
//  marketapp
//
//  Created by Andres Lopez on 19/05/22.
//

import Foundation
import Combine
import SwiftyJSON 
import UIKit

class SearchViewModel: ObservableObject {
    public let baseUrl = "https://api.mercadolibre.com/sites/MLA/search"
    
    @Published var productsList: [ProductModel] = []
    @Published var isLoading: Bool = false
    @Published var errorResponse: Bool = false
    @Published var notResult: Bool = false
        
    func getProductsBySearch(parameters: String) {
        var finalURL = URLComponents(string: baseUrl)
        finalURL?.queryItems = [URLQueryItem(name: "q", value: parameters)]
        let task = URLSession.shared.dataTask(with: (finalURL?.url!)!) { data, response, error in

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.errorResponse = true
                }
                return
            }
            
            guard let data = data, error == nil else {
                // check for fundamental networking error
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.errorResponse = true
                }
                return
            }
            
            do {
                let results = JSON(data)["results"]
                
                var list: [ProductModel] = []
                
                for n in 0..<results.count {
                    var product = ProductModel()
                    product.title = results[n]["title"].stringValue
                    product.price = results[n]["price"].intValue
                    product.image = results[n]["thumbnail"].stringValue
                    product.shipping = results[n]["shipping"]["free_shipping"].boolValue
                    product.accepts_mercadopago = results[n]["accepts_mercadopago"].boolValue
                    product.available_quantity = results[n]["available_quantity"].intValue
                    product.condition = results[n]["condition"].stringValue
                    product.power_seller_status = results[n]["seller"]["seller_reputation"]["power_seller_status"].stringValue
                    product.level_id = results[n]["seller"]["seller_reputation"]["level_id"].stringValue
                    let negative = results[n]["seller"]["seller_reputation"]["transactions"]["ratings"]["negative"].doubleValue
                    let neutral = results[n]["seller"]["seller_reputation"]["transactions"]["ratings"]["neutral"].doubleValue
                    let positive = results[n]["seller"]["seller_reputation"]["transactions"]["ratings"]["positive"].doubleValue
                    product.ratings = Rating(negative: negative, neutral: neutral, positive: positive)
                    list.append(product)
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.productsList = list
                    self.isLoading = false
                    
                    if(list.isEmpty) {
                        self.notResult = true
                    }
                }
            }
        }
        task.resume()
    }
}
