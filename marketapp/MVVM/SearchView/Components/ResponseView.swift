//
//  ResponseView.swift
//  marketapp
//
//  Created by Andres Lopez on 22/05/22.
//

import SwiftUI

struct ResponseView: View {
    var message: String = ""
    var image: String = ""
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            VStack(alignment: .center) {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 190)
                
                Text(message)
                    .multilineTextAlignment(.center)
                    .multilineTextAlignment(.leading)
                    .font(Font.custom("Roboto-Medium", size: 15))
                    .foregroundColor(Color("TextBackground"))
            }
        }
    }
}

struct ResponseView_Previews: PreviewProvider {
    static var previews: some View {
        ResponseView()
    }
}
