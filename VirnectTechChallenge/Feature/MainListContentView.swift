//
//  MainListContentView.swift
//  VirnectTechChallenge
//
//  Created by JunKyung.Park on 2021/11/09.
//

import SwiftUI

struct MainListContentView: View {
    // MARK: - viewModel
    @ObservedObject var model = MainViewModel()
    // MARK: - Views
    var body: some View {
        NavigationView {
            List(model.books, id: \.title) { item in
                NavigationLink(destination: DetailContentView(item.isbn)) {
                    HStack(alignment: .bottom) {
                        asyncImage(URL(string: item.image))
                        Text(item.plainTitle())
                            .frame(height: 50, alignment: .leading)
                        
                    }
                }
            }
            .navigationTitle("네이버 도서")
            .onAppear(perform: loadData)
            .environment(\.defaultMinListRowHeight, 44)
        }
    }
    // MARK: - initializer
    init(_ tabKind: MainViewModel.KindOfBooks = .computer) {
        model.kindOfBooks = tabKind
    }
    // MARK: - load data from remote
    func loadData() {
        model.searchBook()
    }
    // MARK: - load image from remote
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
// MARK: - previews
struct MainListContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainListContentView()
    }
}
