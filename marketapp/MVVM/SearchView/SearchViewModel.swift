//
//  SearchViewModel.swift
//  marketapp
//
//  Created by Andres Lopez on 19/05/22.
//

import Foundation
import Combine
import SwiftyJSON

class SearchViewModel: ObservableObject {
    private let baseUrl = "https://api.mercadolibre.com/sites/MLA/search"
    private var task: AnyCancellable?
    
    @Published var productsList: [ProductModel] = []
    
    func getProductsBySearch(parameters: String) {
        var finalURL = URLComponents(string: baseUrl)
        finalURL?.queryItems = [URLQueryItem(name: "q", value: parameters)]
        let task = URLSession.shared.dataTask(with: (finalURL?.url!)!) { [self] data, response, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                fatalError("Error: invalid HTTP response code")
            }
            guard let data = data else {
                fatalError("Error: missing response data")
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
                
                DispatchQueue.main.async {
                    self.productsList = list
                }
            }
        }
        task.resume()
    }
}