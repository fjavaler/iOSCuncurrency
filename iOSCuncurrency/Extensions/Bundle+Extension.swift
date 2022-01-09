//
//  Bundle+Extension.swift
//  iOSCuncurrency
//
//  Created by Fred Javalera on 1/8/22.
//

import Foundation

extension Bundle {
  public func decode<T: Decodable>(_ type: T.Type,
                                   from file: String,
                                   dateDecodingStategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
                                   keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> T {
      guard let url = self.url(forResource: file, withExtension: nil) else {
          fatalError("Failed to locate \(file) in bundle.")
      }
      guard let data = try? Data(contentsOf: url) else {
          fatalError("Failed to load \(file) from bundle.")
      }
      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = keyDecodingStrategy
      decoder.dateDecodingStrategy = dateDecodingStategy
      guard let decodedData = try? decoder.decode(T.self, from: data) else {
          fatalError("Failed to decode \(file) from bundle.")
      }
      return decodedData
  }
}
