//
//  AchievementService.swift
//  Stash
//
//  Created by Olorunshola Godwin on 15/04/2021.
//

import Foundation

protocol AchievementRepository {

    func get(completion: (Result<[Achievement], AchievementError>) -> Void)
}

struct RemoteAchievementRepository: AchievementRepository {

    func get(completion: (Result<[Achievement], AchievementError>) -> Void) {

    }
}

struct LocalAchievementsListRepository: AchievementRepository {
    func get(completion: (Result<[Achievement], AchievementError>) -> Void) {
        guard let url = Bundle.main.url(forResource: "achievements", withExtension: "json") else {
            completion(.failure(.fileNotFound))
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let achievementResponse = try JSONDecoder().decode(AchievementResponse.self, from: data)
            completion(.success(achievementResponse.achievements))
        } catch {
            completion(.failure(.decodingFailed))
        }
    }
}
