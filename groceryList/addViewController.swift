//
//  addViewController.swift
//  groceryList
//
//  Created by apcs2 on 9/18/17.
//  Copyright © 2017 apcs2. All rights reserved.
//

import UIKit

class addViewController: UIViewController
{
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad()
    {
        super.viewDidLoad()

    }
    @IBAction func addBttn(_ sender: Any)
    {
        array2.append(textField.text!)
        
        func save(text: String, amount: Double, quantity: Int )
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
            newObject.setValue(quantity, forkey: "quantity")
            
            do
            {
                try manageContext.save()
            }
            catch
            {
                print("STRING")
            }
            
        }
    }
}
