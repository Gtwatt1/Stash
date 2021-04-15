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
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    var achievements = [AchievementListViewModel]()

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
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "cell", for: indexPath) as? AchievementListCell else {
            fatalError("Cell not found")
        }
        cell.setupCell(achievements[indexPath.row])
        return cell
    }

}

extension AchievementsListViewController: AchievementsListPresenterOutput {
    func displayAchievements(achievements: [AchievementListViewModel]) {
        self.achievements = achievements
        loadingIndicator.isHidden = true
        tableView.reloadData()
    }

    func displayError(error: String) {
        loadingIndicator.isHidden = true
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }

}
