//
//  models.swift
//  guiaApp
//
//  Created by Alex Diaz on 11/8/24.
//

import Foundation
import SwiftUI
// Aqui estaran todos los modelos de datos de la app.

//hacer mis propios colores con una extension de color

extension Color {
    static var mainColor: Color {
        Color("MainColor")
    }
    
    static var lightBlue: Color {
        Color("LightColor")
    }
    
    static var darkBlue: Color {
        Color("DarkColor")
    }
    
    static var textFieldColor: Color {
        Color("TextFieldColor")
    }
    
    static var grayOwnColor: Color {
        Color("GrayColor")
    }
}

extension View {
    func defaultButtonStyle() -> some View {
        self
            .padding()
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .background(Color.mainColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

enum Nationality: String, CaseIterable, Codable {
    case nicaraguan = "Nicaraguan"
    case american = "American"
    case canadian = "Canadian"
    case mexican = "Mexican"
    case spanish = "Spanish"
    case french = "French"
    case german = "German"
    case italian = "Italian"
    case japanese = "Japanese"
    case chinese = "Chinese"
    case indian = "Indian"
    case brazilian = "Brazilian"
    case argentinian = "Argentinian"
    case colombian = "Colombian"
    case australian = "Australian"
    case british = "British"
    case russian = "Russian"
    case southAfrican = "South African"
}

enum ActivityTourism: String, CaseIterable {
    case family = "Family"
    case adventure = "Adventure"
    case relax = "Relax"
    case beach = "Beach"
    case culture = "Culture"
    case other = "Other"
}

enum Gender: String, CaseIterable {
    case male = "Male"
    case female = "Female"
    case other = "Other"
}

enum TravelingCompany: String, CaseIterable {
    case solo = "Solo"
    case company = "Company"
}

struct OnboardingViewModel {
    var title: String
    var description: String
    var image: String
    var buttonTitle: String
}
