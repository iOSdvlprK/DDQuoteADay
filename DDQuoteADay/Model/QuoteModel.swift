//
//  QuoteModel.swift
//  DDQuoteADay
//
//  Created by joe on 8/29/25.
//

import Foundation

struct QuoteModel: Codable {
    let id, content, author: String
    let tags: [String]
    let authorSlug: String
    let length: Int
    let dateAdded, dateModified: String

    enum CodingKeys: String, CodingKey {
        case id
        case content, author, tags, authorSlug, length, dateAdded, dateModified
    }
    
    static func defaultQuote() -> QuoteModel {
        return QuoteModel(
            id: "J-47k8g-i",
            content: "Love is a friendship set to music.",
            author: "Joseph Campbell",
            tags: ["friendship", "love"],
            authorSlug: "joseph-campbell",
            length: 34,
            dateAdded: "2019-03-17",
            dateModified: "2019-03-17"
        )
    }
}
