//
//  DetailContentView.swift
//  VirnectTechChallenge
//
//  Created by JunKyung.Park on 2021/11/09.
//

import SwiftUI
import Combine
import CoreModular

struct DetailContentView: View {
    @ObservedObject var model = DetailContentViewModel()
    var body: some View {
        List(model.books, id: \.isbn) { item in
            asyncImage(URL(string: item.image))
                .listRowSeparator(.hidden)
            Text("제목 " + item.plainTitle())
                .listRowSeparator(.hidden)
                .lineSpacing(15)
            Text("저자 : " + item.author)
                .listRowSeparator(.hidden)
                .lineSpacing(15)
            Text("가격: " + item.price)
                .listRowSeparator(.hidden)
                .lineSpacing(15)
            Text("할인가 : " + item.discount)
                .listRowSeparator(.hidden)
                .lineSpacing(15)
            Text("상세 : " + item.bookDescription)
                .listRowSeparator(.hidden)
                .lineSpacing(15)
        }.onAppear(perform: loadData)
    }
    
    init(_ isbn: String = .empty) {
        model.isbn = isbn
    }
    
    func loadData() {
        model.searchBook()
    }
    
    func asyncImage(_ url: URL?) -> some View {
        AsyncImage(url: url) { image in
            image.resizable()
                .aspectRatio(contentMode: .fit)
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
        .frame(alignment: .center)
        .lineSpacing(15)
    }
}

struct DetailContentView_Previews: PreviewProvider {
    static var previews: some View {
        DetailContentView()
    }
}


