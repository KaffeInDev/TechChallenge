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
    // MARK: - dynamic observable wrapper
    @Published var books: [Model.Books.Item] = []
    var isbn: String = .empty
    private var cancelables: Set<AnyCancellable> = Set()
    // MARK: - remote for search book(isbn) api
    func searchBook() {
        Remote<Model.Books>.search(isbn: isbn).asObservable()
            .replaceError(with: .mock)
            .map { $0.items }
            .print()
            .assign(to: \.books, on: self)
            .store(in: &cancelables)
    }
}
