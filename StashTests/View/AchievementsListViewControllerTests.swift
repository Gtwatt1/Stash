//
//  AchievementsListViewController.swift
//  StashTests
//
//  Created by Olorunshola Godwin on 15/04/2021.
//

import Foundation
import XCTest
import SnapshotTesting
@testable import Stash

class AchievementsListViewControllerTests: XCTestCase {

    func testViewController() {
        let view = AchievementsListViewController()
        assertSnapshot(matching: view, as: .image)
      }
}
