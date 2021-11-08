//
//  Model+Remote.swift
//  VirnectTechChallenge
//
//  Created by JunKyung.Park on 2021/11/08.
//

import Foundation
import CoreModular

struct Model: Codable {}
extension Model {
    // MARK: - Books
    struct Books: Codable {
        static let mock: Self = .init(total: .zero, start: .zero, display: .zero, items: [])
        
        let total: Int
        let start: Int
        let display: Int
        let items: [Item]
        
        // MARK: - Item
        struct Item: Codable {
            var title: String
            var link: String
            var image: String
            var author, price, discount, publisher: String
            var pubdate, isbn, bookDescription: String

            enum CodingKeys: String, CodingKey {
                case title, link, image, author, price, discount, publisher, pubdate, isbn
                case bookDescription = "description"
            }
            
            func plainTitle() -> String {
                title.replacingOccurrences(
                    of: "<[^>]+>",
                    with: "",
                    options: .regularExpression,
                    range: nil
                )
            }
        }
    }
}

extension Remote where T == Model.Books {
    static func search(_ keyword: String) -> Remote {
        let instance = Remote(
            "/v1/search/book" ,
            parameters: [URLQueryItem(name: "query", value: keyword)] ,
            method: .get
        )
        print(instance.urlComponents)
        return instance
    }
    
    static func search(isbn: String) -> Remote {
        let instance = Remote(
            "/v1/search/book_adv",
            parameters: [URLQueryItem(name: "d_isbn", value: isbn)],
            method: .get
        )
        return instance
    }
}




