//
//  ViewController.swift
//  CoreDate
//
//  Created by Mounika Donthireddy on 11/15/18.
//  Copyright © 2018 Mounika Donthireddy. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        newUser.setValue("mounika", forKey: "userName")
        newUser.setValue("mounika", forKey: "password")
        newUser.setValue(20, forKey: "userId")
        do {
            try context.save()
        }
        catch
        {
            print("failed")
        }
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "userName") as! String)
            }
        } catch {
            
            print("Failed")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

