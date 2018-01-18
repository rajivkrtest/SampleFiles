//
//  AppDelegate.swift
//  SampleFiles
//
//  Created by Apple on 16/01/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        UIBarButtonItem.appearance().tintColor = Colors.title
//        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedStringKey.font: UIFont(name: "Arial", size: 17.0) as Any], for: .normal)
//        UINavigationBar.appearance().tintColor = Colors.title
//        UINavigationBar.appearance().shadowImage = UIImage()
//        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
//        UINavigationBar.appearance().isTranslucent = false
        
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let dashboardViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let controller = storyBoard.instantiateViewController(withIdentifier: "LandingNavigation") as! UINavigationController
        let menuViewController = storyBoard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        menuViewController.mainViewController = controller
        
        let slideMenuController = ExSlideMenuController(mainViewController: controller, rightMenuViewController: menuViewController);
        slideMenuController.automaticallyAdjustsScrollViewInsets = true
        slideMenuController.delegate = dashboardViewController
        self.window?.backgroundColor = Colors.title
        self.window?.rootViewController = slideMenuController
        
        return true
    }

    
//    func loadRegistrationController() {
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        let controller = storyBoard.instantiateViewController(withIdentifier: "RegistrationNavigation") as! UINavigationController
//        self.window?.rootViewController = controller
//    }
//
//    func loadOnboardingController() {
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        let controller = storyBoard.instantiateViewController(withIdentifier: "OnBoardingNavigation") as! UINavigationController
//        self.window?.rootViewController = controller
//    }
//
//    func loadLandingController() {
//
//        let storyBoard = UIStoryboard(name: "Dashboard", bundle: nil)
//        let dashboardViewController = storyBoard.instantiateViewController(withIdentifier: "LandingViewController") as! LandingViewController
//        let controller = storyBoard.instantiateViewController(withIdentifier: "LandingNavigation") as! UINavigationController
//        let menuViewController = storyBoard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
//        menuViewController.mainViewController = controller
//
//        let slideMenuController = ExSlideMenuController(mainViewController: controller, rightMenuViewController: menuViewController);
//        slideMenuController.automaticallyAdjustsScrollViewInsets = true
//        slideMenuController.delegate = dashboardViewController
//        self.window?.backgroundColor = Colors.title
//        self.window?.rootViewController = slideMenuController
//    }
//
//    func loadDashboardController() {
//
//        Utils.selectedDashboard = Dashboard.batch2.rawValue
//
//        let storyBoard = UIStoryboard(name: "Dashboard", bundle: nil)
//        let dashboardViewController = storyBoard.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
//        let controller = storyBoard.instantiateViewController(withIdentifier: "DashboardNavigation") as! UINavigationController
//        let menuViewController = storyBoard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
//        menuViewController.mainViewController = controller
//
//        let slideMenuController = ExSlideMenuController(mainViewController: controller, rightMenuViewController: menuViewController);
//        slideMenuController.automaticallyAdjustsScrollViewInsets = true
//        slideMenuController.delegate = dashboardViewController
//        self.window?.backgroundColor = Colors.title
//        self.window?.rootViewController = slideMenuController
//
//    }
//
//    func loadNonAccountDashboardController() {
//
//        Utils.selectedDashboard = Dashboard.batch3.rawValue
//
//        let storyBoard = UIStoryboard(name: "Dashboard", bundle: nil)
//        let dashboardViewController = storyBoard.instantiateViewController(withIdentifier: "NonAccountDashboardViewController") as! NonAccountDashboardViewController
//        let controller = storyBoard.instantiateViewController(withIdentifier: "NonAccountDashboardNavigation") as! UINavigationController
//        let menuViewController = storyBoard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
//        menuViewController.mainViewController = controller
//
//        let slideMenuController = ExSlideMenuController(mainViewController: controller, rightMenuViewController: menuViewController);
//        slideMenuController.automaticallyAdjustsScrollViewInsets = true
//        slideMenuController.delegate = dashboardViewController
//        self.window?.backgroundColor = Colors.title
//        self.window?.rootViewController = slideMenuController
//
//    }
//
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

