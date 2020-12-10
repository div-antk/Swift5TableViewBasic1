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
  
  // viewDidLoadは1度しか呼ばれないが、viewWillAppearは画面が表示されるたびに呼ばれる
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    navigationController?.isNavigationBarHidden = true
  }
  
  // セクションの中のセルの数（必須）
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return textArray.count
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    // タップしたときに、その配列の番号の中身を取り出して値を渡す
    
    let nextVC = storyboard?.instantiateViewController(identifier: "next") as! NextViewController
    
    // タップされた場所の要素を渡す
    nextVC.toDoString = textArray[indexPath.row]
    
    // 画面遷移する
    navigationController?.pushViewController(nextVC, animated: true)
  }
  
  
  // セルを構築する（必須）
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    cell.selectionStyle = .none

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
    
    // セクションの数、セクションの中のセルの数、セルを返す作業をもう一度行う
    tableView.reloadData()
    
    return true
  }
}

