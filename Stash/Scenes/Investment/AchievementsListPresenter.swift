//
//  InvestmentPresenter.swift
//  Stash
//
//  Created by Olorunshola Godwin on 15/04/2021.
//

import Foundation


class AchievementsListPresenter: AchievementsListPresenterInput {
    
    var interactor: AchievementsListInteractorInput?
    func getAchievements() {
        
    }
}


protocol AchievementsListPresenterInput {
    
    func getAchievements()
}
