//
//  ViewController.swift
//  groceryList
//
//  Created by apcs2 on 9/15/17.
//  Copyright © 2017 apcs2. All rights reserved.
//
//This was done by rishi
import UIKit
import CoreData
var arrayTwo = [String]()

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    var array = [NSManagedObject]()
    
    @IBOutlet weak var tableList: UITableView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Entity")
        do
        {
            array = try fetchFunction(fetchRequest as! NSFetchRequest<NSFetchRequestResult>) as! [NSManagedObject]
        }
        catch
        {
        }
    }
    //
    
    func fetchFunction(_ request: NSFetchRequest<NSFetchRequestResult>) throws -> [Any]
    {
        var array2 : [Any]! = []
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let manageContext = appDelegate?.persistentContainer.viewContext
        do
        {
            array2 = try manageContext?.fetch(request)
        }
        catch
        {
            print("varsity game Friday 6:30")
        }
        return array2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {

        let cell = tableList.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = array[indexPath.row].value(forKeyPath: "text") as? String
        cell.detailTextLabel?.text = array[indexPath.row].value(forKeyPath: "isle") as? String


        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return array.count
    }
    func save(text: String, amount: Double, quantity: Double)
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
        newObject.setValue(quantity, forKey: "quantity")

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
