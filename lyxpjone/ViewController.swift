//
//  ViewController.swift
//  lyxpjone
//
//  Created by lyx on 2020/12/11.
//

import UIKit
import SnapKit

class ViewController: BaseListViewController {
    
    var  plist =  DataPlist()
    var vm = APIViewModel()
    var res : WebInfo?
    
    var cell = ApiShowCell.init(style: .default, reuseIdentifier: NSStringFromClass(ApiShowCell.self))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navTitle(title: "API")
        createRightButton(title: "历史")
        
        self.plist.gainData()
        self.res = self.plist.webInfo.last
        
        updateAPI()

    }

}


extension ViewController {
    
    func updateAPI() {
  
        DispatchQueue.global().async(execute: {
            sleep(5)
            self.requestAPI()
        })
    }
    
    func requestAPI() {
        
        vm.requestAction?.execute().subscribe(onNext: { (result) in
            
            print("当前时间 = \(Date())")
            self.plist.webInfo.append(WebInfo.init(data: result, time: "\(Date())"))
            self.plist.saveData()
            print("plist 结果 = \(self.plist.webInfo)")
            
            self.res = self.plist.webInfo.last
            self.tableView.reloadData()
            
            self.updateAPI()
            
        }, onError: { (error) in
            print("错误信息\(error.localizedDescription)")
        }, onCompleted: {
            
        }, onDisposed: {
            
        }).disposed(by: self.rx.disposeBag)
        
    }
}



extension ViewController{
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.cell.webInfo = self.res
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}


extension ViewController {
    
    override func rightButtonAction(button: UIButton) {
        self.navigationController?.pushViewController(HistoryListViewController(), animated: true)
    }
}
