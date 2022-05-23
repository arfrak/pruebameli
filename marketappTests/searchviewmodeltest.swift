 //
//  searchviewmodeltest.swift
//  marketappTests
//
//  Created by Andres Lopez on 23/05/22.
//

import XCTest
import Combine

class searchviewmodeltest: XCTestCase {

    func testCallApiGetProductsBySearch() throws {
        // given
        let viewModel = SearchViewModel()
        
        var finalURL = URLComponents(string: viewModel.baseUrl)
        finalURL?.queryItems = [URLQueryItem(name: "q", value: "Motorola")]
        
        // when
        let task = URLSession.shared.dataTask(with: (finalURL?.url!)!) { data, response, error in
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return
            }
            
            // then
            assert(response.statusCode == 200)
        }
        task.resume()
    }
}
