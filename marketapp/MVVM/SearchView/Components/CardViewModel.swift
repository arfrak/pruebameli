//
//  CardViewModel.swift
//  marketapp
//
//  Created by Andres Lopez on 20/05/22.
//

import SwiftUI
import Combine

class CardViewModel: ObservableObject {
    @Published var formatPrice: String = ""
    @Published var formatTitle: String = ""
    
    func getFormatPrice(price: Int) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 0
        formatPrice = formatter.string(from: price as NSNumber)!
    }
    
    func getFormatTitle(title: String) {
        formatTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
