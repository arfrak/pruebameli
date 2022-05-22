//
//  StarView.swift
//  marketapp
//
//  Created by Andres Lopez on 22/05/22.
//

import SwiftUI

struct StarView: View {
    var imageName = "graystaricon"
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
    }
}

struct StarView_Previews: PreviewProvider {
    static var previews: some View {
        StarView()
    }
}
