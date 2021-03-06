//
//  DetailViewModel.swift
//  marketapp
//
//  Created by Andres Lopez on 22/05/22.
//

import SwiftUI
import Combine

class  DetailViewModel: ObservableObject {
    @Published var arrayStarComponent: [StarView] = []
    @Published var productCondition: String = ""
    @Published var mercadopagoCondition: String = ""
    @Published var colorStatus: Color = Color.red
    @Published var valueStatus: Int = 0
    @Published var formatTitle: String = ""
    
    func getcalificationValue(value: Int) {
        arrayStarComponent.removeAll()
        for i in 1...5 {
            var view = StarView(imageName: "bluestaricon")
            if(i == 5) {
                if(value >= 81 && value <= 84) {
                    view = StarView(imageName: "graystaricon")
                }
                else if(value > 84 && value <= 94) {
                    view = StarView(imageName: "combinestaricon")
                }
            }
            arrayStarComponent.append(view)
        }
    }
    
    func getProductCondition(condition: String) {
        if(condition == "new") {
            productCondition = NSLocalizedString("new", comment: "")
        } else {
            productCondition = NSLocalizedString("secondhand", comment: "")
        }
    }
    
    func getMercadoPagoCondition(condition: Bool) {
        if(condition) {
            mercadopagoCondition = NSLocalizedString("yesresponse", comment: "")
        } else {
            mercadopagoCondition = NSLocalizedString("noresponse", comment: "")
        }
    }
    
    func getColorStatus(value: Double) {
        let calculateValue = (value * 100)
        if(calculateValue >= 35 && calculateValue <= 80) {
            colorStatus = Color.yellow
        } else if(calculateValue >= 81) {
            colorStatus = Color.green
        }
    }
    
    func getFormatTitle(title: String) {
        formatTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
