//
//  Mocks.swift
//  StashTests
//
//  Created by Olorunshola Godwin on 15/04/2021.
//

import Foundation
@testable import Stash

struct Mocks {
    static let mockAchievements = [Achievement(id: 1,
                                      level: "30",
                                      progress: 30,
                                      total: 100,
                                      bgImageURL: "some_url",
                                      accessible: true)]
}
