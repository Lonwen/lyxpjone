//
//  BaseViewController.swift
//  lyxpjone
//
//  Created by lyx on 2020/12/11.
//

import UIKit

class BaseViewController: UIViewController {
    
    var rightButton :UIButton?
    var titleLabel : UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension BaseViewController {
    
    // MARK: - 设置导航栏标题
    func navTitle(title : String)  {
        
        if self.titleLabel == nil {
            
            self.titleLabel = UILabel.init()
            self.titleLabel?.textAlignment = .center
            self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            self.titleLabel?.textColor = .black
//            self.titleLabel?.backgroundColor = UIColor.red
            
            self.titleLabel?.frame = CGRect.init(x: 0, y: 0, width: 200, height: 44)
            
            self.navigationItem.titleView = self.titleLabel
        }
        
        self.titleLabel?.text = title
    }
    
    func createRightButton(title : String)  {
        
        if rightButton == nil {
            
            rightButton = UIButton.init(type: UIButton.ButtonType.custom)
            
        }
        rightButton?.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        rightButton?.setTitle(title, for: UIControl.State.normal)
        
        rightButton?.setTitleColor(.black, for: UIControl.State.normal)
        
        rightButton?.frame = CGRect.init(x: 0, y: 0, width: 80, height: 44)
        
        rightButton?.addTarget(self, action: #selector(rightButtonAction(button:)), for: UIControl.Event.touchUpInside)
        
        let item : UIBarButtonItem = UIBarButtonItem.init(customView: rightButton!)
        
        self.navigationItem.rightBarButtonItem = item
        
    }
    
}

// MARK: - target actions
extension BaseViewController{
    
    @objc func rightButtonAction(button : UIButton) {
        
    }
    
}
