//
//  SignupView.swift
//  AtomicRoutines
//
//  Created by Najabat Sofiyeva on 15.10.25.
//


import UIKit
import FirebaseAuth
//import FirebaseAuth
//import Firebase

class RegisterViewController: UIViewController {
        
    private let SUFirstLabel = UILabel()
    private let SUSecondLabel = UILabel()
    private let SUEmailTextField = reusableTextFieldStructure(placeholder: "email")
    private let SUPasswordTextField = reusableTextFieldStructure(placeholder: "password", isSecure: true)
    private let SUConfirmPasswordTextField = reusableTextFieldStructure(placeholder: "password", isSecure: true)
    private let SUTextfieldStack = UIStackView()
    private let SUButton = UIButton()
    private let SUThirdLabel = UILabel()
    private let SUContinueWidthLabel = UILabel()
    
  
    override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .systemBackground
            configureAllSetups()
          }
    func setupSUFirstLabelConstraints(){
      SUFirstLabel.text = "Create Account"
      SUFirstLabel.numberOfLines = 0
      SUFirstLabel.textAlignment = .center
      SUFirstLabel.font = UIFont(name: "Poppins-SemiBold", size: 30)
      SUFirstLabel.textColor = UIColor(named: "textColor")
      view.addSubview(SUFirstLabel)
      SUFirstLabel.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
              SUFirstLabel.topAnchor.constraint(equalTo:  view.topAnchor, constant: 97),
              SUFirstLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
          ])
       }
    func setupSUSecondLabelConstraints(){
        SUSecondLabel.text = "Create an account so you can explore all the\nexisting jobs"
        SUSecondLabel.numberOfLines = 0
        SUSecondLabel.textAlignment = .center
        SUSecondLabel.font = UIFont(name: "Poppins-SemiBold", size: 14)
        SUSecondLabel.textColor = .black
        SUSecondLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(SUSecondLabel)
          NSLayoutConstraint.activate([
            SUSecondLabel.topAnchor.constraint(equalTo: SUFirstLabel.bottomAnchor, constant: 26),
            SUSecondLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
          ])
       }
    func setupSUTextfieldStackConstraints(){
        SUTextfieldStack.axis = .vertical
        SUTextfieldStack.spacing = 26
        SUTextfieldStack.distribution = .fillEqually
        SUTextfieldStack.translatesAutoresizingMaskIntoConstraints = false
        SUTextfieldStack.addArrangedSubview(SUEmailTextField)
        SUTextfieldStack.addArrangedSubview(SUPasswordTextField)
        SUTextfieldStack.addArrangedSubview(SUConfirmPasswordTextField)
        view.addSubview(SUTextfieldStack)
        NSLayoutConstraint.activate([
            SUTextfieldStack.topAnchor.constraint(equalTo: SUSecondLabel.bottomAnchor,constant: 53),
            SUTextfieldStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            SUTextfieldStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            SUTextfieldStack.heightAnchor.constraint(equalToConstant: 244)
          ])
       }
    func setupSUButtonConstraints(){
        SUButton.setTitle("Sign Up", for: .normal)
        SUButton.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 20)
        SUButton.backgroundColor = UIColor(named: "darkblue")
        SUButton.setTitleColor(.white, for: .normal)
        SUButton.layer.cornerRadius = 10
        SUButton.layer.shadowColor = UIColor(red: 209/255, green: 203/255, blue: 225/255, alpha: 1).cgColor
        SUButton.layer.shadowOpacity = 1
        SUButton.layer.shadowOffset = CGSize(width: 0, height: 10)
        SUButton.layer.shadowRadius = 20 //blur
        SUButton.translatesAutoresizingMaskIntoConstraints = false
        SUButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        view.addSubview(SUButton)
        NSLayoutConstraint.activate([
            SUButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 39),
            SUButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -39),
            SUButton.heightAnchor.constraint(equalToConstant: 60),
            SUButton.topAnchor.constraint(equalTo: SUTextfieldStack.bottomAnchor, constant: 53),
          ])
       }
    func setupSUThirdLabelConstraints(){
        SUThirdLabel.text = "Already have an account"
        SUThirdLabel.numberOfLines = 1
        SUThirdLabel.font = UIFont(name: "Poppins-SemiBold", size: 14)
        SUThirdLabel.textColor = UIColor(named: "lightblue")
        SUThirdLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(SUThirdLabel)
        NSLayoutConstraint.activate([
            SUThirdLabel.topAnchor.constraint(equalTo: SUButton.bottomAnchor,constant: 40),
            SUThirdLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
          ])
       }
    func setupSUContinueWidthLabelConstraints(){
        SUContinueWidthLabel.text = "Or continue with"
        SUContinueWidthLabel.numberOfLines = 1
        SUContinueWidthLabel.font = UIFont(name: "Poppins-SemiBold", size: 14)
        SUContinueWidthLabel.textColor = UIColor(named: "secondLabelColor")
        SUContinueWidthLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(SUContinueWidthLabel)
        NSLayoutConstraint.activate([
            SUContinueWidthLabel.topAnchor.constraint(equalTo: SUThirdLabel.bottomAnchor,constant: 75),
            SUContinueWidthLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
          ])
       }
        func configureAllSetups(){
            setupSUFirstLabelConstraints()
            setupSUSecondLabelConstraints()
            setupSUTextfieldStackConstraints()
            setupSUButtonConstraints()
            setupSUThirdLabelConstraints()
            setupSUContinueWidthLabelConstraints()
        }
    
    
      

        @objc func signUpTapped() {
            guard let email = SUEmailTextField.text, !email.isEmpty,
                  let password = SUPasswordTextField.text, !password.isEmpty else {
                    print("Email və ya password boşdur")
                
                    showAlert(title: "ERROR", message: "you can't pass the gaps empty")
                    
                return
            }
            guard password == SUConfirmPasswordTextField.text else {
                print("Passwords do not match")
                showAlert(title: "ERROR", message: "Your password is not same")
                return
            }
            Auth.auth().createUser(withEmail: email, password: password) { [self] authResult, error in
                if let e = error as NSError?{
                    switch AuthErrorCode(rawValue: e.code) {
                        case .invalidEmail:
                            self.showAlert(title: "ERROR", message: "Email format is not correct")
                        case .emailAlreadyInUse:
                            self.showAlert(title: "ERROR", message: "email is invalid")
                        case .weakPassword:
                            self.showAlert(title: "ERROR", message: "password is so weak")
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
