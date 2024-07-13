//
//  ChatUser.swift
//  MyMessaging
//
//  Created by Süha Karakaya on 5.03.2024.
//

import FirebaseFirestoreSwift

struct ChatUser: Codable, Identifiable {
    @DocumentID var id: String?
    let uid, email, profileImageUrl: String
}
