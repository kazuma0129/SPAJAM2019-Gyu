//
//  MyCollectionViewCell.swift
//  SPAJAM-Gyu
//
//  Created by 大村優輝 on 2019/05/12.
//  Copyright © 2019 KazumaOhashi. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    var baseView:UIView?
    let paddingSize:CGFloat = 8
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // コンテンツビューに対しパディングをもうけたビューを生成して貼る（ページング吸着対応）
        baseView = UIView(frame:CGRect(x:paddingSize,y:paddingSize,width:frame.width-(paddingSize*2),height:frame.height))
        self.contentView.addSubview(baseView!)
    }
    
    // ベースビューの背景色を変更する
    func setViewColor(_ color:UIColor) {
        baseView?.backgroundColor = color
    }
    
}
