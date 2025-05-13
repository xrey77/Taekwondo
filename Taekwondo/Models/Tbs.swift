//
//  Tbs.swift
//  Taekwondo
//
//  Created by Reynald Marquez-Gragasin on 5/13/25.
//

import Foundation

struct Tbs: Codable, Identifiable {
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


struct Tbs1: Decodable, Identifiable {
    let id: Int
    let firstname: String
    let lastname: String
    let middlename: String
    let fullname: String?
    let emailadd: String
    let homeadd: String
    let mobileno: String
    let batch: Int
    let dan: String
    let picture: String
}


struct Tbs2: Decodable, Identifiable {
    let id: Int
    let firstname: String
    let lastname: String
    let middlename: String
    let fullname: String?
    let emailadd: String
    let homeadd: String
    let mobileno: String
    let batch: Int
    let dan: String
    let picture: String
}

struct Tbs3: Decodable, Identifiable {
    let id: Int
    let firstname: String
    let lastname: String
    let middlename: String
    let fullname: String?
    let emailadd: String
    let homeadd: String
    let mobileno: String
    let batch: Int
    let dan: String
    let picture: String
}

struct Tbs4: Decodable, Identifiable {
    let id: Int
    let firstname: String
    let lastname: String
    let middlename: String
    let fullname: String?
    let emailadd: String
    let homeadd: String
    let mobileno: String
    let batch: Int
    let dan: String
    let picture: String
}


