//
//  AchievementsListInteractorTests.swift
//  StashTests
//
//  Created by Olorunshola Godwin on 15/04/2021.
//

import Foundation
import XCTest
@testable import Stash

class AchievementsListInteractorTests: XCTestCase {

    func test_When_getAchievementsCalled_Expect_AchievementServiceToBeCalled() {
        //Arrange
        let sut = AchievementsListInteractor()
        let service = MockAchievementService()
        sut.achievementService = service

        //Act
        sut.getAchievements()

        //Assert
        XCTAssertTrue(service.getAchievementsCalled)
    }

    func test_When_achievementServiceReturnsError_Expect_PresenterToBeCalledWithError() {

        //Arrange
        let sut = AchievementsListInteractor()
        let service = MockAchievementService()
        let presenter = MockPresenter()
        service.returnError = true
        sut.achievementService = service
        sut.presenter = presenter

        //Act
        sut.getAchievements()

        //Assert
        XCTAssertTrue(presenter.didFailToGetAchievements)
        XCTAssertEqual(presenter.error, AchievementError.decodingFailed.localizedDescription)

    }

    func test_When_achievementServiceSucceed_Expect_PresenterToBeCalledWithAchievements() {

        //Arrange
        let sut = AchievementsListInteractor()
        let service = MockAchievementService()
        let presenter = MockPresenter()
        sut.achievementService = service
        sut.presenter = presenter

        //Act
        sut.getAchievements()

        //Assert
        XCTAssertTrue(presenter.didGetAchievementsCalled)
        XCTAssertEqual(presenter.achievements.count, Mocks.mockAchievements.count)

    }

}

class MockAchievementService: AchievementServiceProtocol {
    var getAchievementsCalled = false
    var returnError = false
    func getAchievements(completion: (Result<[Achievement], AchievementError>) -> Void) {
        getAchievementsCalled = true
        if returnError {
            completion(.failure(.decodingFailed))
        } else {
            completion(.success(Mocks.mockAchievements))
        }

    }

}

class MockPresenter: AchievementsListInteractorOutput {
    var error = ""
    var achievements = [Achievement]()
    var didGetAchievementsCalled = false
    var didFailToGetAchievements = false

    func didGetAchievements(achievements: [Achievement]) {
        didGetAchievementsCalled = true
        self.achievements = achievements
    }

    func didFailToGetAchievements(error: String) {
        didFailToGetAchievements = true
        self.error = error
    }

}
