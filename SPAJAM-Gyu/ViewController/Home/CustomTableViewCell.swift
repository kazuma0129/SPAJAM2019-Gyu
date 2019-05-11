//
//  CustomTableViewCell.swift
//  SPAJAM-Gyu
//
//  Created by 大村優輝 on 2019/05/12.
//  Copyright © 2019 KazumaOhashi. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageCell: UIImageView!
    
    
    @IBOutlet weak var ComentCell: UIImageView!
    
    @IBOutlet weak var niceCell: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
