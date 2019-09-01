//
//  ViewController.swift
//  Demo1
//
//  Created by hoanglinh on 9/1/19.
//  Copyright © 2019 hoanglinh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ListTable: UITableView!
    var mang:[Item] = [
     Item(image: UIImage(named: "1")!, noidung: "Mẫu Bán Chạy 2019", tieude: "Daniel Wellington DW00100163", soluong: 0),
     Item(image: UIImage(named: "1")!, noidung: "Mẫu Bán Chạy 2019", tieude: "Daniel Wellington DW00100163", soluong: 0),
     Item(image: UIImage(named: "1")!, noidung: "Mẫu Bán Chạy 2019", tieude: "Daniel Wellington DW00100163", soluong: 0),
     Item(image: UIImage(named: "1")!, noidung: "Mẫu Bán Chạy 2019", tieude: "Daniel Wellington DW00100163", soluong: 0),
     Item(image: UIImage(named: "1")!, noidung: "Mẫu Bán Chạy 2019", tieude: "Daniel Wellington DW00100163", soluong: 0)

    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.ListTable.dataSource = self
        self.ListTable.delegate = self
    }


}
extension ViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mang.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        cell.truyen(item: mang[indexPath.row])
        cell.BtnCong.tag = indexPath.row
        cell.BtnCong.addTarget(self, action: #selector(Cong), for: .touchUpInside)
        cell.BtnTru.tag = indexPath.row
        cell.BtnTru.addTarget(self, action: #selector(Tru), for: .touchUpInside)
//        cell.ImgHinh.layer.cornerRadius = 60
//        cell.ImgHinh.layer.borderWidth  = 2
//        cell.ImgHinh.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//        cell.ImgHinh.layer.contentsRect = CGRect(x: 10, y: 30, width: 100, height: 100)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    @objc func Cong (sender:UIButton){
        var qty:Int = mang[sender.tag].soluong
        qty += 1
        mang[sender.tag].soluong = qty
        ListTable.reloadData()
    }
    @objc func Tru (sender:UIButton) {
        var qty:Int = mang[sender.tag].soluong
        if qty > 0{
            qty -= 1
            mang[sender.tag].soluong = qty
            ListTable.reloadData()
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
struct Item {
    var image:UIImage
    var noidung:String
    var tieude:String
    var soluong:Int
}
