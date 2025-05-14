//
//  Profile.swift
//  Taekwondo
//
//  Created by Reynald Marquez-Gragasin on 5/14/25.
//

import Foundation

struct Profile: Codable, Identifiable {
    let id: String?
    let firstname: String?
    let lastname: String?
    let email: String?
    let mobile: String?
    let isactivated: String?
    let userpicture: String?
    let message: String?
    let otp: String?
    let statuscode: String?
    let username: String?
}


struct Updateprofile: Codable {
    let firstname: String
    let lastname: String
    let mobile: String
}

struct UPdateprofileResponse: Codable {
    let statuscode: String?
    let message: String?
}


struct Changepassword: Codable {
    let password: String
}

struct ChangepasswordResponse: Codable {
    let statuscode: String?
    let message: String?
}

struct Updatepicture: Codable {
    let userpicture: String
}

struct UpdatepictureResponse: Codable {
    let statuscode: String?
    let message: String?
}
