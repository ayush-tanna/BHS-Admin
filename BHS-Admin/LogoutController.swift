//
//  LogoutController.swift
//  BHS-Admin
//
//  Created by Ayush Tanna on 11/07/17.
//  Copyright © 2017 Ayush Tanna. All rights reserved.
//

import UIKit
import Firebase

class LogoutController: UIViewController {
    
    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var loginRegisterButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 255/255, green: 188/255, blue: 0, alpha: 1)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        
        button.layer.cornerRadius = 1
        button.layer.masksToBounds = true
        return button
    }()
    
    func handleLogin() {
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passTextField.text!, completion: { (user, error) in
            if error != nil {
                print(error!)
                return
            }
            //succesful login!
            self.dismiss(animated: true, completion: nil)
        })

    }
    
    let emailTextField: UITextField = {
        let ef = UITextField()
        ef.placeholder = "Email Address"
        ef.translatesAutoresizingMaskIntoConstraints = false
        return ef
    }()

    let passTextField: UITextField = {
        let pf = UITextField()
        pf.placeholder = "Password"
        pf.isSecureTextEntry = true
        pf.translatesAutoresizingMaskIntoConstraints = false
        return pf
    }()
    
    let mainImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "univ-icon")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
        
    }()
    
//    let mainTextView: UITextView = {
//      let tv = UITextView()
//        tv.text = "Admin"
//        tv.font = UIFont.boldSystemFont(ofSize: 20)
//        tv.textAlignment = .center
//        tv.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0)
//        tv.translatesAutoresizingMaskIntoConstraints = false
//        return tv
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 255/255, green: 167/255, blue: 0, alpha: 1)
        

        view.addSubview(inputsContainerView)
        view.addSubview(loginRegisterButton)
        view.addSubview(mainImageView)
        //view.addSubview(mainTextView)
        
        setupInputsContainerView()
        setupLoginRegisterButton()
        setupMainImageView()
        //setupMainTextView()
    }
    
    func setupMainImageView() {
        mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: -12).isActive = true
        mainImageView.widthAnchor.constraint(equalToConstant: 130).isActive = true
        mainImageView.heightAnchor.constraint(equalToConstant: 130).isActive = true
    }
    
    func setupInputsContainerView() {
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputsContainerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        inputsContainerView.addSubview(emailTextField)
        inputsContainerView.addSubview(passTextField)
        
        emailTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/2).isActive = true
        
        passTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        passTextField.bottomAnchor.constraint(equalTo: inputsContainerView.bottomAnchor).isActive = true
        passTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        passTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/2).isActive = true
        
    }
    
    func setupLoginRegisterButton() {
        loginRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 12).isActive = true
        loginRegisterButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        loginRegisterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
//    func setupMainTextView() {
//        mainTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        mainTextView.bottomAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: 12).isActive = true
//        mainTextView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
//        mainTextView.heightAnchor.constraint(equalToConstant: 50).isActive = true
//    }

}
