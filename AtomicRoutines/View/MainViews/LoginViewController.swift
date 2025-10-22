//
//  Loginview.swift
//  AtomicRoutines
//
//  Created by Najabat Sofiyeva on 15.10.25.
//

import UIKit
import FirebaseAuth


class LoginViewController: UIViewController {
    
    
    private let SIFirstLabel = UILabel()
    private let SISecondLabel = UILabel()
    private let SIEmailTextField = reusableTextFieldStructure(placeholder: "email")
    private let SIPasswordTextField = reusableTextFieldStructure(placeholder: "password", isSecure: true)
    private let SITextfieldStack = UIStackView()
    private let forgotPasswordLabel = UILabel()
    private let SIButton = UIButton()
    private let SIThirdLabel = UILabel()
    private let ContinueWidthLabel = UILabel()
   
    override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .systemBackground
            configureAllSetups()
        }
        
    
    func setupSIFirstLabelConstraints(){
        SIFirstLabel.text = "Login here"
        SIFirstLabel.numberOfLines = 0
        SIFirstLabel.textAlignment = .center
        SIFirstLabel.font = UIFont(name: "Poppins-SemiBold", size: 30)
        SIFirstLabel.textColor = UIColor(named: "textColor")
        SIFirstLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(SIFirstLabel)
        NSLayoutConstraint.activate([
            SIFirstLabel.topAnchor.constraint(equalTo:  view.topAnchor, constant: 97),
            SIFirstLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
    func setupSISecondLabelConstraints(){
        SISecondLabel.text = "Welcome back you’ve \nbeen missed!"
        SISecondLabel.numberOfLines = 0
        SISecondLabel.textAlignment = .center
        SISecondLabel.font = UIFont(name: "Poppins-SemiBold", size: 20)
        SISecondLabel.textColor = .black
        SISecondLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(SISecondLabel)
        NSLayoutConstraint.activate([
            SISecondLabel.topAnchor.constraint(equalTo: SIFirstLabel.bottomAnchor, constant: 26),
            SISecondLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
    }
    func setupSITextfieldStackConstraints(){
        SITextfieldStack.axis = .vertical
        SITextfieldStack.spacing = 29
        SITextfieldStack.distribution = .fillEqually
        SITextfieldStack.translatesAutoresizingMaskIntoConstraints = false
        SITextfieldStack.addArrangedSubview(SIEmailTextField)
        SITextfieldStack.addArrangedSubview(SIPasswordTextField)
        view.addSubview(SITextfieldStack)
        NSLayoutConstraint.activate([
            SITextfieldStack.topAnchor.constraint(equalTo: SISecondLabel.bottomAnchor,constant: 74),
            SITextfieldStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),   // horizontal padding
            SITextfieldStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            SITextfieldStack.heightAnchor.constraint(equalToConstant: 157)
        ])
        
    }
    func setupforgotPasswordLabelConstraints(){
        forgotPasswordLabel.text = "Forgot your password?"
        forgotPasswordLabel.numberOfLines = 1
        forgotPasswordLabel.font = UIFont(name: "Poppins-SemiBold", size: 14)
        forgotPasswordLabel.textColor = UIColor(named: "textColor")
        forgotPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(forgotPasswordLabel)
        NSLayoutConstraint.activate([
            forgotPasswordLabel.topAnchor.constraint(equalTo: SITextfieldStack.bottomAnchor,constant: 30),
            forgotPasswordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
    }
    func setupSIButtonConstraints(){
        SIButton.setTitle("Sign In", for: .normal)
        SIButton.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 20)
        SIButton.backgroundColor = UIColor(named: "darkblue")
        SIButton.setTitleColor(.white, for: .normal)
        SIButton.layer.cornerRadius = 10
        SIButton.layer.shadowColor = UIColor(red: 209/255, green: 203/255, blue: 225/255, alpha: 1).cgColor
        SIButton.layer.shadowOpacity = 1
        SIButton.layer.shadowOffset = CGSize(width: 0, height: 10)
        SIButton.layer.shadowRadius = 20 //blur
        SIButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(SIButton)
        SIButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            SIButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 39),
            SIButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -39),
            SIButton.heightAnchor.constraint(equalToConstant: 60),
            SIButton.topAnchor.constraint(equalTo: forgotPasswordLabel.bottomAnchor, constant: 30)
        ])
        
    }
    
    func setupSIThirdLabelConstraints(){
        SIThirdLabel.text = "Create new account?"
        SIThirdLabel.numberOfLines = 1
        SIThirdLabel.font = UIFont(name: "Poppins-SemiBold", size: 14)
        SIThirdLabel.textColor = UIColor(named: "lightblue")
        SIThirdLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(SIThirdLabel)
        NSLayoutConstraint.activate([
            SIThirdLabel.topAnchor.constraint(equalTo: SIButton.bottomAnchor,constant: 40),
            SIThirdLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    func setupContinueWidthLabelConstraints(){
            ContinueWidthLabel.text = "Or continue with"
            ContinueWidthLabel.numberOfLines = 1
            ContinueWidthLabel.font = UIFont(name: "Poppins-SemiBold", size: 14)
            ContinueWidthLabel.textColor = UIColor(named: "secondLabelColor")
            ContinueWidthLabel.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(ContinueWidthLabel)
            NSLayoutConstraint.activate([
                ContinueWidthLabel.topAnchor.constraint(equalTo: SIThirdLabel.bottomAnchor,constant: 75),
                ContinueWidthLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
            
    }
    func configureAllSetups(){
            setupSIFirstLabelConstraints()
            setupSISecondLabelConstraints()
            setupSITextfieldStackConstraints()
            setupforgotPasswordLabelConstraints()
            setupSIButtonConstraints()
            setupSIThirdLabelConstraints()
            setupContinueWidthLabelConstraints()
        }
        
        
      
    @objc func signInTapped() {
        guard let email = SIEmailTextField.text, !email.isEmpty,
              let password = SIPasswordTextField.text, !password.isEmpty else {
            print("Email və ya password boşdur")
            showAlert(title: "ERROR", message: "you can't pass the gaps empty")
            return
        }
      
        
        Auth.auth().signIn(withEmail: email, password: password) {[self] authResult, error in
            
    
            if let e = error as NSError?  {
                print(e)
                switch AuthErrorCode(rawValue: e.code) {
                case .userNotFound:
                    self.showAlert(title: "ERROR", message: "User did not found")
                    
                default:
                    self.showAlert(title: "ERROR", message: e.localizedDescription)
                }
                return
            }else{
                let homeVC = HomeViewController()
                navigationController?.pushViewController(homeVC, animated: true)
           
                print("sign in uqurla basa catdi")
            }
            
        }
        
        
        
        
        
    }
        
}
