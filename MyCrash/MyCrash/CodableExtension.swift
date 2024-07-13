//
//  CodableExtension.swift
//  MyCrash
//
//  Created by Süha Karakaya on 3.08.2023.
//

import Foundation

extension Encodable {

    public var toDictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }

    public var toJsonString: String? {
        guard let data = try? JSONEncoder().encode(self),
              let jsonString = String(data: data, encoding: .utf8) else { return nil }
        return jsonString
    }
}
