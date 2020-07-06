//
//  LoginController.swift
//  Twitter-Login
//
//  Created by SENGUTTUVAN NALLAPPAN on 5/7/20.
//  Copyright © 2020 SENGUTTUVAN NALLAPPAN. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    // MARK:~ Properties
    //
    let loginLabel:UILabel = {
       let label = UILabel()
        label.text = "Log in to Twitter"
        label.font =  UIFont(name: "Helvetica-Bold", size: 24)
        label.textAlignment = .center
        return label
    }()
    
    let userTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Phone, email or username"
        textField.textColor = UIColor(red: 170/255, green: 184/255, blue: 194/255, alpha: 1)
        return textField
    }()
    
    let passwordTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Password"
        textField.textColor = UIColor(red: 170/255, green: 184/255, blue: 194/255, alpha: 1)
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupViews()
    }
    
    fileprivate func setupViews() {
        view.backgroundColor = .white
                
        view.addSubview(loginLabel)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 32).isActive = true
        loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        loginLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        view.addSubview(userTextField)
        userTextField.translatesAutoresizingMaskIntoConstraints = false
        userTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor,constant: 32).isActive  = true
        userTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16).isActive = true
        userTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16).isActive = true
        
        let dividerView1 = UIView()
        dividerView1.backgroundColor = UIColor(red: 170/255, green: 184/255, blue: 194/255, alpha: 0.50)
        view.addSubview(dividerView1)
        dividerView1.translatesAutoresizingMaskIntoConstraints = false
        dividerView1.topAnchor.constraint(equalTo: userTextField.bottomAnchor,constant: 16).isActive = true
        dividerView1.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16).isActive = true
        dividerView1.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16).isActive = true
        dividerView1.heightAnchor.constraint(equalToConstant: 0.50).isActive = true
        
        view.addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraint(equalTo: dividerView1.bottomAnchor,constant: 32).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16).isActive = true
        
        let dividerView2 = UIView()
        dividerView2.backgroundColor = UIColor(red: 170/255, green: 184/255, blue: 194/255, alpha: 0.50)
        view.addSubview(dividerView2)
        dividerView2.translatesAutoresizingMaskIntoConstraints = false
        dividerView2.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,constant: 16).isActive = true
        dividerView2.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16).isActive = true
        dividerView2.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16).isActive = true
        dividerView2.heightAnchor.constraint(equalToConstant: 0.50).isActive = true
        
    }
    lazy var logoImage = UIImageView()
    
    fileprivate func setupNavigationBar() {

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
        
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancelAction))
        cancel.tintColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
        navigationItem.leftBarButtonItem = cancel
        
        let more = UIBarButtonItem(image: UIImage(named: "More"), style: .plain, target: self, action: #selector(handleCancelAction))
        more.tintColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
        navigationItem.rightBarButtonItem = more
        
    }
    
    @objc func handleCancelAction() {
        dismiss(animated: false, completion: nil)
    }
    
    
}
