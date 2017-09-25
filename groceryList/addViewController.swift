//
//  addViewController.swift
//  groceryList
//
//  Created by apcs2 on 9/18/17.
//  Copyright © 2017 apcs2. All rights reserved.
//

import UIKit
import CoreData

class addViewController: UIViewController
{
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var isleTxt: UITextField!
    @IBOutlet weak var quantityTxt: UITextField!
    @IBOutlet weak var amountTxt: UITextField!
    override func viewDidLoad()
    {
        super.viewDidLoad()

    }
   
    func save(text: String, amount: Double)
    {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
            else
        {
            return
        }
        let manageContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Entity", in: manageContext)!
        let newObject = NSManagedObject(entity: entity, insertInto: manageContext)
        newObject.setValue(text, forKey: "text")
        newObject.setValue(amount, forKey: "amount")
//        newObject.setValue(isle, forKey: "isle")
        
        //newObject.setValue(quantity, forkey: "quantity")
        
        do
        {
            try manageContext.save()
        }
        catch
        {
            print("STRING")
        }
        
    }
    @IBAction func addBttn(_ sender: UIButton)
    {
      save(text: textField.text!, amount: Double(amountTxt.text!)!)
        
        
    }

}
