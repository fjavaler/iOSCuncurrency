//
//  APIService.swift
//  iOSCuncurrency
//
//  Created by Fred Javalera on 1/8/22.
//

import Foundation

enum APIError: Error {
  case invalidURL
  case invalidResponseStatus
  case dataTaskError
  case corruptData
  case decodingError
}

struct APIService {
  let urlString: String
  
  func getJSON<T: Decodable>(dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
                              keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
                              completion: @escaping (Result<T, APIError>) -> Void) {
    // Create and check url.
    guard
      let url = URL(string: urlString)
    else {
      completion(.failure(.invalidURL))
      return
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
      // Check for 200 status code
      guard
        let httpResponse = response as? HTTPURLResponse,
        httpResponse.statusCode == 200
      else {
        completion(.failure(.invalidResponseStatus))
        return
      }
      
      // Guard that no error returned.
      guard
        error == nil
      else {
        completion(.failure(.dataTaskError))
        return
      }
      
      // Check data returned.
      guard
        let data = data
      else {
        completion(.failure(.corruptData))
        return
      }
      
      // Decode data.
      let decoder = JSONDecoder()
      decoder.dateDecodingStrategy = dateDecodingStrategy
      decoder.keyDecodingStrategy = keyDecodingStrategy
      do {
        let decodedData = try decoder.decode(T.self, from: data)
        completion(.success(decodedData))
      } catch {
        completion(.failure(.decodingError))
      }
    }
    .resume()
  }
}
