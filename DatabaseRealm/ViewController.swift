//
//  ViewController.swift
//  DatabaseRealm
//
//  Created by 河村大介 on 2021/08/16.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITextFieldDelegate {

    let realm = try! Realm()
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Realmに保存したデータを保持するための変数memoを用意する
        let memo: Memo? = read()
        
        if let memo = memo {
            titleTextField.text = memo.title
            contentTextField.text = memo.content
        }
        
        titleTextField.delegate = self
        contentTextField.delegate = self
        
        saveButton.layer.cornerRadius = 5
    }
    
    // Realmにアクセスして、メモの情報を読み出すメソッド
    func read() -> Memo? {
        return realm.objects(Memo.self).first
    }
    
    
    // メモ内容保存メソッド
    @IBAction func save() {
        let title: String = titleTextField.text!
        let content: String = contentTextField.text!
        
        // すでに保存されているメモを取得して、データがすでにあれば更新、なければ新規メモ作成
        let memo: Memo? = read()
        
        if let memo = memo {
            try! realm.write {
                memo.title = title
                memo.content = content
            }
        } else {
            let newMemo = Memo()
            newMemo.title = title
            newMemo.content = content
            
            try! realm.write {
                realm.add(newMemo)
            }
        }
        
        let alert: UIAlertController = UIAlertController(title: "成功", message: "保存しました", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }

}

