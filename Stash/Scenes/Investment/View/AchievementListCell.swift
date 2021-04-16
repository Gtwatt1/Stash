//
//  AchievementListCell.swift
//  Stash
//
//  Created by Olorunshola Godwin on 15/04/2021.
//

import Foundation
import UIKit

class AchievementListCell: UITableViewCell {

    let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        return imageView
    }()

    let levelProgress: UIProgressView = {
        let progressView = UIProgressView()
        progressView.trackTintColor = .white
        progressView.progressTintColor = .green
        return progressView
    }()

    let totalProgressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()

    let currentProgressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()

    let levelLabel: UILabel =  {
        let label = UILabel()
         label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 48, weight: .bold)
         return label
     }()

    let overlayView: UIView = {
        let view = UIView()
        view.alpha = 0.5
        view.backgroundColor = .white
        return view
    }()

    let levelView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 50
        view.layer.masksToBounds = true
        view.backgroundColor = .white
        return view
    }()
    let levelLiteralLabel: UILabel =  {
       let label = UILabel()
        label.text = NSLocalizedString("Level", comment: "")
        label.textAlignment = .center
        return label
    }()

    let levelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {

        [backgroundImage, levelProgress,
         totalProgressLabel, currentProgressLabel,
         levelLabel, overlayView, levelView].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
         }
        levelView.addSubview(levelStackView)
        levelStackView.translatesAutoresizingMaskIntoConstraints = false

        levelStackView.addArrangedSubview(levelLiteralLabel)
        levelStackView.addArrangedSubview(levelLabel)

        backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24).isActive = true
        backgroundImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
        backgroundImage.heightAnchor.constraint(equalToConstant: 220).isActive = true

        currentProgressLabel.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 16).isActive = true
        currentProgressLabel.centerYAnchor.constraint(equalTo: totalProgressLabel.centerYAnchor).isActive = true

        totalProgressLabel.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor, constant: -16).isActive = true
        totalProgressLabel.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: -16).isActive = true

        levelProgress.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 16).isActive = true
        levelProgress.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor, constant: -16).isActive = true
        levelProgress.bottomAnchor.constraint(equalTo: totalProgressLabel.topAnchor, constant: -12).isActive = true

        levelView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        levelView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        levelView.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor).isActive = true
        levelView.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: 32).isActive = true

        levelStackView.centerXAnchor.constraint(equalTo: levelView.centerXAnchor).isActive = true
        levelStackView.widthAnchor.constraint(equalTo: levelView.widthAnchor).isActive = true
        levelStackView.heightAnchor.constraint(equalTo: levelView.heightAnchor, multiplier: 0.7).isActive = true
        levelStackView.centerYAnchor.constraint(equalTo: levelView.centerYAnchor, constant: 8).isActive = true

        overlayView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        overlayView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24).isActive = true
        overlayView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        overlayView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true

    }

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
