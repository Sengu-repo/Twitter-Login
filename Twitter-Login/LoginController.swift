//
//  LoginController.swift
//  Twitter-Login
//
//  Created by SENGUTTUVAN NALLAPPAN on 5/7/20.
//  Copyright © 2020 SENGUTTUVAN NALLAPPAN. All rights reserved.
//

import UIKit

protocol LoginControllerDelegate {
    func didSelectLoginViewController()
}

class LoginController: UIViewController ,MainViewNavigationDelegate {
   
    func didSelectNavBarButton(action: NavigationAction) {
        if action == .Right {
            print("Right action")
        }
    }
       
    var delegate: LoginControllerDelegate?
    
    var stackBottomconstant:NSLayoutConstraint?
    
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
        textField.borderStyle = .none
        textField.autocorrectionType = .no
        return textField
    }()
    
    let passwordTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Password"
        textField.textColor = UIColor(red: 170/255, green: 184/255, blue: 194/255, alpha: 1)
        textField.borderStyle = .none
        textField.autocorrectionType = .no
        return textField
    }()
    
    let forgetActionBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Forget password?", for: .normal)
        let color =  UIColor(red: 70/255, green: 132/255, blue: 207/255, alpha: 1)
        btn.setTitleColor(color, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 16)
        btn.backgroundColor = .clear
        btn.widthAnchor.constraint(equalToConstant: 150).isActive = true
        btn.titleLabel?.textAlignment = .left
        btn.addTarget(self, action: #selector(handleForgetPassword), for: .touchUpInside)
        return btn
    }()
    
    let login: UIButton = {
        let btn = UIButton(type: .system)
        let attributedText = NSAttributedString(string: "Log in", attributes: [NSAttributedString.Key.font:UIFont(name: "HelveticaNeue-Bold", size: 16) ?? UIFont.boldSystemFont(ofSize: 14)])
        btn.setAttributedTitle(attributedText, for: .normal)
        btn.backgroundColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
        btn.tintColor = .white
        btn.layer.cornerRadius = 35 / 2
        btn.layer.masksToBounds = true
        btn.widthAnchor.constraint(equalToConstant: 80).isActive = true
        btn.addTarget(self, action: #selector(handleLoginAction), for: .touchUpInside)
        btn.isEnabled = false
        btn.alpha = 0.5
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        NotificationCenter.default.addObserver(self,selector: #selector(handleKeyboardNotificationCenter),name:UIResponder.keyboardWillShowNotification,
        object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.delegate?.didSelectLoginViewController()
        userTextField.becomeFirstResponder()
    }

    
    // MARK: Action Handler
    //
    @objc func handleForgetPassword() {
        
    }
    
    @objc func handleLoginAction() {
        
    }
    
    @objc func handleKeyboardNotificationCenter(notification:NSNotification) {
       
        if let userInfo = notification.userInfo {
            let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
           
            let keyboarShowing = notification.name == UIResponder.keyboardWillShowNotification
            
            let height =  view.safeAreaInsets.bottom
    
            stackBottomconstant?.constant = ((keyboarShowing ? -keyboardFrame!.height : 0)  - 8)  + height
            
            UIView.animate(withDuration: 0, delay: 0, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
    
    
    fileprivate func setupViews() {
        view.backgroundColor = .white
        
        // MARK: code not yet refactored bcoz for learning, practice each and every line's of code and understande more.
        //
            
        
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
        dividerView1.backgroundColor = UIColor(red: 170/255, green: 184/255, blue: 194/255, alpha: 0.8)
        view.addSubview(dividerView1)
        dividerView1.translatesAutoresizingMaskIntoConstraints = false
        dividerView1.topAnchor.constraint(equalTo: userTextField.bottomAnchor,constant: 10).isActive = true
        dividerView1.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16).isActive = true
        dividerView1.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16).isActive = true
        dividerView1.heightAnchor.constraint(equalToConstant: 0.50).isActive = true
        
        view.addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraint(equalTo: dividerView1.bottomAnchor,constant: 16).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16).isActive = true

        let dividerView2 = UIView()
        dividerView2.backgroundColor = UIColor(red: 170/255, green: 184/255, blue: 194/255, alpha: 0.8)
        view.addSubview(dividerView2)
        dividerView2.translatesAutoresizingMaskIntoConstraints = false
        dividerView2.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,constant: 10).isActive = true
        dividerView2.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16).isActive = true
        dividerView2.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16).isActive = true
        dividerView2.heightAnchor.constraint(equalToConstant: 0.50).isActive = true
        
        
        let stackView = UIStackView(arrangedSubviews: [forgetActionBtn,UIView(),login])
        stackView.backgroundColor = .purple
        stackView.axis = .horizontal
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16).isActive = true
    
        stackBottomconstant = stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant:-8)
        stackBottomconstant?.isActive = true
        
        let stackTopView = UIView()
        view.addSubview(stackTopView)
        stackTopView.backgroundColor = UIColor(red: 170/255, green: 184/255, blue: 194/255, alpha: 0.8)
        stackTopView.translatesAutoresizingMaskIntoConstraints = false
        stackTopView.leadingAnchor.constraint(equalTo:view.leadingAnchor).isActive = true
        stackTopView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stackTopView.bottomAnchor.constraint(equalTo: stackView.topAnchor,constant: -8).isActive  = true
        stackTopView.heightAnchor.constraint(equalToConstant: 0.8).isActive = true
 
        
    }

}


