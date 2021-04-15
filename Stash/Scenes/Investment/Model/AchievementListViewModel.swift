//
//  AchievementViewModel.swift
//  Stash
//
//  Created by Olorunshola Godwin on 15/04/2021.
//

import Foundation

struct AchievementListViewModel: Codable {
    let level: String
    let progress, total: String
    let progressFloat: Float
    let bgImageURL: URL?
    let accessible: Bool

    init(achievement: Achievement) {
        let pointTitle = NSLocalizedString("Points", comment: "")
        total = "\(achievement.total) \(pointTitle)"
        progress = "\(achievement.progress) \(pointTitle)"
        level = achievement.level
        bgImageURL = URL(string: achievement.bgImageURL)
        progressFloat = Float(achievement.progress) / Float(achievement.total)
        accessible = achievement.accessible
    }
}
