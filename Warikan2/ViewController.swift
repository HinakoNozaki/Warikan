//
//  ViewController.swift
//  Warikan2
//
//  Created by 野崎陽奈子 on 2019/10/01.
//  Copyright © 2019 野崎陽奈子. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var totalTextField: UITextField!
    
    var groupArray: [Dictionary<String, String>] = []
    //var memberArray: [String] = []
    //var ratioArray: [String] = []
    //override var title: [String, String]
    
    let saveData = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        saveData.removeObject(forKey: "group")
        
        self.totalTextField.keyboardType = UIKeyboardType.numberPad
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
             super.viewWillAppear(true)
        if saveData.array(forKey: "group") != nil {
            groupArray = saveData.array(forKey: "group") as! [Dictionary<String, String>]
        }
        
        tableView.reloadData()
            
        
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
           let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListTableViewCell
           
           let nowIndexPathDictionary = groupArray[indexPath.row]
           //cell.todoLabel.text = nowIndexPathDictionary
           
           cell.groupLabel.text = nowIndexPathDictionary["group"]
            cell.memberLabel.text = nowIndexPathDictionary["member"]
            cell.ratioLabel.text = nowIndexPathDictionary["ratio"]

           // Configure the cell...

           return cell
       }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groupArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveData.set(groupArray, forKey: "group")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     //selectedText = groupArray[indexPath.row]
     //print("\(indexPath.row)番のセルを選択しました！ ")
     //print("\(todoArray[indexPath.row])を選択しました！ ")
     
     let word = groupArray[indexPath.row]
     let num = indexPath.row
        //print(word)
        //print(num)
     saveData.set(word, forKey: "change")
     saveData.set(num, forKey: "number")
     performSegue(withIdentifier: "edit", sender: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
     
    @IBAction func go() {
        saveData.set(String(totalTextField.text!), forKey: "total")
        //print(totalTextField.text!)
        
        self.performSegue(withIdentifier: "account", sender: nil)
    }
}

