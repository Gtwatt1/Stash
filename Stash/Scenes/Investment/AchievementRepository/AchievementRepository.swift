//
//  AchievementService.swift
//  Stash
//
//  Created by Olorunshola Godwin on 15/04/2021.
//

import Foundation

protocol AchievementRepository {
    
    func get(completion: (Result<[Achievement], AchievementError>) -> ())
}


struct RemoteAchievementRepository: AchievementRepository {
    
    func get(completion: (Result<[Achievement], AchievementError>) -> ())  {
        
    }
}

struct LocalAchievementRepository: AchievementRepository {
    func get(completion: (Result<[Achievement], AchievementError>) -> ()) {
        if let url = Bundle.main.url(forResource: "achievements", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let achievementResponse = try JSONDecoder().decode(AchievementResponse.self, from: data)
                completion(.success(achievementResponse.achievements))
            } catch {
                completion(.failure(.decodingFailed))
            }
        }
        completion(.failure(.fileNotFound))
    }
    
}
