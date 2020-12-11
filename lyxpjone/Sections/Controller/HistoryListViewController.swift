//
//  HistoryListViewController.swift
//  lyxpjone
//
//  Created by lyx on 2020/12/12.
//

import UIKit

class HistoryListViewController: BaseListViewController {
    
    var plist =  DataPlist()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .groupTableViewBackground
        self.plist.gainData()
        print("历史 = \(self.plist.webInfo)")
        
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


extension HistoryListViewController{
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = NSStringFromClass(HistoryCell.self)
        var cell : HistoryCell? = tableView.dequeueReusableCell(withIdentifier: cellId) as? HistoryCell
        if cell == nil {
            cell = HistoryCell.init(style: .default, reuseIdentifier: cellId)
        }
        cell?.webInfo = self.plist.webInfo[indexPath.row]
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.plist.webInfo.count;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}
