//
//  AddViewController.swift
//  Warikan2
//
//  Created by 野崎陽奈子 on 2019/10/04.
//  Copyright © 2019 野崎陽奈子. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    @IBOutlet weak var groupTextField: UITextField!
    @IBOutlet weak var memberTextField: UITextField!
    @IBOutlet weak var ratioTextField: UITextField!
    
    var groupArray: [Dictionary<String, String>] = []
    //var memberArray: [String] = []
    //var ratioArray: [String] = []
    
    let saveData = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if saveData.dictionary(forKey: "change") != nil {
            //groupTextField.text = saveData.string(forKey: "change")
            let dic = saveData.dictionary(forKey: "change")
            groupTextField.text = dic?["group"] as? String
            memberTextField.text = dic?["member"] as? String
            ratioTextField.text = dic?["ratio"] as? String
            saveData.removeObject(forKey: "change")
        }
        if saveData.array(forKey: "group") != nil {
            groupArray = saveData.array(forKey: "group") as! [Dictionary<String, String>]
        }
        /*if saveData.array(forKey: "member") != nil {
            memberArray = saveData.array(forKey: "member") as! [String]
        }
        if saveData.array(forKey: "ratio") != nil {
            ratioArray = saveData.array(forKey: "ratio") as! [String]
        }*/
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save() {
        let groupDictionary = ["group": groupTextField.text!, "member":String(memberTextField.text!), "ratio":String(ratioTextField.text!)]
        
        if saveData.string(forKey: "number") != nil {
            let num: Int = saveData.integer(forKey: "number")
            groupArray[num] = groupDictionary
            //print(groupDictionary)
            //print(groupArray[num])
            saveData.removeObject(forKey: "number")
        }else {
        groupArray.append(groupDictionary)
        }
        //memberArray.append(memberTextField.text!)
        //ratioArray.append(ratioTextField.text!)
        saveData.set(groupArray, forKey: "group")
        //saveData.set(memberArray, forKey: "member")
        //saveData.set(ratioArray, forKey: "ratio")
        //print(groupArray)
        groupTextField.text = ""
        memberTextField.text = ""
        ratioTextField.text = ""
        
        self.dismiss(animated: true, completion: nil)
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
