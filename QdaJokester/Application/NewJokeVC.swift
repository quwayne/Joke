//
//  NewJokeVC.swift
//  QdaJokester
//
//  Created by Q B on 9/28/20.
//  Copyright © 2020 Quwayne. All rights reserved.
//

import UIKit


class NewJokeVC: UIViewController {
    
    
    let container = UIView()
    
    var joke: Joke!
    
    
    let typeLabel = CLabel(textColor: .black, fontSize: 25, textAlignment: .center)
    let setupLabel = CLabel(textColor: .black, fontSize: 25, textAlignment: .left)
    let punchlineLabel = CLabel(textColor: .black, fontSize: 25, textAlignment: .center)
    let dismissButton = CButton(backgroundColor: .systemBlue, title: Constants.dismissButtonTitle, color: .white)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        autoLayout()
        layoutJoke()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        layoutJoke()
    }
    
    
    func autoLayout() {
        view.autoLayout(container, typeLabel, setupLabel, punchlineLabel, dismissButton)
        view.addSubview(container)
        container.addSubviews(typeLabel, setupLabel, punchlineLabel, dismissButton)
    }

    
    func layoutJoke() {
        //Basic setup
        container.backgroundColor = .white
        container.layer.cornerRadius = 14
        container.alpha = 0.9
        
        setupLabel.numberOfLines = .max
        
        DispatchQueue.main.async {  [self] in
            typeLabel.text = joke.type
            setupLabel.text = joke.setup
            punchlineLabel.text = joke.punchline
        }
        
        //Button action
        dismissButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        // Constraints
        NSLayoutConstraint.activate([
            //Container View
            container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            container.widthAnchor.constraint(equalToConstant: 350),
            container.heightAnchor.constraint(equalToConstant: 280),
            
            //Type
            typeLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: Constants.padding),
            typeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            typeLabel.heightAnchor.constraint(equalToConstant: 30),
            typeLabel.widthAnchor.constraint(equalToConstant: 100),
            
            //Setup
            setupLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: Constants.padding),
            setupLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: Constants.padding),
            setupLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor,constant: -Constants.padding),
            
            //Punchline
            punchlineLabel.bottomAnchor.constraint(equalTo: dismissButton.topAnchor, constant: -Constants.padding * 2),
            punchlineLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: Constants.padding),
            punchlineLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -Constants.padding),
            
            //Button
            dismissButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -Constants.padding),
            dismissButton.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: Constants.padding),
            dismissButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -Constants.padding),
           dismissButton.heightAnchor.constraint(equalToConstant: 30)
            
        ])
    }
    
    
    @objc func dismissVC() {
           dismiss(animated: true)
    }
}
