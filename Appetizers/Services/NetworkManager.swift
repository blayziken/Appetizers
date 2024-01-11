//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Blaze on 18/12/2023.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals"
    private let appetizerURL = baseURL + "/appetizers"
    
    private init() {}
    
    
    //    func getAppetizers(completed: @escaping (Result<[Appetizer], NetworkError>) -> Void) {
    //
    //        // Check if url is valid
    //        guard let url = URL(string: appetizerURL) else {
    //            completed(.failure(.invalidURL))
    //            return
    //        }
    //
    //        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
    //            // Check if error is not nil
    //            if let _ = error {
    //                completed(.failure(.unableToComplete))
    //                return
    //            }
    //
    //            // if response is not nil -> cast as HTTPURLResponse and also check if 200
    //            guard let response = response as? HTTPURLResponse,  response.statusCode == 200 else {
    //                completed(.failure(.invalidResponse))
    //                return
    //            }
    //
    //            // check if we have valid data
    //            guard let data = data else {
    //                completed(.failure(.invalidData))
    //                return
    //            }
    //
    //            do {
    //                let decoder = JSONDecoder()
    //                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
    //                completed(.success(decodedResponse.request))
    //            } catch {
    //                completed(.failure(.invalidData))
    //            }
    //        }
    //
    //        task.resume()
    //    }
    //
    
    func getAppetizers() async throws -> [Appetizer] {
        guard let url = URL(string: appetizerURL) else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(AppetizerResponse.self, from: data).request
        } catch {
            throw NetworkError.invalidData
        }
    }
    
    
    func downloadImage(urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        // Check if image is in cache
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        // If cache does not have image
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            // Set image in cache
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}
