//
//  MenuRootViewController.swift
//
//  Created by Apple on 11/26/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

extension UIViewController {    
    func setNavigationBarItem() {
        self.addRightBarButtonWithImage(UIImage(named: "ico_menu")!)
        self.slideMenuController()?.removeRightGestures()
        self.slideMenuController()?.addRightGestures()
    }
    
    func removeNavigationBarItem() {
        self.navigationItem.rightBarButtonItem = nil
        self.slideMenuController()?.removeRightGestures()
    }
    
}

class MenuRootViewController: RootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(menuItemSelected(notification:)), name: NSNotification.Name(rawValue: "MenuItemSelected"), object: nil)
    }

    @objc func menuItemSelected(notification: NotificationCenter) -> Void {
        self.popToRootViewController()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
