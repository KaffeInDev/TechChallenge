//
//  MainListContentView.swift
//  VirnectTechChallenge
//
//  Created by JunKyung.Park on 2021/11/09.
//

import SwiftUI

struct MainListContentView: View {
    @ObservedObject var model = MainViewModel()
    @State var results: [Model.Books.Book] = []
    var body: some View {
        NavigationView {
            List(model.results, id: \.title) { item in
                HStack(alignment: .bottom) {
                    asyncImage(URL(string: item.image))
                    Text(item.palinTitle())
                        .frame(height: 50, alignment: .leading)
                    
                }
                
            }
            .navigationTitle("네이버 도서")
            .onAppear(perform: loadData)
            .environment(\.defaultMinListRowHeight, 44)
        }
    }
    
    init(_ tabKind: MainViewModel.KindOfBooks = .computer) {
        model.kindOfBooks = tabKind
    }
    
    func loadData() {
        model.searchBook(model.kindOfBooks)
    }
    
    func asyncImage(_ url: URL?) -> some View {
        AsyncImage(url: url) { image in
            image.resizable()
                .aspectRatio(contentMode: .fit)
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 50, height: 50)
        .lineSpacing(10)
    }
}

struct MainListContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainListContentView()
    }
}
