//
//  ViewController.swift
//  Stash
//
//  Created by Olorunshola Godwin on 10/04/2021.
//

import UIKit
import Kingfisher

class AchievementsListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var presenter: AchievementsListPresenterInput?
    var achievements = [Achievement]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        presenter?.getAchievements()
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .systemPurple
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
}

extension AchievementsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return achievements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AchievementCell
        cell.setupCell(achievements[indexPath.row])
        return cell
    }

}

extension AchievementsListViewController: AchievementsListPresenterOutput {
    func displayAchievements(achievements: [Achievement]) {
        self.achievements = achievements
        tableView.reloadData()
    }
    
    func displayError(error: String) {
        
    }
    
}


class AchievementCell: UITableViewCell {
   
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var levelProgress: UIProgressView!
    @IBOutlet weak var totalProgressLabel: UILabel!
    @IBOutlet weak var currentProgressLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var overlayView: UIView!
    
    func setupCell(_ achievement: Achievement) {
        levelProgress.transform = levelProgress.transform.scaledBy(x: 1, y: 2)
        totalProgressLabel.text = "\(achievement.total) pts"
        currentProgressLabel.text = "\(achievement.progress) pts"
        levelLabel.text = achievement.level
        let imageURL = URL(string: achievement.bgImageURL)
        backgroundImage.kf.setImage(with: imageURL)
        let progress = Float(achievement.progress) / Float(achievement.total)
        levelProgress.progress = progress
        overlayView.isHidden = achievement.accessible
    }
}
