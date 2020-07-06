//
//  LoginMainViewController.swift
//  Twitter-Login
//
//  Created by SENGUTTUVAN NALLAPPAN on 5/7/20.
//  Copyright © 2020 SENGUTTUVAN NALLAPPAN. All rights reserved.
//

import UIKit

class LoginMainViewController: UIViewController {

    // MARK: - Properties
    //
    let messageText: UILabel = {
      let label = UILabel()
          label.text = "See what's\nhapping in the\nworld right now." // Helvetica Neue
          label.numberOfLines = 0
          label.font = UIFont(name:"HelveticaNeue-Bold", size: 30)
          label.textAlignment = .left
          label.heightAnchor.constraint(equalToConstant: 150).isActive = true
    return label
    }()
    
    let createButton: UIButton = {
        let btn = UIButton(type: .system)
        let attributedText = NSAttributedString(string: "Create account", attributes: [NSAttributedString.Key.font:UIFont(name: "HelveticaNeue-Bold", size: 16) ?? UIFont.boldSystemFont(ofSize: 16)])
        btn.setAttributedTitle(attributedText, for: .normal)
        btn.backgroundColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1) 
        btn.tintColor = .white
        btn.layer.cornerRadius = 50 / 2
        btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return btn
    }()
    
    let loginMessageLabel: UILabel = {
       let label = UILabel()
        label.text = "Have an account already?"
        label.font = UIFont(name: "Helvetica", size: 14)
        label.textColor =  UIColor(red: 170/255, green: 184/255, blue: 194/255, alpha: 1) // 170,184,194
        label.heightAnchor.constraint(equalToConstant: 14).isActive = true
       return label
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        let font = UIFont(name: "Helvetica", size: 14)
        let attributedText = NSAttributedString(string: "Log in", attributes: [NSAttributedString.Key.font: font ?? UIFont.boldSystemFont(ofSize: 14)])
        button.setAttributedTitle(attributedText, for: .normal)
        button.tintColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
        button.heightAnchor.constraint(equalToConstant: 14).isActive = true
        button.addTarget(self, action: #selector(handleLoginAction), for: .touchDown)
        return button
    }()
    
    // MARK: - Life Cycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    @objc func handleLoginAction() {
        let vc = LoginController()
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.modalTransitionStyle = .crossDissolve
        self.present(navigationController, animated: false, completion: nil)
    }
    
    
    // MARK: - View's configuration
    //
    private func setupViews(){
        view.backgroundColor = .white
        
        let titleView = UIView(frame:.init(x: 0, y: 0, width: 100, height: 44))
        let titleImageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
        titleImageView.contentMode = .scaleAspectFit
        titleImageView.frame = .init(x:0, y:0, width:titleView.frame.width, height:titleView.frame.height)
        titleView.addSubview(titleImageView)
        navigationItem.titleView = titleView
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        let stack = UIStackView(arrangedSubviews: [messageText,createButton])
        
        view.addSubview(stack)
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 32).isActive = true
        stack.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -32).isActive = true
        
        
         let bottomStackView = UIStackView(arrangedSubviews: [loginMessageLabel,loginButton,UIView()])
         bottomStackView.spacing = 2
         bottomStackView.axis = .horizontal
       
         view.addSubview(bottomStackView)
         bottomStackView.translatesAutoresizingMaskIntoConstraints = false
         bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 32).isActive = true
         bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -32).isActive = true
         bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant:  -32).isActive = true
        
    }
    
}
