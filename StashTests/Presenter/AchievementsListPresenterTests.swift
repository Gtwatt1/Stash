//
//  AchievementsListPresenterTests.swift
//  StashTests
//
//  Created by Olorunshola Godwin on 15/04/2021.
//

import Foundation
import XCTest
@testable import Stash

class AchievementsListPresenterTest: XCTestCase {

    func test_When_GetAchievementsCalled_Expect_InteractorGetAchievementCalled() {
        //Arrange
        let sut = AchievementsListPresenter()
        let interactor = MockInteractor()
        sut.interactor = interactor

        //Act
        sut.getAchievements()

        //Assert
        XCTAssertTrue(interactor.getAchivementCalled)

    }

    func test_When_DidGetAchievementsCalled_Expect_ViewDisplayAchievementsCalled() {
        //Arrange
        let sut = AchievementsListPresenter()
        let view = MockView()
        sut.view = view

        let mockAchievements = Mocks.mockAchievements
        //Act
        sut.didGetAchievements(achievements: mockAchievements)

        //Assert
        XCTAssertTrue(view.displayAchievementsCalled)
        XCTAssertEqual(mockAchievements.count, view.achievements.count)

    }

    func test_When_DidFailToGetAchievementsCalled_Expect_ViewDisplayErrorCalled() {
        //Arrange
        let sut = AchievementsListPresenter()
        let view = MockView()
        sut.view = view

        //Act

        sut.didFailToGetAchievements(error: "some_error")

        //Assert
        XCTAssertTrue(view.displayErrorCalled)
        XCTAssertEqual(view.errorString, "some_error")

    }

}

class MockInteractor: AchievementsListInteractorInput {
    var getAchivementCalled = false
    func getAchievements() {
        getAchivementCalled = true
    }
}

class MockView: AchievementsListPresenterOutput {
    var displayAchievementsCalled = false
    var displayErrorCalled = false
    var achievements = [AchievementListViewModel]()
    var errorString = ""

    func displayAchievements(achievements: [AchievementListViewModel]) {
        displayAchievementsCalled = true
        self.achievements = achievements
    }

    func displayError(error: String) {
        displayErrorCalled = true
        errorString = error
    }

}
