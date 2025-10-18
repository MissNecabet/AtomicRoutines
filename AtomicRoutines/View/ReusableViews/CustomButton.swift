//
//  CustomButton.swift
//  AtomicRoutines
//
//  Created by Najabat Sofiyeva on 15.10.25.
//
import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }

    private func setupButton() {
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = .systemBlue
        self.layer.cornerRadius = 10
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    func setTitle(_ title: String) {
        self.setTitle(title, for: .normal)
    }
}

