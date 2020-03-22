//
//  MainTabBarController.swift
//  DashaProject
//
//  Created by Георгий Кашин on 21.03.2020.
//  Copyright © 2020 Georgii Kashin. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let tasksViewController: TasksViewController!
    let mapViewController: MapViewController!
    let trackingLocation: TrackingLocation!
    
    init(friendPhoneNumber: Int? = Int(), tasks: [Task]? = nil) {
        
        tasksViewController = TasksViewController(friendPhoneNumber: friendPhoneNumber, tasks: tasks)
        mapViewController = MapViewController()
        trackingLocation = TrackingLocation()
        
        super.init(nibName: nil, bundle: nil)
    }
    
//    init() {
//        super.init(nibName: nil, bundle: nil)
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        let tasksViewController = TasksViewController(tasks: tasks)
//        let availableTasksViewController = AvailableTasksViewController()
//        let mapViewController = MapViewController()
        
        tabBar.tintColor = #colorLiteral(red: 0.5568627451, green: 0.3529411765, blue: 0.968627451, alpha: 1)
        
        let boldConfig = UIImage.SymbolConfiguration(weight: .medium)
         
        let tasksImage = UIImage(systemName: "list.bullet", withConfiguration: boldConfig)!
        let mapImage = UIImage(systemName: "map", withConfiguration: boldConfig)!
        
        viewControllers = [
            generateNavigationController(rootViewController: tasksViewController, title: "Задачи", image: tasksImage),
            generateNavigationController(rootViewController: mapViewController, title: "Карта", image: mapImage),
        ]
    }
    
    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        
        return navigationVC
    }
}
