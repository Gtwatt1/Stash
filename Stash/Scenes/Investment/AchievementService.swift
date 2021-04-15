//
//  AchievementService.swift
//  Stash
//
//  Created by Olorunshola Godwin on 15/04/2021.
//

import Foundation

struct AchievementService {
    var repository: AchievementRepository
    
    func getAchievements() {
        
    }
}


protocol AchievementRepository {
    
    func get(completion: Result<[Achievement], Error>)
}


struct RemoteAchievementRepository: AchievementRepository {
    
    func get(completion: Result<[Achievement], Error>)  {
        
    }
}

struct LocalAchievementRepository: AchievementRepository {
    func get(completion: Result<[Achievement], Error>) {
        
    }
    
}
