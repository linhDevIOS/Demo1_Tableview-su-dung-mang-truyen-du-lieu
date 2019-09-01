//
//  CustomTableViewCell.swift
//  Demo1
//
//  Created by hoanglinh on 9/1/19.
//  Copyright © 2019 hoanglinh. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
// anh xa out let
    @IBOutlet weak var ImgHinh: UIImageView!
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Content: UILabel!
    @IBOutlet weak var BtnTru: UIButton!
    @IBOutlet weak var BtnCong: UIButton!
    @IBOutlet weak var Quantity: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func truyen(item:Item){
        Quantity.text = String(item.soluong)
        ImgHinh.image = item.image
        Title.text = item.tieude
        Content.text = item.noidung
    }
}
