//
//  CalculationViewController.swift
//  Warikan2
//
//  Created by 野崎陽奈子 on 2019/10/04.
//  Copyright © 2019 野崎陽奈子. All rights reserved.
//

import UIKit

class CalculationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var changeLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    var groupArray: [Dictionary<String, String>] = []
    
    let saveData = UserDefaults.standard
    
    var bunbo: Int = 0
    var total: String = ""
    var firstTotal: Int = 0
    var nowTotal: Int = 0
    //var nowChange: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        if saveData.string(forKey: "total") != nil {
            total = saveData.string(forKey: "total")!
            saveData.removeObject(forKey: "total")
        }
        //cell.todoLabel.text = nowIndexPathDictionary
        //var bunbo: Int = 0
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if saveData.array(forKey: "group") != nil {
            groupArray = saveData.array(forKey: "group") as! [Dictionary<String, String>]
        }
        
        tableView.reloadData()
        
        
        for i in 0..<groupArray.count{
            let groupInformation = groupArray[i]
            bunbo += (Int(groupInformation["member"]!) ?? 0)*(Int(groupInformation["ratio"]!) ?? 0)
        }
        //print(bunbo)
        
        
        //        tableView.estimatedRowHeight = 100
        //        tableView.rowHeight = UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return groupArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "calculation", for: indexPath) as! CalculationTableViewCell
        
        var upClosure = { (member: String) -> Void in
               //totalLabel.text = 1
            let nowTotalLabel = Int(self.totalLabel.text!)
            self.totalLabel.text = String(nowTotalLabel! + Int(member)!)
            let nowChangeLabel = Int(self.changeLabel.text!)
            self.changeLabel.text = String(nowChangeLabel! + Int(member)!)
                  }
        var downClosure = { (member: String) -> Void in
           //totalLabel.text = 1
        let nowTotalLabel = Int(self.totalLabel.text!)
        self.totalLabel.text = String(nowTotalLabel! - Int(member)!)
        let nowChangeLabel = Int(self.changeLabel.text!)
        self.changeLabel.text = String(nowChangeLabel! - Int(member)!)
              }
        /*
         if saveData.string(forKey: "total") != nil {
         let total = saveData.string(forKey: "total")
         saveData.removeObject(forKey: "total")
         }
         
         for i in 0..<groupArray.count{
         
         }*/
        //print(total)
        
        
        let groupInformation = groupArray[indexPath.row]
        let ratio: Int = (Int(groupInformation["ratio"]!) ?? 0)
        let money: Int = (Int(total) ?? 0) * ratio/bunbo
        cell.groupLabel.text = groupInformation["group"]
        cell.moneyLabel.text = String(money)
        cell.memberLabel.text = groupInformation["member"]
        
        firstTotal+=money*(Int(groupInformation["member"]!) ?? 0)
        //print(nowTotal)
        totalLabel.text = String(firstTotal)
        changeLabel.text = String(firstTotal-(Int(total) ?? 0))
        
        cell.upClosure=upClosure
        cell.downClosure=downClosure
        
       
        //closure()
       
        // Configure the cell...
        
        return cell
    }
    
    
    //let closure = { print("クロージャテスト") }
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
