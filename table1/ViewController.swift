//
//  ViewController.swift
//  table1
//
//  Created by Alena Kropotova on 05.06.2018.
//  Copyright © 2018 Alena Kropotova. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var context: NSManagedObjectContext!
    let dataHelper = CoreDataHelper.instace
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        context = dataHelper.managedObjectContext
    }


    @IBAction func AddTextToTableButtonTap(_ sender: Any) {
        
        let entity = NSEntityDescription.entity(forEntityName: "TableLines", in: self.context)
        let recentItemNew = NSManagedObject(entity: entity!, insertInto: self.context)
        if textField.text != ""{
            recentItemNew.setValue(textField.text, forKey: "line")
            do{
                self.dataHelper.saveContext()
                textField.text = ""
            }
        }
    }
}

