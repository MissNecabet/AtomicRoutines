//
//  ScheduleView.swift
//  AtomicRoutines
//
//  Created by Najabat Sofiyeva on 15.10.25.
//

import UIKit
import UIKit


class ScheduleView: UIView {
    let routineVC = RoutineTableViewController()
 
    private var routineRawArray: [RoutineRow] = []
    private let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    //xeber gonderir ki handleroutineupdate ise dussun
        NotificationCenter.default.addObserver(self, selector: #selector(handleRoutineUpdate(_:)), name: .routineUpdated, object: nil)
 

        setupTableView()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(named: "lightblue")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    
    func loadData(_ data: [RoutineRow]) {
        self.routineRawArray = data
        tableView.reloadData()
    }
    
  
  
}

extension ScheduleView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routineRawArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
            return UITableViewCell()
        }
        let task = routineRawArray[indexPath.row]
        cell.readOnlyConfigure(with: task)
      
       
        return cell
    }

    @objc private func handleRoutineUpdate(_ notification: Notification) {
        guard let tasks = notification.userInfo?["tasks"] as? [RoutineRow] else { return }
        self.routineRawArray = tasks
        tableView.reloadData()
        print("ScheduleView updated:", tasks) 
    }

   
}

