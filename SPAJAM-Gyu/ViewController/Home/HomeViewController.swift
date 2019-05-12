//
//  HomeViewController.swift
//  SPAJAM-Gyu
//
//  Created by 大村優輝 on 2019/05/12.
//  Copyright © 2019 KazumaOhashi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet var table: UITableView!
    
    let imageNames = ["ima1", "ima2", "ima3", "ima4"]

    let label2Array: NSArray = [
        "ダブルブランコゲーム","バク宙滑り台",
        "べちゃべちゃウミガメ","アオハルジャンプ"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // セルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNames.count
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! CustomTableViewCell
//
//        cell.imageCell.image = UIImage(named: imageNames[indexPath.row])
//        cell.niceCell.image = UIImage(named:"nice")
//        cell.ComentCell.image = UIImage(named:"comment")
//
//        return cell
//    }
    func tableView(_ table: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // tableCell の ID で UITableViewCell のインスタンスを生成
        let cell = table.dequeueReusableCell(withIdentifier: "tableCell",
                                             for: indexPath)
        
        let img = UIImage(named: imageNames[indexPath.row] as! String)
        
        // Tag番号 1 で UIImageView インスタンスの生成
        let imageView = cell.viewWithTag(1) as! UIImageView
        imageView.image = img
        
        // Tag番号 ２ で UILabel インスタンスの生成
        let nice = cell.viewWithTag(2) as! UIImageView
        nice.image = UIImage(named: "nice")
        
        // Tag番号 ３ で UILabel インスタンスの生成
        let come = cell.viewWithTag(3) as! UIImageView
        come.image = UIImage(named: "comment")
        
        let icon = cell.viewWithTag(4) as! UIImageView
        icon.image = UIImage(named: "gero")
        
        let buranko = cell.viewWithTag(7) as! UILabel
        buranko.text = String(describing: label2Array[indexPath.row])
        
        return cell
    }
    // Cell の高さを１２０にする
    func tableView(_ table: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220.0
    }
    // セルをタップした時に呼ばれる
    func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        print("セルをタップしました")
    }
    
}






