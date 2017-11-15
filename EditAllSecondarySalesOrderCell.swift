//
//  EditAllSecondarySalesOrderCellTableViewCell.swift
//  Odin_App_Project_Swift
//
//  Created by discussolutions on 9/19/17.
//  Copyright © 2017 discussolutions. All rights reserved.
//

import UIKit
// 1 >Create protocolo 
protocol MyCellDelegate {
    func btnCloseTapped(cell: EditAllSecondarySalesOrderCell)
}

class EditAllSecondarySalesOrderCell: UITableViewCell{

    @IBOutlet var mainView: UIView!
    @IBOutlet var txtCart: RoundTextField!
    @IBOutlet var txtRateValue: RoundTextField!
    @IBOutlet var txtProductQuantity: RoundTextField!
    @IBOutlet var txtProductName: RoundTextField!
     var delegate: MyCellDelegate? // 6 > add your proto in var
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
    // 7 > crate your button action in tableview cell for
    @IBAction func btnDeleteTapped(_ sender: Any)
    {
        //8 > set this condition and call your proto func
        if let _ = delegate {
            delegate?.btnCloseTapped(cell: self)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

    }

}
