//
//  ViewController.swift
//  Swift5TableViewBasic1
//
//  Created by Takuya Ando on 2020/12/08.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
  
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var tableView: UITableView!
  
  var textArray = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.delegate = self
    tableView.dataSource = self
    textField.delegate = self

  }
  
  // セクションの中のセルの数（必須）
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return textArray.count
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  }
  
  
  // セルを構築する（必須）
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    // textArrayの中のrow番目
    cell.textLabel?.text = textArray[indexPath.row]
    cell.imageView!.image = UIImage(named: "checkImage")
    
    return cell
  }
  
  // セルの高さ
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return view.frame.size.height/6
  }
  
  // キーボードのリターンが押されたときに発火
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
    textArray.append(textField.text!)
    // キーボードを閉じる
    textField.resignFirstResponder()
    textField.text = ""
    
    
    tableView.reloadData()
    
    return true
  }
}

