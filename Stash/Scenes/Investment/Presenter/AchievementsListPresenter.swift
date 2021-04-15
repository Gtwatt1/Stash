//
//  InvestmentPresenter.swift
//  Stash
//
//  Created by Olorunshola Godwin on 15/04/2021.
//

import Foundation


class AchievementsListPresenter: AchievementsListPresenterInput, AchievementsListInteractorOutput {
    
    var interactor: AchievementsListInteractorInput?
    var view: AchievementsListPresenterOutput?
    
    func getAchievements() {
        interactor?.getAchievements()
    }
    
    func didGetAchievements(achievements: [Achievement]) {
        view?.displayAchievements(achievements: achievements)
    }
    
    func didFailToGetAchievements(error: String) {
        view?.displayError(error: error)
    }
}


protocol AchievementsListPresenterInput {
    
    func getAchievements()
}


protocol AchievementsListPresenterOutput {
    func displayAchievements(achievements: [Achievement])
    func displayError(error: String)
}
