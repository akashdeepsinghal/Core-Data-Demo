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
        
        newUser.setValue("Akash", forKey: "username")
        newUser.setValue("myPass", forKey: "password")
        newUser.setValue(23, forKey: "age")
        
        do {
            try context.save()
            
            print("Item saved")
        } catch {
            print("There was some error")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

