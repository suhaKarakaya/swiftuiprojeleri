//
//  ChatMessage.swift
//  MyMessaging
//
//  Created by Süha Karakaya on 6.03.2024.
//

import Foundation
import FirebaseFirestoreSwift

struct ChatMessage: Codable, Identifiable {
    @DocumentID var id: String?
    let fromId, toId, text: String
    let timestamp: Date
}
