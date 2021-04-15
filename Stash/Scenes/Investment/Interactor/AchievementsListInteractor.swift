//
//  AchievementsListInteractor.swift
//  Stash
//
//  Created by Olorunshola Godwin on 15/04/2021.
//

import Foundation

protocol AchievementsListInteractorInput {
    
    func getAchievements()
}

protocol AchievementsListInteractorOutput: class {
    func didGetAchievements(achievements: [Achievement])
    func didFailToGetAchievements(error: String)
}

class AchievementsListInteractor: AchievementsListInteractorInput {
    
    var achievementService: AchievementServiceProtocol?
    weak var presenter: AchievementsListInteractorOutput?
    
    func getAchievements() {
        achievementService?.getAchievements { (result) in
            switch result {
            case .failure(let error):
                presenter?.didFailToGetAchievements(error: error.localizedDescription)
            case .success(let achievements):
                presenter?.didGetAchievements(achievements: achievements)
            }
        }
    }
}
