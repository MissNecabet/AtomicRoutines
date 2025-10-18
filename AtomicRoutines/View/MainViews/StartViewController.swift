//
//  StartView.swift
//  AtomicRoutines
//
//  Created by Najabat Sofiyeva on 15.10.25.
//

import UIKit

final class StartViewController: UIViewController {

  
    private let mainImageView = UIImageView()
   
    private let titleLabel = UILabel()

    private let secondLabel = UILabel()

    private let registerButton = CustomButton()

    private let loginButton = CustomButton()

    private let buttonStack = UIStackView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureAllSetups()
      

    }
   
    func setupMainImageViewConstraints(){
        mainImageView.image = UIImage(named: "backgroundImage")
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainImageView)
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            mainImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            mainImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22)
        ])
        
    }
    func setupTitleLabelConstraints(){
        titleLabel.text = "Discover Your\nDaily Power"
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "Poppins-SemiBold", size: 35)
        titleLabel.textColor = UIColor(named: "textColor")
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 47),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22)
        ])
        
    }
    
    func setupSecondLabelConstraints(){
           secondLabel.text = " Your Routine Shapes Your Identity. \nEach routine, no matter how small,\n builds the foundation of your future self."
           secondLabel.numberOfLines = 0
           secondLabel.textAlignment = .center
           secondLabel.font = UIFont(name: "Poppins-SemiBold", size: 14)
           secondLabel.textColor = UIColor(named: "secondLabelColor")
           secondLabel.translatesAutoresizingMaskIntoConstraints = false
           view.addSubview(secondLabel)
           NSLayoutConstraint.activate([
            secondLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 23),
            secondLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
    }
      
    func setupBottomStack(){
        loginButton.setTitle("Login")
        registerButton.setTitle("Register")
        buttonStack.axis = .horizontal
        buttonStack.spacing = 30
        buttonStack.distribution = .fillEqually
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        buttonStack.addArrangedSubview(registerButton)
        buttonStack.addArrangedSubview(loginButton)
        view.addSubview(buttonStack)
        NSLayoutConstraint.activate([
            buttonStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 39),
            buttonStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -39),
            buttonStack.heightAnchor.constraint(equalToConstant: 60),
            buttonStack.topAnchor.constraint(equalTo: secondLabel.bottomAnchor, constant: 40)
            
        ])
    }

    
      @objc private func didTapRegister() {
          let vc = RegisterViewController()
          navigationController?.pushViewController(vc, animated: true)
      }
      
      @objc private func didTapLogin() {
          let vc = LoginViewController()
          navigationController?.pushViewController(vc, animated: true)
      }
 
    
     func configureAllSetups(){
         registerButton.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
         loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
         
         setupMainImageViewConstraints()
         setupTitleLabelConstraints()
         setupSecondLabelConstraints()
         setupBottomStack()
     }
}
