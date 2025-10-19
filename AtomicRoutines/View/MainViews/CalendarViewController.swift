//
//  HomeView.swift
//  AtomicRoutines
//
//  Created by Najabat Sofiyeva on 15.10.25.
//
import UIKit


class CalendarViewController: UIViewController {
    var selectedDate: Date?
    let calendarView = CalendarView()
    var bottomView: UIView?
    let scheduleView = ScheduleView()
    let noScheduleView = NoScheduleView()
    override func viewDidLoad() {
            super.viewDidLoad()
        view.backgroundColor = UIColor(named: "lightblue")
            setupConstraints()
        //calendarviewcontroller achilanda no schedule view gorunur. scheduleDateden alinan gune esasen bottomview teyin edilir. ve eger
        self.showBottomView(NoScheduleView())
               calendarView.didSelectDate = { [weak self] date in
                   self?.selectedDate = date
               
                   // calendardan gelen date ile fb sorqu gonderirik. hemin gun ucun rutin elave edilibse
                   // scheduleview daki arraye oturulecek .
                   RoutineManager.shared.loadRoutine(for: date) { tasks in
                       if tasks.isEmpty {
                           self?.showBottomView(self!.noScheduleView)
                       } else {
                           self?.scheduleView.loadData(tasks)
                           self?.showBottomView(self!.scheduleView)
                       }
                   }
               }
         
          }
    
    private func setupConstraints() {
           calendarView.translatesAutoresizingMaskIntoConstraints = false
           view.addSubview(calendarView)

           NSLayoutConstraint.activate([
               calendarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
               calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
               calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
               calendarView.heightAnchor.constraint(equalToConstant: 350),
           ])
       }
    private func showBottomView(_ viewToShow: UIView) {
         
          bottomView?.removeFromSuperview()
          
         
          bottomView = viewToShow
          bottomView?.translatesAutoresizingMaskIntoConstraints = false
          view.addSubview(bottomView!)

          NSLayoutConstraint.activate([
              bottomView!.topAnchor.constraint(equalTo: calendarView.bottomAnchor),
              bottomView!.leadingAnchor.constraint(equalTo: view.leadingAnchor),
              bottomView!.trailingAnchor.constraint(equalTo: view.trailingAnchor),
              bottomView!.bottomAnchor.constraint(equalTo: view.bottomAnchor)
          ])
      
        
       
    }


}
