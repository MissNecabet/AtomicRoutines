//
//  RoutineTableViewController.swift
//  AtomicRoutines
//
//  Created by Najabat Sofiyeva on 18.10.25.
//

import UIKit

class RoutineTableViewController: UIViewController {

    // MARK: - Properties
    private let tableView = UITableView()
    private let addButton = UIButton()
    private var items:[String] = []
    private var routineRowArray: [RoutineRow] = []

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "cellcolor")
        setupAddButton()
        setupTableView()
    }

// VIEW AND CONSTRAINTS SETUPS FOR ROUTINE TABLE
    private func setupAddButton() {
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.backgroundColor = .systemBlue
        addButton.setTitle("+", for: .normal)
        addButton.setTitleColor(.white, for: .normal)
        addButton.titleLabel?.font = .systemFont(ofSize: 50, weight: .bold)
        addButton.layer.cornerRadius = 30
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        view.addSubview(addButton)

        NSLayoutConstraint.activate([
            addButton.widthAnchor.constraint(equalToConstant: 60),
            addButton.heightAnchor.constraint(equalToConstant: 60),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }

    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(named: "cellcolor")
        tableView.separatorStyle = .none
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: -10)
        ])
    }
//ALERT FOR ROUTINE CELL

    @objc private func addButtonTapped() {
        addUpdateRoutineRow(title:nil, alertInfo: "add new routine", action: "add") {[weak self] text in
            let newRoutine = RoutineRow(isDone: false, title: text)
             self?.routineRowArray.append(newRoutine)
            self?.tableView.reloadData()
        }
    }
  
    private func addUpdateRoutineRow( title:String? ,alertInfo:String,action:String,completion:@escaping (String)->Void){
        let alert = UIAlertController(title: alertInfo, message:nil, preferredStyle: .alert)
        alert.addTextField(){textField in
            textField.text = title
        }
        let save = UIAlertAction(title: action, style: .default) { _ in
            guard let Text = alert.textFields?.first?.text , !Text.isEmpty else {return}
            completion(Text)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
       
        alert.addAction(save)
        alert.addAction(cancel)
        self.present(alert, animated: true)
        
    }
}




extension RoutineTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routineRowArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
            return UITableViewCell()
        }
        cell.configure(with: routineRowArray[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let title = routineRowArray[indexPath.row].title
        addUpdateRoutineRow(title: title, alertInfo: "update your routine", action: "update") {[weak self] text in

            self?.routineRowArray[indexPath.row].title = text
            self?.tableView.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
