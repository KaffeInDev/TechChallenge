//
//  MainContetViewModel.swift
//  VirnectTechChallenge
//
//  Created by JunKyung.Park on 2021/11/08.
//

import Foundation
import SwiftUI
import Combine
import CoreModular

class MainViewModel: ObservableObject {
    enum KindOfBooks: String {
        case computer = "컴퓨터"
        case travel = "여행"
        case music = "음악"
        case society = "사회"
    }
    @Published var results: [Model.Books.Book] = []
    @Published var kindOfBooks: KindOfBooks = .computer
    private var cancelables: Set<AnyCancellable> = Set()
    
    func searchBook(_ kind: KindOfBooks = .computer) {
        Remote<Model.Books>.search(kind.rawValue).asObservable()
            .replaceError(with: .mock)
            .map { $0.items }
            .print()
            .assign(to: \.results, on: self)
            .store(in: &cancelables)
    }
}
