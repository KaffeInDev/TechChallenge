//
//  MainContentView.swift
//  VirnectTechChallenge
//
//  Created by JunKyung.Park on 2021/11/08.
//

import SwiftUI

struct MainContentView: View {
    // MARK: - typealias
    typealias KindOfBooks = MainViewModel.KindOfBooks
    // MARK: - Views
    var body: some View {
        TabView {
            ForEach(KindOfBooks.allCases) { item in
                MainListContentView(item)
                .tabItem {
                    Label(
                        item.rawValue,
                        systemImage: item.imageName
                    )
                }
                
            }
        }
        .font(.headline)
    }
}
// MARK: - previews
struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}
