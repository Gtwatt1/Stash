//
//  LocalAchievementsListRepositoryTests.swift
//  StashTests
//
//  Created by Olorunshola Godwin on 15/04/2021.
//

import Foundation
import XCTest
@testable import Stash

class AchievementsListServiceTests: XCTestCase {

    func test_When_getAchievementsCalled_Expect_repositoryGetToBeCalledWithResult() {

        // Arrange
        let repository = MockAchievementRepository()
        let sut = AchievementsListService(repository: repository)
        let asyncExpectation = expectation(description: "Wait for async call")
        var actualResult: Result<[Achievement], AchievementError> = .failure(.decodingFailed)

        // Act
        sut.getAchievements { (result) in
            actualResult = result
            asyncExpectation.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)

        // Assert
        XCTAssertNoThrow(try actualResult.get())
        XCTAssertTrue(repository.getCalled)
    }
}

class MockAchievementRepository: AchievementRepository {
    var getCalled = false
    func get(completion: (Result<[Achievement], AchievementError>) -> Void) {
        getCalled = true
        completion(.success(Mocks.mockAchievements))
    }

}
