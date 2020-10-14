//
//  GetJokeVC.swift
//  QdaJokester
//
//  Created by Q B on 9/28/20.
//  Copyright © 2020 Quwayne. All rights reserved.
//

import UIKit

let newJokeVC = NewJokeVC()

class GetJokeVC: UIViewController {
    
    let homeJokeLabel = CLabel(textColor: .white, fontSize: 300, textAlignment: .center)
    let jokeButton = CButton(backgroundColor: .cyan, title: Constants.jokeButtonTitle, color: .white)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureLayoutConstraints()
        configureActionButton()
    }
    
    
    func configureViewController() {
        view.backgroundColor = .systemIndigo
        homeJokeLabel.text = Constants.homeTitle
    }
    
    
    func configureLayoutConstraints() {
        view.addSubview(homeJokeLabel)
        view.addSubview(jokeButton)
        
        
        homeJokeLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        homeJokeLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200).isActive = true
        homeJokeLabel.heightAnchor.constraint(equalToConstant: 150).isActive = true
        homeJokeLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        jokeButton.centerXAnchor.constraint(equalTo: homeJokeLabel.centerXAnchor).isActive = true
        jokeButton.topAnchor.constraint(equalTo: homeJokeLabel.bottomAnchor, constant: 300).isActive = true
        jokeButton.widthAnchor.constraint(equalToConstant: 175).isActive = true
        jokeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func configureActionButton() {
        self.jokeButton.addTarget(self, action: #selector(self.getJoke), for: .touchUpInside)
    }
    
    
    @objc func getJoke() {
            NetworkManager.shared.getRandomJoke() {  result in
                DispatchQueue.main.sync {
                switch result {
                case .success(let joke):
                    
                    newJokeVC.joke = joke
                    self.present(newJokeVC, animated: true)
                    
                case .failure(.error):
                    print(Constants.errorDebug)
                }
            }
        }
    }
}
