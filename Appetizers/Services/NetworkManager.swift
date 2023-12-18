//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Blaze on 18/12/2023.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentalse"
    private let appetizerURL = baseURL + "/appetizers"
    
    private init() {}
    
    
    func getAppetizers(completed: @escaping (Result<[Appetizer], NetworkError>) -> Void) {
        
        // Check if url is valid
        guard let url = URL(string: appetizerURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            // Check if error is not nil
            guard let _ = error else {
                completed(.failure(.unableToComplete))
                return
            }
            
            // if response is not nil -> cast as HTTPURLResponse and also check if 200
            guard let response = response as? HTTPURLResponse,  response.statusCode == 200 else {
                
            }
        }
    }
    
}
