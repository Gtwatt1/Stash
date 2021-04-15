//
//  InvestmentPresenter.swift
//  Stash
//
//  Created by Olorunshola Godwin on 15/04/2021.
//

import Foundation

protocol AchievementsListPresenterInput {
    func getAchievements()
}

protocol AchievementsListPresenterOutput: class {
    func displayAchievements(achievements: [AchievementListViewModel])
    func displayError(error: String)
}


class AchievementsListPresenter: AchievementsListPresenterInput {

    var interactor: AchievementsListInteractorInput?
    weak var view: AchievementsListPresenterOutput?

    func getAchievements() {
        interactor?.getAchievements()
    }
}


extension AchievementsListPresenter: AchievementsListInteractorOutput {
    
    func didGetAchievements(achievements: [Achievement]) {
        var achievementsViewModels = [AchievementListViewModel]()
        achievements.forEach {
            achievementsViewModels.append(AchievementListViewModel(achievement: $0))
        }
        view?.displayAchievements(achievements: achievementsViewModels)
    }

    func didFailToGetAchievements(error: String) {
        view?.displayError(error: error)
    }
}


