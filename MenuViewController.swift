//
//  MenuViewController.swift
//
//  Created by Apple on 11/26/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import Foundation

class MenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageViewIcon: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

class RightMenuItem {
    var title: NSAttributedString!
    var image: UIImage!
    init(title: NSAttributedString!, image: UIImage!) {
        self.title = title
        self.image = image
    }
}

enum RightMenu: Int {
    case home = 0
    case accounts
    case transfers
    case cards
    case loan
    case settings
    case rewards
    case help
    case signout
    case fastpay
}

protocol RightMenuProtocol : class {
    func changeViewController(_ menu: RightMenu)
}

class MenuViewController: UIViewController, RightMenuProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    
    var menus = [RightMenuItem(title: NSAttributedString(string: "Home"), image: UIImage(named: "down_arrow")),
                 RightMenuItem(title: NSAttributedString(string: "My Accounts"), image: UIImage(named: "down_arrow")),
                 RightMenuItem(title: NSAttributedString(string: "Transfers & Payments"), image: UIImage(named: "down_arrow")),
                 RightMenuItem(title: NSAttributedString(string: "My Card"), image: UIImage(named: "down_arrow")),
                 RightMenuItem(title: NSAttributedString(string: "My Loans"), image: UIImage(named: "down_arrow")),
                 RightMenuItem(title: NSAttributedString(string: "Settings"), image: UIImage(named: "down_arrow")),
                 RightMenuItem(title: NSAttributedString(string: "Rewards"), image: UIImage(named: "down_arrow")),
                 RightMenuItem(title: NSAttributedString(string: "Help & Support"), image: UIImage(named: "down_arrow")),
                 RightMenuItem(title: NSAttributedString(string: "Sign Out"), image: UIImage(named: "down_arrow")),
                 RightMenuItem(title: NSAttributedString(string: "Strings.fastpayMenuLogo"), image: UIImage(named: "down_arrow"))]
    
    @IBOutlet weak var imageViewHeader: UIImageView!
    
    var mainViewController: UIViewController?
    var accountsViewController: UIViewController?
    var transfersViewController: UIViewController?
    var cardViewController: UIViewController?
    var loanViewController: UIViewController?
    var settingsViewController: UIViewController?
    var rewardsViewController: UIViewController?
    var helpViewController: UIViewController?
    var fastpayViewController: UIViewController?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.accountsViewController = UINavigationController(rootViewController: (self.storyboard?.instantiateViewController(withIdentifier: "OneViewController"))!)
        
        self.transfersViewController = UINavigationController(rootViewController: (self.storyboard?.instantiateViewController(withIdentifier: "OneViewController"))!)
        
        self.cardViewController = UINavigationController(rootViewController: (self.storyboard?.instantiateViewController(withIdentifier: "OneViewController"))!)
        
        self.loanViewController = UINavigationController(rootViewController: (self.storyboard?.instantiateViewController(withIdentifier: "OneViewController"))!)
        
        self.settingsViewController = UINavigationController(rootViewController: (self.storyboard?.instantiateViewController(withIdentifier: "OneViewController"))!)
        
        self.rewardsViewController = UINavigationController(rootViewController: (self.storyboard?.instantiateViewController(withIdentifier: "OneViewController"))!)
        
        self.helpViewController = UINavigationController(rootViewController: (self.storyboard?.instantiateViewController(withIdentifier: "OneViewController"))!)
        
        self.fastpayViewController = UINavigationController(rootViewController: (self.storyboard?.instantiateViewController(withIdentifier: "OneViewController"))!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.layoutIfNeeded()
    }
    
    func changeViewController(_ menu: RightMenu) {
        switch menu {
        case .home:
            self.slideMenuController()?.changeMainViewController(self.mainViewController!, close: true)
            break
        case .accounts:
            self.slideMenuController()?.changeMainViewController(self.accountsViewController!, close: true)
            break
        case .transfers:
            self.slideMenuController()?.changeMainViewController(self.transfersViewController!, close: true)
            break
        case .cards:
            self.slideMenuController()?.changeMainViewController(self.cardViewController!, close: true)
            break
        case .loan:
            self.slideMenuController()?.changeMainViewController(self.loanViewController!, close: true)
            break
        case .settings:
            self.slideMenuController()?.changeMainViewController(self.settingsViewController!, close: true)
            break
        case .rewards:
            self.slideMenuController()?.changeMainViewController(self.rewardsViewController!, close: true)
            break
        case .help:
            self.slideMenuController()?.changeMainViewController(self.helpViewController!, close: true)
            break
        case .signout:
//            AlertController.alert(UIApplication.appName, message: "Are you sure you want to sign out?", buttons: ["Cancel", "Sign Out"], tapBlock: { (action, index) in
//                if index == 1 {
//                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
//                    appDelegate.loadRegistrationController()
//                }
//            })
            break
        case .fastpay:
            self.slideMenuController()?.changeMainViewController(self.fastpayViewController!, close: true)
            break
        }
        
        NotificationCenter.default.post(name: Notification.Name("MenuItemSelected"), object: nil)
    }
}

extension MenuViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let menu = RightMenu(rawValue: indexPath.row) {
            self.changeViewController(menu)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.tableView == scrollView {
            
        }
    }
}

extension MenuViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell!
        let item = menus[indexPath.row]
        
        cell?.lblTitle?.attributedText = item.title!
        cell?.imageViewIcon?.image = item.image!
        
        return cell!
    }
}


