//
//  CreateViewController.swift
//  Twitter-Login
//
//  Created by SENGUTTUVAN NALLAPPAN on 13/7/20.
//  Copyright © 2020 SENGUTTUVAN NALLAPPAN. All rights reserved.
//

import UIKit

class CreateViewController : UIViewController {

    
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
        return textField
    }()
    
    let userIDTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Phone number of email address"
        textField.textColor = UIColor(red: 170/255, green: 184/255, blue: 194/255, alpha: 1)
        textField.borderStyle = .none
        return textField
    }()
    
    let dataOfBirthTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Date of birth"
        textField.textColor = UIColor(red: 170/255, green: 184/255, blue: 194/255, alpha: 1)
        textField.borderStyle = .none
        return textField
    }()
    
    // MARK: App Life Cycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
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
        nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16).isActive = true
        
        let dividerView1 = UIView()
        dividerView1.backgroundColor = UIColor(red: 170/255, green: 184/255, blue: 194/255, alpha: 0.8)
        view.addSubview(dividerView1)
        dividerView1.translatesAutoresizingMaskIntoConstraints = false
        dividerView1.topAnchor.constraint(equalTo: nameTextField.bottomAnchor,constant: 10).isActive = true
        dividerView1.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16).isActive = true
        dividerView1.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16).isActive = true
        dividerView1.heightAnchor.constraint(equalToConstant: 0.50).isActive = true
        
        view.addSubview(userIDTextField)
        userIDTextField.translatesAutoresizingMaskIntoConstraints = false
        userIDTextField.topAnchor.constraint(equalTo: dividerView1.bottomAnchor,constant: 20).isActive = true
        userIDTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16).isActive = true
        userIDTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16).isActive = true

        let dividerView2 = UIView()
        dividerView2.backgroundColor = UIColor(red: 170/255, green: 184/255, blue: 194/255, alpha: 0.8)
        view.addSubview(dividerView2)
        dividerView2.translatesAutoresizingMaskIntoConstraints = false
        dividerView2.topAnchor.constraint(equalTo: userIDTextField.bottomAnchor,constant: 10).isActive = true
        dividerView2.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16).isActive = true
        dividerView2.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16).isActive = true
        dividerView2.heightAnchor.constraint(equalToConstant: 0.50).isActive = true
        
        view.addSubview(dataOfBirthTextField)
        dataOfBirthTextField.translatesAutoresizingMaskIntoConstraints = false
        dataOfBirthTextField.topAnchor.constraint(equalTo: dividerView2.bottomAnchor,constant: 20).isActive = true
        dataOfBirthTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16).isActive = true
        dataOfBirthTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16).isActive = true

        let dividerView3 = UIView()
        dividerView3.backgroundColor = UIColor(red: 170/255, green: 184/255, blue: 194/255, alpha: 0.8)
        view.addSubview(dividerView3)
        dividerView3.translatesAutoresizingMaskIntoConstraints = false
        dividerView3.topAnchor.constraint(equalTo: dataOfBirthTextField.bottomAnchor,constant: 10).isActive = true
        dividerView3.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16).isActive = true
        dividerView3.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16).isActive = true
        dividerView3.heightAnchor.constraint(equalToConstant: 0.50).isActive = true
        
        
    }

}
