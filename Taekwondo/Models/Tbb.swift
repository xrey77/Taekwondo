//
//  Tbb.swift
//  Taekwondo
//
//  Created by Reynald Marquez-Gragasin on 5/5/25.
//

import Foundation

struct Tbb: Codable, Identifiable {
    let id: String?
    let firstname: String?
    let lastname: String?
    let middlename: String?
    let fullname: String?
    let emailadd: String?
    let homeadd: String?
    let mobileno: String?
    let batch: String?
    let dan: String?
    let picture: String?
}


struct Tbb1: Decodable, Identifiable {
    let id: Int
    let firstname: String
    let lastname: String
    let middlename: String
    let emailadd: String
    let homeadd: String
    let mobileno: String
    let batch: Int
    let dan: String
    let picture: String
}


struct Tbb2: Decodable, Identifiable {
    let id: Int
    let firstname: String
    let lastname: String
    let middlename: String
    let emailadd: String
    let homeadd: String
    let mobileno: String
    let batch: Int
    let dan: String
    let picture: String
}

struct Tbb3: Decodable, Identifiable {
    let id: Int
    let firstname: String
    let lastname: String
    let middlename: String
    let emailadd: String
    let homeadd: String
    let mobileno: String
    let batch: Int
    let dan: String
    let picture: String
}

struct Tbb4: Decodable, Identifiable {
    let id: Int
    let firstname: String
    let lastname: String
    let middlename: String
    let emailadd: String
    let homeadd: String
    let mobileno: String
    let batch: Int
    let dan: String
    let picture: String
}
