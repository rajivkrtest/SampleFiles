import UIKit

extension UIScrollView {
    func setContentViewSize(offset:CGFloat = 0.0) {
        // dont show scroll indicators
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        
        var maxHeight : CGFloat = 0
        for view in subviews {
            if view.isHidden {
                continue
            }
            let newHeight = view.frame.origin.y + view.frame.height
            if newHeight > maxHeight {
                maxHeight = newHeight
            }
        }
        // set content size
        contentSize = CGSize(width: contentSize.width, height: maxHeight + offset)
        // show scroll indicators
        showsHorizontalScrollIndicator = true
        showsVerticalScrollIndicator = true
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func popViewController() -> Void {
        self.navigationController?.popViewController(animated: true)
    }
    
    func popToRootViewController() -> Void {
        self.navigationController?.popToRootViewController(animated: true)
    }
}

extension UINavigationController {
    
    func backToViewController(indx: NSInteger)  {
        let controllersArray = self.viewControllers
        if indx <= controllersArray.count {
            self.popToViewController(controllersArray[indx], animated: true)
        }
    }
}

class RootViewController: UIViewController {    
    
    var shadowView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let button: UIButton = UIButton(type: UIButtonType.custom)
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        
        button.setImage(UIImage(named: "headerlogo"), for: UIControlState.normal)
        button.addTarget(self, action: #selector(actionHeaderTap(sender:)), for: UIControlEvents.touchUpInside)
        self.navigationItem.titleView = button
        self.hideKeyboardWhenTappedAround()
        
        let barHeight = self.navigationController?.navigationBar.frame.height ?? 0
        shadowView = UIView.init(frame: CGRect.init(x: 8, y: barHeight, width: self.view.frame.size.width - 16, height: 1))
        shadowView.backgroundColor = Colors.title
        self.navigationController?.navigationBar.addSubview(shadowView)
        
//        let btnMenu = UIButton(type: UIButtonType.system)
//        btnMenu.setImage(UIImage(named: "ico_menu"), for: .normal)
//        btnMenu.setTitleColor(Colors.title, for: .normal)
//        btnMenu.titleLabel?.font = UIFont(name: "Arial-Bold", size: 16)
//        btnMenu.setTitle("Menu", for: .normal)
//        btnMenu.alignImageRight()
//        btnMenu.frame = CGRect.init(x: 0, y: 0, width: 60, height: 30)
////        btnMenu.addTarget(self, action: #selector(actionMenuTap(sender:)), for: .touchUpInside)
//        self.navigationItem.setRightBarButton(UIBarButtonItem(customView: btnMenu), animated: true);
        
    }
    
    @objc func actionMenuTap(sender: Any) -> Void {
        print("actionMenuTap")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.loadOnboardingController()
    }
    
    @objc func actionHeaderTap(sender: Any) -> Void {
        popToRootViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
