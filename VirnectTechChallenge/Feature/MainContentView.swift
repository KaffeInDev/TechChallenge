//
//  MainContentView.swift
//  VirnectTechChallenge
//
//  Created by JunKyung.Park on 2021/11/08.
//

import SwiftUI

struct MainContentView: View {
    
    typealias KindOfBooks = MainViewModel.KindOfBooks
    var body: some View {
        
        TabView {
            MainListContentView(.computer)
            .tabItem {
                Label(
                    KindOfBooks.computer.rawValue,
                    systemImage: "desktopcomputer"
                )
                
            }
            MainListContentView(.society)
            .tabItem {
                Label(
                    KindOfBooks.society.rawValue,
                    systemImage: "person.3"
                )
                
            }
            MainListContentView(.music)
            .tabItem {
                Label(
                    KindOfBooks.music.rawValue,
                    systemImage: "music.note"
                )
                
            }
            MainListContentView(.travel)
            .tabItem {
                Label(
                    KindOfBooks.travel.rawValue,
                    systemImage: "airplane"
                )
            }
        }
        .font(.headline)
    }
}

struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}
