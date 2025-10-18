//
//  TopBarView.swift
//  AtomicRoutines
//
//  Created by Najabat Sofiyeva on 17.10.25.
//

import UIKit

class NavigationBarView: UIView {
    private let checkListImage = UIImageView()
    private let signoutLabel = UILabel()

        override init(frame: CGRect) {
            super.init(frame: frame)
            setupUI()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    func setupUI(){
        
        checkListImage.image = UIImage(named: "checkList")
        checkListImage.contentMode = .scaleAspectFit
        checkListImage.translatesAutoresizingMaskIntoConstraints = false
        
        signoutLabel.text = "Sign Out"
        signoutLabel.font = UIFont(name: "Poppins-SemiBold", size: 20)
        signoutLabel.textColor = .white
        signoutLabel.translatesAutoresizingMaskIntoConstraints = false
         
        addSubview(checkListImage)
        addSubview(signoutLabel)
        
        NSLayoutConstraint.activate([
            checkListImage.topAnchor.constraint(equalTo: topAnchor,constant:36),
            checkListImage.bottomAnchor.constraint(equalTo: bottomAnchor,constant:-10),
            checkListImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            checkListImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            signoutLabel.topAnchor.constraint(equalTo: topAnchor,constant:39),
            signoutLabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant:-7),
            signoutLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            signoutLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
                       
            heightAnchor.constraint(equalToConstant: 103)
        ])
    }
    

}
