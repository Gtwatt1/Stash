//
//  ViewController.swift
//  Stash
//
//  Created by Olorunshola Godwin on 10/04/2021.
//

import UIKit
import Kingfisher

class AchievementsListViewController: UIViewController {

    let tableView = UITableView()
    let loadingIndicator = UIActivityIndicatorView(style: .large)
    var achievements = [AchievementListViewModel]()
    var presenter: AchievementsListPresenterInput?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        presenter?.getAchievements()
        setup()
    }

    func configureNavigationBar() {
        navigationItem.title = NSLocalizedString("NavTitle", comment: "")
        let rightBarImage =  UIImage(systemName: "info.circle")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: rightBarImage,
                                                            style: .plain,
                                                            target: self,
                                                            action: nil)
        navigationController?.navigationBar.barTintColor = .systemPurple
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }

    func setup() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        loadingIndicator.startAnimating()

        [tableView, loadingIndicator].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        tableView.register(AchievementListCell.self, forCellReuseIdentifier: "cell")

        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
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
