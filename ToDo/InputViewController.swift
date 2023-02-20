//
//  InputViewController.swift
//  ToDo
//
//  Created by まちだこうたろう on 2023/02/20.
//

import UIKit

class InputViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextField!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    var titles: [String] = []
    var contents: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveData.register(defaults: ["titles": [], "contents": [] ])
        
        titles = saveData.object(forKey: "titles") as! [String]
        contents = saveData.object(forKey: "contents") as! [String]
        
        print(titles)
        print(contents)
        
        titleTextField.delegate = self
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func saveToDoList(_ sender: Any) {
        let title = titleTextField.text!
        let content = contentTextField.text!
        
        titles.append(title)
        contents.append(content)
        
        saveData.set(titles, forKey: "titles")
        saveData.set(contents, forKey: "contents")
        
        let alert: UIAlertController = UIAlertController(title: "保存", message: "メモの保存が完了しました。", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: { action in self.navigationController?.popViewController(animated: true)})
        )
        present(alert, animated: true, completion: nil)
    }
}
