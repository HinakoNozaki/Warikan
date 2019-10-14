//
//  AddViewController.swift
//  Warikan2
//
//  Created by 野崎陽奈子 on 2019/10/04.
//  Copyright © 2019 野崎陽奈子. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate  {
    @IBOutlet weak var groupTextField: UITextField!
    @IBOutlet weak var memberTextField: UITextField!
    @IBOutlet weak var ratioTextField: UITextField!
    
    var groupArray: [Dictionary<String, String>] = []
    
    let saveData = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groupTextField.delegate = self
        self.memberTextField.keyboardType = UIKeyboardType.numberPad
        self.ratioTextField.keyboardType = UIKeyboardType.numberPad
        if saveData.dictionary(forKey: "change") != nil {
            
            let dic = saveData.dictionary(forKey: "change")
            groupTextField.text = dic?["group"] as? String
            memberTextField.text = dic?["member"] as? String
            ratioTextField.text = dic?["ratio"] as? String
            saveData.removeObject(forKey: "change")
        }
        if saveData.array(forKey: "group") != nil {
            groupArray = saveData.array(forKey: "group") as! [Dictionary<String, String>]
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        groupTextField.resignFirstResponder()
        return true
    }
    
    @IBAction func save() {
        
        if groupTextField.text!=="" || memberTextField.text!=="" || ratioTextField.text!=="" {
            let alert: UIAlertController = UIAlertController(title: "必須項目", message: "グループ・人数・比率は必須項目です", preferredStyle: .alert)
            alert.addAction(
                UIAlertAction(
                    title: "OK", style: .default, handler: {action in
                        print("ボタンが押された")
                }
            ))
            present(alert, animated: true, completion: nil)
        }else{
            let groupDictionary = ["group": groupTextField.text!, "member":String(memberTextField.text!), "ratio":String(ratioTextField.text!)]
            
            if saveData.string(forKey: "number") != nil {
                let num: Int = saveData.integer(forKey: "number")
                
                groupArray[num] = groupDictionary
                
                saveData.removeObject(forKey: "number")
                
            }else {
                groupArray.append(groupDictionary)
            }
            
            saveData.set(groupArray, forKey: "group")
            
            groupTextField.text = ""
            memberTextField.text = ""
            ratioTextField.text = ""
            
            self.dismiss(animated: true, completion: nil)
            //navigationController?.popViewController(animated: true)
        }
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
