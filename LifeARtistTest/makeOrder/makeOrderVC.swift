//
//  makeOrderVC.swift
//  LifeARtistTest
//
//  Created by mohamed on 4/21/18.
//  Copyright © 2018 Mohamed ELfishawy. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher
import BEMCheckBox
class makeOrderVC: UIViewController {

    var array:[makeOrderModel]=[]
    @IBOutlet weak var tableView: UITableView!
    
    var firstCategory:String?
    

    @IBOutlet weak var addressTF: UITextField!
    @IBOutlet weak var pCodeTF: UITextField!
    
    
    let picker = UIDatePicker()
    let picker2 = UIDatePicker()
    
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var timeTF: UITextField!
    
    
    
    @IBAction func makeOrderButton(_ sender: Any) {
        
        guard let address = addressTF.text?.trimmed, !address.isEmpty ,let DATE=dateTF.text?.trimmed, !DATE.isEmpty ,let TIME = timeTF.text?.trimmed, !TIME.isEmpty    else {
            return
        }
        
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDatePicker()
        createTimePicker()
        loadData()
        
    }
    

    
    
    func loadData()  {
        
        let url = URLs.oldOrder
     
        let parameters = [
            
            //            "id": id!,
            "id": "id",
            
            
            ]
        
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                
                switch response.result
                {
                case .failure(let error):
                    
                    print(error)
                    
                case .success(let value):
                    self.array=[makeOrderModel]()
                    
                    let json = JSON(value)
                    print(json)
                    
                    if let dataArr = json["second_category"].array
                    {
                        
                        for dataArr in dataArr {
                            let ar=makeOrderModel()
                            if let name = dataArr ["found_item_ID"].string,
                                let total = dataArr ["found_items"].string,
                                let address = dataArr["name"].string,
                                let service = dataArr["email"].string,
                                let phone = dataArr["mobile"].string,
                                let date = dataArr ["found_Date"].string
                                
                            {
                                
                             
                                //ar.name=total
                              
                                ar.service=service
                            }
                            
                            
                            
                            
                            
                            self.array.append(ar)
                        }
                        
                        self.tableView.reloadData()
                        
                    }
                    
                    
                }
                
                
                
                
                
                
        }
        
    }
    
    
    
  
    // Date
    func createDatePicker(){
        // make toolbar
        let toolbar=UIToolbar()
        toolbar.sizeToFit()
        // done button
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneButtonClick))
        toolbar.setItems([done], animated: false)
        
        dateTF.inputAccessoryView = toolbar
        dateTF.inputView=picker
        // format date
        picker.datePickerMode = .date
        
    }
    @objc func doneButtonClick(){
        // format date
        let formatter =  DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        let dateString = formatter.string(from: picker.date)
        
        dateTF.text="\(dateString)"
        self.view.endEditing(true)
    }
    //time
    // Date
    func createTimePicker(){
        // make toolbar
        let toolbar=UIToolbar()
        toolbar.sizeToFit()
        // done button
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneButtonClickTime))
        toolbar.setItems([done], animated: false)
        
        timeTF.inputAccessoryView = toolbar
        timeTF.inputView=picker2
        // format date
        picker2.datePickerMode = .time
        
    }
    @objc func doneButtonClickTime(){
        // format date
        let formatter =  DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .medium
        let timeString = formatter.string(from: picker2.date)
        
        timeTF.text="\(timeString)"
        self.view.endEditing(true)
    }
    

    
}

// MARK: - TableView

extension makeOrderVC:UITableViewDataSource,UITableViewDelegate,BEMCheckBoxDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "makeOrderCell", for: indexPath) as! makeOrderCell
      
        cell.prize.text=array[indexPath.row].prize
        cell.service.text=array[indexPath.row].service
        cell.check.addTarget(self,action:#selector(didTap), for: .touchUpInside)
        
        
        
        return cell
    }
    func didTap(_ checkBox: BEMCheckBox){
        if checkBox.tag == 0{
            print("lost")
           // choose="lost"
        }
   
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
    }
}

