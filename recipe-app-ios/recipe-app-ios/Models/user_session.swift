//
//  user_session.swift
//  recipe-app-ios
//
//  Created by efe arslan on 27.07.2025.
//
import SwiftUI
import Foundation

class user_session: ObservableObject {
    @AppStorage("kullanici_id") var kullanici_id: Int = 0
    @AppStorage("kullanici_nm") var kullanici_nm: String = ""
    @AppStorage("email_adres") var email: String = ""
    
    var isLoggedIn: Bool {
        return kullanici_id != 0
    }
}
