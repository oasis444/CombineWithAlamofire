//
//  RandomUserResponse.swift
//  CombineWithAlamofire
//
//  Copyright (c) 2023 oasis444. All right reserved.
//

import Foundation

struct RandomUserResponse: Codable, CustomStringConvertible {
    let results: [RandomUser]
    let info: Info
    
    var description: String {
        return "results.count: \(results.count) / info: \(info.seed)"
    }
}

struct RandomUser: Codable, Identifiable {
    var id = UUID()
    let name: Name
    let photo: Photo
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case photo = "picture"
    }
    
    var profileImgUrl: URL {
        return URL(string: photo.medium)!
    }
    
    static func getDummy() -> Self {
        return RandomUser(name: Name.getDummy(), photo: Photo.getDummy())
    }
}

struct Name: Codable, CustomStringConvertible {
    let title: String
    let first: String
    let last: String
    
    var description: String {
        return "[\(title)] \(last), \(first)"
    }
    
    static func getDummy() -> Self {
        return Name(title: "Dev", first: "oasis444", last: "iOS")
    }
}

struct Photo: Codable {
    let large: String
    let medium: String
    let thumbnail: String
    
    static func getDummy() -> Self {
        return Photo(
            large: "https://randomuser.me/api/portraits/women/40.jpg",
            medium: "https://randomuser.me/api/portraits/women/40.jpg",
            thumbnail: "https://randomuser.me/api/portraits/women/40.jpg"
        )
    }
}

struct Info: Codable {
    let seed: String
    let resultsCont: Int
    let page: Int
    let version: String
    
    private enum CodingKeys: String, CodingKey {
        case seed = "seed"
        case resultsCont = "results"
        case page = "page"
        case version = "version"
    }
}
