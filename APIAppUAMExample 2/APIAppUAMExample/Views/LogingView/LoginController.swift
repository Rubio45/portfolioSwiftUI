//
//  LoginController.swift
//  APIAppUAMExample
//
//  Created by Macbook on 4/10/24.
//

import Foundation

final class LoginController {
    private let apiDataSource = APIDataSource()
    
    func login(username: String, password: String) async -> LoginResponse? {
        await apiDataSource.logIn(username: username, password: password)
    }
    
    func isLoggedIn() -> Bool {
        // Logica para saber cuanto tiempo ha pasado desde que el usuario se logueo por ultima vez. Si existe el token, pero han pasado 5 minutos(300 segundos), entonces debe loguearse de nuevo. 
        guard let date = UserDefaults.standard.object(forKey: "date") as? Date else { return false }
        let timeSinceLastLogin = Date().timeIntervalSince(date)
        
        return (apiDataSource.getToken() != nil) && timeSinceLastLogin < 300 ? true : false
    }
}
