//
//  EditAllSecondarySalesOrderScreen.swift
//  Odin_App_Project_Swift
//
//  Created by discussolutions on 9/18/17.
//  Copyright © 2017 discussolutions. All rights reserved.
//

import UIKit

class EditAllSecondarySalesOrderScreen: UITableViewController,UITextFieldDelegate,MyCellDelegate  //2 > add delegate for created Protocol name
{
   

    var arrGetProduct : NSMutableArray = NSMutableArray()
    var arrGetBasicPrice : NSMutableArray = NSMutableArray()
    var arrProductId : NSMutableArray = NSMutableArray()

    var arrSku : NSMutableArray = NSMutableArray()
    var arrQtyFill : NSMutableArray = NSMutableArray()
    var strCartValue = NSString()
    @IBOutlet weak var footerView: UIView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title="Add Sales Secondary Order"
        self.navigationItem.hidesBackButton = true
        let backButton = UIBarButtonItem(image: #imageLiteral(resourceName: "Back_icon"), landscapeImagePhone: #imageLiteral(resourceName: "Back_icon"), style: UIBarButtonItemStyle.plain, target: self, action:#selector(EditAllSalesOrderScreen.back(sender:)))
        self.navigationItem.leftBarButtonItem = backButton
        footerView.backgroundColor = UIColor.white
        footerView.layer.cornerRadius = 5.0
        footerView.layer.borderColor = UIColor.black.cgColor
        footerView.layer.borderWidth = 0.1
        footerView.layer.shadowColor = UIColor(red: 225.0 / 255.0, green: 228.0 / 255.0, blue: 228.0 / 255.0, alpha: 1.0).cgColor
        footerView.layer.shadowOpacity = 1.0
        footerView.layer.shadowRadius = 5.0
        footerView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    @IBAction func btnCancelTapped(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)

    }
    
    var arrParameterSecondary = NSMutableArray()
    var arrCalculateValue = NSMutableArray()

    @IBAction func btnSaveTapped(_ sender: Any) {
        
        let objReg=self.storyboard?.instantiateViewController(withIdentifier: "AddSalesSecondaryController") as! AddSalesSecondaryController
        for i in 0..<arrGetProduct.count
        {
            let indexpath = IndexPath(row: i, section: 0)
            let cell = self.tableView.cellForRow(at: indexpath) as! EditAllSecondarySalesOrderCell
            let taxDic = NSMutableDictionary()
            taxDic.setValue(cell.txtProductQuantity.text, forKey:"avalQty")
            taxDic.setValue(cell.txtCart.text, forKey:"quantity")
            taxDic.setValue(arrProductId[indexpath.row], forKey:"productId")
            objReg.arrNo.append(Int(cell.txtCart.text!)!)
            print(objReg.arrNo)
            arrParameterSecondary.add(taxDic)
        }
        print(arrParameterSecondary)

//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! EditAllSecondarySalesOrderCell
//        arrQtyFill.insert(cell.txtCart.text!, at:0)
//        cell.txtCart.text = arrQtyFill.object(at: 0) as! String
//        print(cell.txtCart.text)
//        print(arrQtyFill)
//        let array2 = NSArray()
//        let arrcartValue = NSMutableArray()
//
//        cell.txtCart.text = "1"
//        var str = NSString()
//        str=cell.txtCart.text! as NSString
        
//        for var i in (0..<arrGetProduct.count)
//        {
//            arrcartValue.add(str)
//            print(arrcartValue)
//        }
//        print("submite button tapped...")

        objReg.arrGetSalesProduct = arrGetProduct
        objReg.arrGetBasicPrice=arrGetBasicPrice
        arrParameterSecondaryMain=arrParameterSecondary
        objReg.arrSku=arrSku
//        objReg.arrcartFillValue = arrcartValue
//        print(arrGetProduct)
        self.navigationController?.pushViewController(objReg, animated: true)
    }
    func back(sender: UIBarButtonItem) {
        
        _ = navigationController?.popViewController(animated: true)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrGetProduct.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EditAllSecondarySalesOrderCell
        cell.txtCart.setDoneOnKeyboard()
        // 3 >load delegate in cellforRowat as your delegate
        cell.delegate=self as? MyCellDelegate
        cell.txtProductName.text=arrGetProduct[indexPath.row] as? String
        cell.txtRateValue.text=arrSku[indexPath.row] as? String
        let rateValue: NSNumber = (arrGetBasicPrice[indexPath.row] as! NSNumber)
        cell.txtProductQuantity.text=rateValue.stringValue
        cell.mainView.backgroundColor = UIColor.white
        cell.mainView.layer.cornerRadius = 5.0
        cell.mainView.layer.borderColor = UIColor.gray.cgColor
        cell.mainView.layer.borderWidth = 0.1
        cell.mainView.layer.shadowColor = UIColor(red: 225.0 / 255.0, green: 228.0 / 255.0, blue: 228.0 / 255.0, alpha: 1.0).cgColor
        cell.mainView.layer.shadowOpacity = 1.0
        cell.mainView.layer.shadowRadius = 5.0
        cell.mainView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        
        //        arrQtyFill.add(cell.txtCart.text?[indexPath.row])
        //         arrQtyFill.insert(cell.txtCart.text!, at: indexPath.row)
        //        print(arrQtyFill)

        return cell
    }
    override  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 115
    }
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
    {
        return footerView
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
        
    {
        return 50
    }
//    func textFieldShouldBeginEditing(_textField: UITextField) -> Bool
//    {
//        let txtFieldPosition = textField.convert(textField.bounds.origin, to: tblMessage)
//        let indexPath = tblMessage.indexPathForRow(at: txtFieldPosition)
//        if indexPath != nil {
//            tblMessage.scrollToRow(at: indexPath!, at: .top, animated: true)
//        }
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! EditAllSecondarySalesOrderCell
//        arrQtyFill.insert(cell.txtCart.text!, at:0)
//        print(arrQtyFill)
//        
//        return true
//    }
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! EditAllSecondarySalesOrderCell
//        arrQtyFill.insert(cell.txtCart.text!, at:0)
        if cell.txtCart .isEditing
        {
        }
//        for var i in (0..<arrGetProduct.count)
//        {
//            arrcartValue.add(str)
//            print(arrcartValue)
//        }
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! EditAllSecondarySalesOrderCell
//        arrQtyFill = cell.txtCart.text
        
//        strCartValue = cell.txtCart.text! as NSString
//        print(strCartValue)
        
    }
    
    //4 > creat function for add your custom code
    func btnCloseTapped(cell:EditAllSecondarySalesOrderCell)
    {
        //Get the indexpath of cell where button was tapped

        let indexPath001 = self.tableView.indexPath(for: cell)//genrate your clicked cell indexPath
        self.arrGetProduct.remove(indexPath001 as Any)
        self.arrGetProduct.removeObject(at:(indexPath001?.row)!)
        self.arrSku.removeObject(at:(indexPath001?.row)!)
        
        tableView.deleteRows(at:[indexPath001!], with: .left)
        //UITableViewCell.transition(with: cell33,duration: 0.60, animations:{ self.tableView.reloadData() })
        tableView.reloadData()
        print(indexPath001!.row)
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        var txtAfterUpdate = string
        if let text = textField.text as NSString?
        {
            txtAfterUpdate = text.replacingCharacters(in: range, with: string)
            print(txtAfterUpdate)
        }
        let buttonPosition:CGPoint = textField.convert(CGPoint.zero, to: self.tableView)
        let indexPath = self.tableView.indexPathForRow(at: buttonPosition)
        
        let cell = self.tableView.cellForRow(at: indexPath!) as! EditAllSecondarySalesOrderCell
//        cell.txtCart.text=txtAfterUpdate

        if textField == cell.txtCart
        {
//            let priceValue = Int(txtAfterUpdate)
//            let strTotal = String(format : "%d",(priceValue!))
//            cell.txtCart.text = strTotal
//            print(cell.txtCart.text)

        }
//        else
//        {
//            let rateValue1 = Int(cell.txtPrice.text!)
//            let priceValue1 = Int(txtAfterUpdate)
//            let strTotal1 = String(format : "%d",(rateValue1! * priceValue1!))
//            cell.txtTotalPrice.text = strTotal1
//        }
        
        return true;
    }
    // became first responder
    
    
//    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
//    {
//        return true
//    }
//    
//    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
//    {
//        if (editingStyle == UITableViewCellEditingStyle.delete) {
//            
//            self.arrGetProduct.remove(indexPath.row)
//            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)
//        }
//    }

 

}
