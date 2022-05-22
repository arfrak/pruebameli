//
//  HomeView.swift
//  marketapp
//
//  Created by Andres Lopez on 19/05/22.
//

import SwiftUI

struct HomeView: View {
    @State var showSearh: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                }
                VStack {}
                .frame(maxWidth: .infinity)
                .background(Color("Background"))
            }
            .navigationTitle("Home")
            .toolbar {
                HStack {
                    Button {
                        showSearh.toggle()
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 17, weight: .bold))
                            .frame(width: 36, height: 36)
                            .foregroundColor(Color("TextBackground"))
                            .background(.ultraThinMaterial)
                            .backgroundStyle(cornerRadius: 14, opacity: 0.4)
                    }
                    .fullScreenCover(isPresented: $showSearh) {
                        SearchView(isPresented: $showSearh)
                    }
                    .padding(.top, 5)
                }
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .navigationBar(backgroundColor: Color("Background"), titleColor: Color("TextBackground"))
        }.navigationViewStyle(.stack)
    }
}

extension View {
    @available(iOS 14, *)
    func navigationBar(backgroundColor: Color, titleColor: Color) -> some View {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor(backgroundColor)

        let uiTitleColor = UIColor(titleColor)
        appearance.largeTitleTextAttributes = [.foregroundColor: uiTitleColor]
        appearance.titleTextAttributes = [.foregroundColor: uiTitleColor]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        return self
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
