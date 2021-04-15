//
//  ViewController.swift
//  Stash
//
//  Created by Olorunshola Godwin on 10/04/2021.
//

import UIKit

class AchievementsListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var presenter: AchievementsListPresenterInput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        presenter?.getAchievements()
    }
    
}

extension AchievementsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AchievementCell
        cell.selectionStyle = .none
        return cell
    }

}

extension AchievementsListViewController: AchievementsListPresenterOutput {
    func displayAchievements(achievements: [Achievement]) {
        
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
    
    
}
