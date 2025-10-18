//
//  HomeView.swift
//  AtomicRoutines
//
//  Created by Najabat Sofiyeva on 15.10.25.
//
import UIKit

class CalendarViewController: UIViewController {
    let calendarView = CalendarView()
    let noScheduleView = NoScheduleView()
    override func viewDidLoad() {
            super.viewDidLoad()
        view.backgroundColor = .systemBackground
            setupConstraints()
         
          }
    private func setupConstraints() {
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        noScheduleView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(calendarView)
        view.addSubview(noScheduleView)
        
        NSLayoutConstraint.activate([
            // Calendar üst yarıda
            calendarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10),
            calendarView.bottomAnchor.constraint(equalTo: noScheduleView.topAnchor,constant: -10),
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            calendarView.heightAnchor.constraint(equalToConstant: 350), // hündürlük əlavə edildi

            // NoScheduleView ekranın aşağı yarısında
            noScheduleView.topAnchor.constraint(equalTo: calendarView.bottomAnchor),
            noScheduleView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            noScheduleView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            noScheduleView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
        ])
        
       
    }


}
