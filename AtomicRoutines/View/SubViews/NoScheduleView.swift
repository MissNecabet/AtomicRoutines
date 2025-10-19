//
//  NoScheduleView.swift
//  AtomicRoutines
//
//  Created by Najabat Sofiyeva on 15.10.25.
//

import UIKit

class NoScheduleView: UIView{
    private let label = UILabel()
    private let imageView = UIImageView()
    override init(frame: CGRect) {
           super.init(frame: frame)
        backgroundColor = UIColor(named: "lightblue")
        setupNoScheduleView()
           
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    func setupNoScheduleView(){
        label.text = "No Schedule"
        label.textColor = .lightGray
        label.font = UIFont(name:"Poppins-SemiBold",size:20)
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named:"noSchedule")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        NSLayoutConstraint.activate([
           
            imageView.widthAnchor.constraint(equalToConstant: 54),
            imageView.heightAnchor.constraint(equalToConstant: 54),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            label.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

}
