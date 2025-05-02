//
//  Users.swift
//  Taekwondo
//
//  Created by Reynald Marquez-Gragasin on 4/29/25.
//

import Foundation


struct LoginModel: Codable {
    let username: String
    let password: String
}

struct LoginResponse: Codable, Identifiable {
    let id: String?
    let firstname: String?
    let lastname: String?
    let fullname: String?
    let isactivated: String?
    let username: String?
    let email: String?
    let userpicture: String?
    let token: String?
    let role: String?
    let otp: String?
    let statuscode: String?
    let message: String?
    let success: Bool?
}

struct ForgotModel: Codable {
    let email: String
}

struct ForgotResponse: Codable {
    let statuscode: String
    let message: String
}
