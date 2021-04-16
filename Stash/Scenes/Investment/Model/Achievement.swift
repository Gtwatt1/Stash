//
//  Achievement.swift
//  Stash
//
//  Created by Olorunshola Godwin on 15/04/2021.
//

import Foundation

struct AchievementResponse: Codable {
    let success: Bool
    let status: Int
    let overview: Overview
    let achievements: [Achievement]
}

// MARK: - Achievement
struct Achievement: Codable {
    let id: Int
    let level: String
    let progress, total: Int
    let bgImageURL: String
    let accessible: Bool

    enum CodingKeys: String, CodingKey {
        case id, level, progress, total
        case bgImageURL = "bg_image_url"
        case accessible
    }
    
}

// MARK: - Overview
struct Overview: Codable {
    let title: String
}
