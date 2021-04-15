//
//  AchievementListCell.swift
//  Stash
//
//  Created by Olorunshola Godwin on 15/04/2021.
//

import Foundation
import UIKit

class AchievementListCell: UITableViewCell {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var levelProgress: UIProgressView!
    @IBOutlet weak var totalProgressLabel: UILabel!
    @IBOutlet weak var currentProgressLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var overlayView: UIView!

    func setupCell(_ achievement: AchievementListViewModel) {
        levelProgress.transform = levelProgress.transform.scaledBy(x: 1, y: 2)
        totalProgressLabel.text = achievement.total
        currentProgressLabel.text = achievement.progress
        levelLabel.text = achievement.level
        backgroundImage.kf.setImage(with: achievement.bgImageURL)
        levelProgress.progress = achievement.progressFloat
        overlayView.isHidden = achievement.accessible
    }
}
