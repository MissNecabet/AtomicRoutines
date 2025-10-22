//
//  HomeView.swift
//  AtomicRoutines
//
//  Created by Najabat Sofiyeva on 15.10.25.
//
import UIKit
import FirebaseAuth


class CalendarViewController: UIViewController {
    private let customNav = NavigationBarView()
    private var selectedDate: Date?
    private let calendarView = CalendarView()
    private var bottomView: UIView?
    private let scheduleView = ScheduleView()
    private let noScheduleView = NoScheduleView()
    override func viewDidLoad() {
            super.viewDidLoad()
        view.backgroundColor = UIColor(named: "lightblue")
        customNav.delegate = self
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

extension CalendarViewController:NavigationBarViewDelegate{
    func navigationBarDidTapSignOut() {
           do {
               try Auth.auth().signOut()
               print("Sign out success")
               let startVC = StartViewController()
               let navController = UINavigationController(rootViewController: startVC)
               if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let sceneDelegate = windowScene.delegate as? SceneDelegate,
                  let window = sceneDelegate.window {
                   window.rootViewController = navController
                   window.makeKeyAndVisible()
               }
           } catch let error {
               print("Error signing out: \(error.localizedDescription)")
           }
       }
}
