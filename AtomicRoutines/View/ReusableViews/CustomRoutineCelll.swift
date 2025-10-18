//
//  CustomRoutineCelll.swift
//  AtomicRoutines
//
//  Created by Najabat Sofiyeva on 18.10.25.
//

import UIKit

class CustomCell: UITableViewCell {
    
    static let identifier = "CustomCell"
    
    // MARK: - UI Elements
    let checkCell = UIImageView()
    let titleLabel = UILabel()
    var isMarked = false
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Views
    private func setupViews() {
        // Image
        checkCell.image = UIImage(named: "unmarked")
        checkCell.contentMode = .scaleAspectFit
        checkCell.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(checkCell)
        
        // Title label
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        // Cell background
        contentView.backgroundColor = UIColor(named: "cellcolor")
        
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        checkCell.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector (onTap))
        checkCell.addGestureRecognizer(tapGesture)
        NSLayoutConstraint.activate([
            // Image solda
            checkCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            checkCell.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            checkCell.widthAnchor.constraint(equalToConstant: 24),
            checkCell.heightAnchor.constraint(equalToConstant: 24),
            
            // Title image-in sağında
            titleLabel.leadingAnchor.constraint(equalTo: checkCell.trailingAnchor, constant: 10),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }
    
    // MARK: - Configure Cell
    func configure( with routine:RoutineRow) {
        titleLabel.text = routine.title
        let imageName = routine.isDone ? "marked" : "unmarked"
           checkCell.image = UIImage(named: imageName)
       
    }
    
    @objc func onTap(){
        isMarked.toggle()
        let image = isMarked ? "+" : "unmarked"
        checkCell.image = UIImage(named: image)
    }
}
