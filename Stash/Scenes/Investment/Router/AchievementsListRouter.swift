//
//  AchievementRouter.swift
//  Stash
//
//  Created by Olorunshola Godwin on 15/04/2021.
//

import Foundation
import UIKit

protocol AchievementsListWireFrame {
    func assembleModule() -> UIViewController?
}

class AchievementsListRouter: AchievementsListWireFrame {

    // Instantiate the AchievementsList Scene with its dependencies
    func assembleModule() -> UIViewController? {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = mainStoryBoard.instantiateViewController(
            identifier: "AchievementListViewController") as? AchievementsListViewController {
            let presenter = AchievementsListPresenter()
            let interactor = AchievementsListInteractor()
            let repository = LocalAchievementsListRepository()
            let service = AchievementsListService(repository: repository)
            presenter.interactor = interactor
            presenter.view = viewController
            interactor.presenter = presenter
            interactor.achievementService = service
            viewController.presenter = presenter
            return UINavigationController(rootViewController: viewController)
        }
        return nil
    }
}
