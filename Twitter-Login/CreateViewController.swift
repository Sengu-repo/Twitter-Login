//
//  CreateViewController.swift
//  Twitter-Login
//
//  Created by SENGUTTUVAN NALLAPPAN on 13/7/20.
//  Copyright © 2020 SENGUTTUVAN NALLAPPAN. All rights reserved.
//

import UIKit

class CreateViewController : UIViewController, UITextFieldDelegate {

    var bottomViewconstant:NSLayoutConstraint?
    
    // MARK:~ Properties
    //
    let createLabel:UILabel = {
       let label = UILabel()
        label.text = "Create yout account"
        label.font =  UIFont(name: "Helvetica-Bold", size: 24)
        label.textAlignment = .center
        return label
    }()
    
    let nameTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Name"
        textField.textColor = UIColor(red: 170/255, green: 184/255, blue: 194/255, alpha: 1)
        textField.borderStyle = .none
        textField.autocorrectionType = .no
        return textField
    }()
    
    let userIDTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Phone number of email address"
        textField.textColor = UIColor(red: 170/255, green: 184/255, blue: 194/255, alpha: 1)
        textField.borderStyle = .none
        textField.autocorrectionType = .no
        textField.keyboardType = .phonePad
        return textField
    }()
    
    let dataOfBirthTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Date of birth"
        textField.textColor = UIColor(red: 170/255, green: 184/255, blue: 194/255, alpha: 1)
        textField.borderStyle = .none
        textField.autocorrectionType = .no
        textField.addTarget(self, action: #selector(handleDataBirthTextField), for: .touchDown)
        return textField
    }()
    
    let userInsteadButton: UIButton = {
         let btn = UIButton(type: .system)
         btn.setTitle("Use email instead", for: .normal)
         let color =  UIColor(red: 70/255, green: 132/255, blue: 207/255, alpha: 1)
         btn.setTitleColor(color, for: .normal)
         btn.titleLabel?.font = .systemFont(ofSize: 16)
         btn.backgroundColor = .clear
         btn.widthAnchor.constraint(equalToConstant: 150).isActive = true
         btn.titleLabel?.textAlignment = .left
         btn.isHidden = true
        btn.addTarget(self, action: #selector(handleUserInstead), for: .touchDown)
         return btn
     }()
    
    let nextButton: UIButton = {
         let btn = UIButton(type: .system)
         let attributedText = NSAttributedString(string: "Next", attributes: [NSAttributedString.Key.font:UIFont(name: "HelveticaNeue-Bold", size: 16) ?? UIFont.boldSystemFont(ofSize: 14)])
         btn.setAttributedTitle(attributedText, for: .normal)
         btn.backgroundColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
         btn.tintColor = .white
         btn.layer.cornerRadius = 35 / 2
         btn.layer.masksToBounds = true
         btn.widthAnchor.constraint(equalToConstant: 80).isActive = true
         btn.addTarget(self, action: #selector(handleNextAction), for: .touchUpInside)
         btn.isEnabled = false
         btn.alpha = 0.5
         return btn
     }()
    
    // MARK: App Life Cycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        
        nameTextField.delegate  = self
        userIDTextField.delegate = self
        
        NotificationCenter.default.addObserver(self,selector: #selector(handleKeyboardNotificationCenter),name:UIResponder.keyboardWillShowNotification,
        object: nil)
    }
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        nameTextField.becomeFirstResponder()
    }
    
    // MARK: deinit
    deinit {
          NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
      }
    
    // MARK: Handle Action
    //
    @objc func handleNextAction() {
        print("next action")
    }
    
    @objc func handleDataBirthTextField() {
        
        
    }
    
    @objc func handleUserInstead() {
        if userIDTextField.keyboardType == .phonePad {
        userInsteadButton.setTitle("Use phone instead", for: .normal)
        userIDTextField.keyboardType = .emailAddress
        userIDTextField.placeholder = "Email"
        userIDTextField.reloadInputViews()
        } else {
        userInsteadButton.setTitle("Use email instead", for: .normal)
        userIDTextField.keyboardType = .phonePad
        userIDTextField.placeholder = "Phone"
        userIDTextField.reloadInputViews()
        }
    }
    
    @objc func handleKeyboardNotificationCenter(notification:NSNotification) {
       
        if let userInfo = notification.userInfo {
            let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
           
            let keyboarShowing = notification.name == UIResponder.keyboardWillShowNotification
            
            let height =  view.safeAreaInsets.bottom
    
            bottomViewconstant?.constant = ((keyboarShowing ? -keyboardFrame!.height : 0)  - 8)  + height
            
            UIView.animate(withDuration: 0, delay: 0, options: .curveEaseIn, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
    
    // MARK: UIText Field Event
    //
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == nameTextField {
            nameTextField.textColor = .black
        } else if textField == userIDTextField {
            userIDTextField.placeholder = "Phone"
            userIDTextField.textColor = .black
            userInsteadButton.isHidden = false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == userIDTextField {
            userIDTextField.placeholder =  "Phone number of email address"
             userInsteadButton.isHidden = true
        }
    }
    
    
    func setupViews() {
        
        // MARK: code not yet refactored bcoz for learning, practice each and every line's of code and understande more.
        //
       
        view.backgroundColor = .white
                
        view.addSubview(createLabel)
        createLabel.translatesAutoresizingMaskIntoConstraints = false
        createLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 32).isActive = true
        createLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        createLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
                
        view.addSubview(nameTextField)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.topAnchor.constraint(equalTo: createLabel.bottomAnchor,constant: 32).isActive  = true
        nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 32).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -32).isActive = true
        
        let dividerView1 = UIView()
        dividerView1.backgroundColor = UIColor(red: 170/255, green: 184/255, blue: 194/255, alpha: 0.8)
        view.addSubview(dividerView1)
        dividerView1.translatesAutoresizingMaskIntoConstraints = false
        dividerView1.topAnchor.constraint(equalTo: nameTextField.bottomAnchor,constant: 10).isActive = true
        dividerView1.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 32).isActive = true
        dividerView1.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -32).isActive = true
        dividerView1.heightAnchor.constraint(equalToConstant: 0.50).isActive = true
        
        view.addSubview(userIDTextField)
        userIDTextField.translatesAutoresizingMaskIntoConstraints = false
        userIDTextField.topAnchor.constraint(equalTo: dividerView1.bottomAnchor,constant: 32).isActive = true
        userIDTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 32).isActive = true
        userIDTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -32).isActive = true

        let dividerView2 = UIView()
        dividerView2.backgroundColor = UIColor(red: 170/255, green: 184/255, blue: 194/255, alpha: 0.8)
        view.addSubview(dividerView2)
        dividerView2.translatesAutoresizingMaskIntoConstraints = false
        dividerView2.topAnchor.constraint(equalTo: userIDTextField.bottomAnchor,constant: 10).isActive = true
        dividerView2.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 32).isActive = true
        dividerView2.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -32).isActive = true
        dividerView2.heightAnchor.constraint(equalToConstant: 0.50).isActive = true
        
        view.addSubview(dataOfBirthTextField)
        dataOfBirthTextField.translatesAutoresizingMaskIntoConstraints = false
        dataOfBirthTextField.topAnchor.constraint(equalTo: dividerView2.bottomAnchor,constant: 32).isActive = true
        dataOfBirthTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 32).isActive = true
        dataOfBirthTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -32).isActive = true

        let dividerView3 = UIView()
        dividerView3.backgroundColor = UIColor(red: 170/255, green: 184/255, blue: 194/255, alpha: 0.8)
        view.addSubview(dividerView3)
        dividerView3.translatesAutoresizingMaskIntoConstraints = false
        dividerView3.topAnchor.constraint(equalTo: dataOfBirthTextField.bottomAnchor,constant: 10).isActive = true
        dividerView3.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 32).isActive = true
        dividerView3.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -32).isActive = true
        dividerView3.heightAnchor.constraint(equalToConstant: 0.50).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [userInsteadButton,UIView(),nextButton])
        stackView.backgroundColor = .purple
        stackView.axis = .horizontal
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 8).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -8).isActive = true
        
        bottomViewconstant = stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant:8)
        bottomViewconstant?.isActive = true
                
        let topLineView = UIView()
        view.addSubview(topLineView)
        topLineView.backgroundColor = UIColor(red: 170/255, green: 184/255, blue: 194/255, alpha: 0.8)
        topLineView.translatesAutoresizingMaskIntoConstraints = false
        topLineView.leadingAnchor.constraint(equalTo:view.leadingAnchor).isActive = true
        topLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topLineView.bottomAnchor.constraint(equalTo: stackView.topAnchor,constant: -8).isActive  = true
        topLineView.heightAnchor.constraint(equalToConstant: 0.8).isActive = true
        
    }

}
