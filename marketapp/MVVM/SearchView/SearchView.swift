//
//  SearchView.swift
//  marketapp
//
//  Created by Andres Lopez on 19/05/22.
//

import SwiftUI
import Introspect

struct SearchView: View {
    @Binding var isPresented: Bool
    @State var internetConnection: Bool = true
    @State var text: String = ""
    var characterLimit = 30
    
    @ObservedObject var viewModel = SearchViewModel()
    @ObservedObject var networkMonitor = NetworkManager()
    
    var body: some View {
        NavigationView {
            VStack() {
                VStack(alignment: .center) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.black)
                            .frame(width: 25, height: 25, alignment: .center)
                            .imageScale(.medium)
                            .padding(.leading, 5)
                        TextField("", text: $text, onCommit: {
                            if(!text.isEmpty) {
                                if(networkMonitor.isConnected) {
                                    viewModel.getProductsBySearch(parameters: text)
                                    viewModel.isLoading = true
                                    viewModel.errorResponse = false
                                    viewModel.notResult = false
                                    internetConnection = true
                                } else {
                                    internetConnection = false
                                }
                            }
                        })
                        .disableAutocorrection(true)
                        .foregroundColor(Color.black)
                        .placeholder(when: text.isEmpty) {
                                Text("searchindicator").foregroundColor(.gray)
                        }
                        .introspectTextField(customize: {
                            $0.becomeFirstResponder()
                            $0.clearButtonMode = .whileEditing
                        })
                        .padding(.trailing, 10)
                        .onReceive(text.publisher.collect()) {
                            let s = String($0.prefix(characterLimit))
                            if text != s {
                                text = s
                            }
                        }
                    }
                    .frame(width: 300, height: 35, alignment: .center)
                    .background(Color.white)
                    .clipShape(Capsule())
                    
                }
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(Color("Background"))
                
                if(internetConnection) {
                    if viewModel.isLoading {
                        LoadingView()
                    } else {
                        if(viewModel.errorResponse) {
                            ResponseView(message: NSLocalizedString("errorresponse", comment: ""), image: "error")
                        } else {
                            if(viewModel.notResult) {
                                ResponseView(message: NSLocalizedString("noresults", comment: ""), image: "nosearchresult")
                            } else {
                                ProductListView(productList: viewModel.productsList)
                            }
                        }
                    }
                } else {
                    ResponseView(message: NSLocalizedString("nointernet", comment: ""), image: "noconnection")
                }
            }
            .navigationTitle("search")
            .toolbar {
                VStack {
                    Button {
                        isPresented.toggle()
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
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .navigationBar(backgroundColor: Color("Background"), titleColor: Color("TextBackground"))
        }
        .navigationViewStyle(.stack)
        .onAppear {
            networkMonitor.startMonitor()
        }
        .onDisappear {
            networkMonitor.cancelMonitor()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(isPresented: .constant(false))
    }
}
