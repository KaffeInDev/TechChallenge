//
//  DetailContentViewModel.swift
//  VirnectTechChallenge
//
//  Created by JunKyung.Park on 2021/11/09.
//

import Foundation
import Combine
import CoreModular

class DetailContentViewModel: ObservableObject {
    @Published var books: [Model.Books.Item] = []
    private var cancelables: Set<AnyCancellable> = Set()
    var isbn: String = .empty
    func searchBook() {
        Remote<Model.Books>.search(isbn: isbn).asObservable()
            .replaceError(with: .mock)
            .map { $0.items }
            .print()
            .assign(to: \.books, on: self)
            .store(in: &cancelables)
    }
}
