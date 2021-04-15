//
//  AchievementService.swift
//  Stash
//
//  Created by Olorunshola Godwin on 15/04/2021.
//

import Foundation

protocol AchievementServiceProtocol {
    func getAchievements(completion: @escaping (Result<[Achievement], AchievementError>) -> Void)
}

struct AchievementsListService: AchievementServiceProtocol {
    var repository: AchievementRepository

    func getAchievements(completion: @escaping (Result<[Achievement], AchievementError>) -> Void) {
        repository.get(completion: completion)
    }
}
