//
//  AchievementService.swift
//  Stash
//
//  Created by Olorunshola Godwin on 15/04/2021.
//

import Foundation

protocol AchievementServiceProtocol {
    func getAchievements(completion: (Result<[Achievement], AchievementError>) -> ()) 
}

struct AchievementsListService: AchievementServiceProtocol {
    var repository: AchievementRepository
    
    func getAchievements(completion: (Result<[Achievement], AchievementError>) -> ()) {
        repository.get(completion: completion)
    }
}
