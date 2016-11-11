//
//  ViewController.swift
//  Core Data Demo
//
//  Created by Akash Singhal on 10/11/16.
//  Copyright © 2016 Akash Singhal. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        newUser.setValue("Prateek", forKey: "username")
        newUser.setValue("myPass", forKey: "password")
        newUser.setValue(37, forKey: "age")
        
        do {
            try context.save()
            
            print("Item saved")
        } catch {
            print("There was some error")
        }
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
//        request.predicate = NSPredicate(format: "age = %@", "10")
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    if (result.value(forKey: "username") as? String) != nil {
                        
//                        result.setValue("Dooley", forKey: "username")
//
//                        do {
//                            try context.save()
//                        } catch {
//                            print("Error saving context")
//                        }
                        if let username = result.value(forKey: "username") {
                            print(username)
                        }
                    }
                }
            } else {
                print("No result found")
            }
        } catch {
            print("Couldn't fetch result")
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

