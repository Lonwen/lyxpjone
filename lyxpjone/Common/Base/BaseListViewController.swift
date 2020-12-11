//
//  BaseListViewController.swift
//  lyxpjone
//
//  Created by lyx on 2020/12/12.
//

import UIKit

class BaseListViewController: BaseViewController {
    
    lazy var tableView : UITableView = {
        
        let tableView : UITableView = UITableView.init(frame: self.view.bounds, style: UITableView.Style.plain)
        
        tableView.backgroundColor = UIColor.clear
        
//        tableView.estimatedRowHeight = 100
        
        tableView.separatorStyle = .none
        
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.dataSource = self
        
        tableView.delegate = self
        
        //适配使用 解决push到下一个页面 tableview下移一段距离
        if #available(iOS 11.0, *) {
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
        }
        return tableView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addTableView()
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

extension BaseListViewController: UITableViewDataSource ,UITableViewDelegate {
    
    func addTableView()  {
        
        view.addSubview(self.tableView)
        
        self.tableView.snp.makeConstraints { (make) in
            
            make.edges.equalTo(self.view).inset(UIEdgeInsets(top: STATUS_BAR_HEIGHT + 44 , left: 0, bottom: 0, right: 0))
            
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init()
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 100;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}
