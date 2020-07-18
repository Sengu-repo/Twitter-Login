//
//  LoginMainViewController.swift
//  Twitter-Login
//
//  Created by SENGUTTUVAN NALLAPPAN on 5/7/20.
//  Copyright © 2020 SENGUTTUVAN NALLAPPAN. All rights reserved.
//

import UIKit

enum NavigationBarStyle {
    case Main
    case login
    case Create
}

enum NavigationAction {
    case Left
    case Right
}

protocol MainViewNavigationDelegate {
    func didSelectNavBarButton(action:NavigationAction)
}

class MainViewController: UIViewController,LoginControllerDelegate {
    
    func didSelectLoginViewController() {
        setupNavigationBar(style: NavigationBarStyle.login)
    }
    
    var delegate: MainViewNavigationDelegate?
    
    var loginController: LoginController?
    var createViewController : CreateViewController?
    
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
        btn.addTarget(self, action: #selector(handleCreateAction), for: .touchUpInside)
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
        let btn = UIButton(type: .system)
        let font = UIFont(name: "Helvetica", size: 14)
        let attributedText = NSAttributedString(string: "Log in", attributes: [NSAttributedString.Key.font: font ?? UIFont.boldSystemFont(ofSize: 14)])
        btn.setAttributedTitle(attributedText, for: .normal)
        btn.tintColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
        btn.heightAnchor.constraint(equalToConstant: 14).isActive = true
        // MARK: Login View Controller Action
        //
        btn.addTarget(self, action: #selector(handleLoginAction), for: .touchUpInside)
        return btn
    }()
    
    // MARK: - App Life Cycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    @objc func handleLoginAction() {
        let loginView = LoginController()
        loginView.delegate = self
        delegate = loginView
        loginView.willMove(toParent: self)
        self.view.addSubview(loginView.view)
        let animation = CATransition()
        animation.duration = 0.3
        animation.type = CATransitionType.reveal
        animation.subtype = CATransitionSubtype.fromBottom
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        loginView.view.layer.add(animation, forKey: "addLoginView")
        self.presentingViewController?.addChild(loginView)
        loginView.didMove(toParent: self)
        loginView.view.frame = self.view.bounds
        self.loginController = loginView
    }
    
    @objc func handleCreateAction() {
        let createView = CreateViewController()
        self.view.addSubview(createView.view)
        let animation = CATransition()
        animation.duration = 0.3
        animation.type = CATransitionType.push
        animation.subtype = CATransitionSubtype.fromRight
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        createView.view.layer.add(animation, forKey: "addCreateView")
        self.presentingViewController?.addChild(createView)
        self.createViewController = createView
        setupNavigationBar(style: .Create)
    }
    
    func removeViews(viewController:UIViewController?) {
        if viewController != nil {
            if self.view.subviews.contains(viewController!.view) {
                setupNavigationBar(style: .Main)
                 viewController!.view.removeFromSuperview()
            }
        }
    }
    
    fileprivate func setupNavigationBar(style: NavigationBarStyle) {
        
        if style == .login {

            let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancelAction))
            cancel.tintColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
            navigationItem.leftBarButtonItem = cancel
            
            let more = UIBarButtonItem(image: UIImage(named: "More"), style: .plain, target: self, action: #selector(handleMoreAction))
            more.tintColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
            navigationItem.rightBarButtonItem = more
            
        }
        else if style == .Create {
            let returnBtn = UIBarButtonItem(image: UIImage(named: "Return"), style: .plain, target: self, action: #selector(self.handleReturnAction))
            returnBtn.tintColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
                self.navigationItem.leftBarButtonItem = returnBtn
        }
        else {
            navigationItem.leftBarButtonItem = nil
            navigationItem.rightBarButtonItem = nil
        }
    }
    
    @objc func handleCancelAction() {
        removeViews(viewController: loginController)
    }
    
    @objc func handleMoreAction() {
        delegate?.didSelectNavBarButton(action: .Right)
    }
    
    @objc func handleReturnAction() {
            let animation = CATransition()
            animation.duration = 0.3
            animation.type = CATransitionType.push
            animation.subtype = CATransitionSubtype.fromLeft
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            self.view.layer.add(animation, forKey: "removeCreateView")
        
            removeViews(viewController: createViewController)
    }
    
    
    
    // MARK: - View's configuration
    //
    private func setupViews(){
         view.backgroundColor = .white
        
        // MARK: code not yet refactored bcoz for learning, practice each and every line's of code and understande more.
        //
            
        
        let titleView = UIView(frame:.init(x: 0, y: 0, width: 100, height: 44))
        let titleImageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
        titleImageView.contentMode = .scaleAspectFit
        titleImageView.frame = .init(x:0, y:0, width:titleView.frame.width, height:titleView.frame.height)
        titleView.addSubview(titleImageView)
        navigationItem.titleView = titleView
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.shadowColor = nil
        
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        self.navigationController?.navigationBar.isTranslucent = false
        
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
