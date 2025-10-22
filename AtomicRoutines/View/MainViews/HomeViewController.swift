//
//  TabBar.swift
//  AtomicRoutines
//
//  Created by Najabat Sofiyeva on 16.10.25.
//

import UIKit
import FirebaseAuth

class HomeViewController: UITabBarController {
    let customNav = NavigationBarView()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        createTopBar()
        setupBottomTabBarAppearance()
        self.setupTabs()
     
    }
    
    private func setupTabs(){
        let CalendarTab = self.createNav(title: "Calendar", image: UIImage(named: "calendartab") , vc: CalendarViewController())
        let ListTab = self.createNav(title: "List", image: UIImage(named: "listtab") , vc: RoutineTableViewController())
        self.setViewControllers([CalendarTab,ListTab], animated: true)
    }
    private func createNav(title:String , image:UIImage? ,vc:UIViewController) -> UINavigationController{
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        nav.setNavigationBarHidden(true, animated: false)
        return nav
    }
    private func createTopBar(){
        view.addSubview(customNav)
        customNav.backgroundColor = UIColor(named: "secondLabelColor")
        customNav.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
               customNav.topAnchor.constraint(equalTo: view.topAnchor),
               customNav.leadingAnchor.constraint(equalTo: view.leadingAnchor),
               customNav.trailingAnchor.constraint(equalTo: view.trailingAnchor),
               customNav.heightAnchor.constraint(equalToConstant: 103)])
    }
    private func setupBottomTabBarAppearance() {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(named: "secondLabelColor") 
            
            tabBar.standardAppearance = appearance
            if #available(iOS 15.0, *) {
                tabBar.scrollEdgeAppearance = appearance
            }

        tabBar.tintColor = .darkblue
        tabBar.unselectedItemTintColor = .white
        }
}
