//
//  model.swift
//  NasaImage
//
//  Created by Alex Diaz on 15/8/24.
//

import Foundation


// Clase para manejar la API
class APODFactory: ObservableObject {
    private let apiKey = "s6a4ds9RSQtwcUya17hDrehOSrUNrrxdLnq2cBvX"
    private let baseUrl = "https://api.nasa.gov/planetary/apod"
    
    @Published var apod: APOD?
    
    init() {
        print("Iniciando la descarga")
        fetchFromApiAPOD()
    }
    
    func fetchFromApiAPOD() {
        //verificar que exista la URL
        guard let url = URL(string: "\(baseUrl)?api_key=\(apiKey)") else {
            print("URL inválida")
            return
        }
        // hacer el request
        let request = URLRequest(url: url)
        // hacer el llamado de la API
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            // verificar que se reciban los datos
            guard let data = data else {
                print("No se recibieron datos")
                return
            }
            // descodificar los datos
            DispatchQueue.main.async {
                self?.parseJson(data: data)
            }
        }
        // hacer que la tarea se ejecute
        task.resume()
    }
    
    func parseJson(data: Data) {
        // hacer el descodficador
        let decoder = JSONDecoder()
        
        do {
            // decodificar los datos
            let apodData = try decoder.decode(APOD.self, from: data)
            // asignar los datos
            self.apod = apodData
        } catch {
            // mostrar el error
            print("Error al decodificar JSON: \(error.localizedDescription)")
        }
    }
}
// el struct de la API
struct APOD: Codable {
    let date: String
    let imageUrl: String
    let imageHDUrl: String
    let explanation: String
    let title: String
    let mediaType: String
    
    // las keys
    enum CodingKeys: String, CodingKey {
        case date
        case imageUrl = "url"
        case imageHDUrl = "hdurl"
        case explanation
        case title
        case mediaType = "media_type"
    }
    
    init(date: String, imageUrl: String, imageHDUrl: String, explanation: String, title: String, mediaType: String) {
        self.date = date
        self.imageUrl = imageUrl
        self.imageHDUrl = imageHDUrl
        self.explanation = explanation
        self.title = title
        self.mediaType = mediaType
    }
    // el decoder
    init(from decoder: Decoder) throws {
        // pasar los datos del json al container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // sacar los datos del container a cada variable.
        self.date = try container.decode(String.self, forKey: .date)
        self.imageUrl = try container.decode(String.self, forKey: .imageUrl)
        self.imageHDUrl = try container.decode(String.self, forKey: .imageHDUrl)
        self.explanation = try container.decode(String.self, forKey: .explanation)
        self.title = try container.decode(String.self, forKey: .title)
        self.mediaType = try container.decode(String.self, forKey: .mediaType)
    }
}
