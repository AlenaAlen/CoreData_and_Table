//
//  TableViewController.swift
//  table1
//
//  Created by Alena Kropotova on 05.06.2018.
//  Copyright © 2018 Alena Kropotova. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {

    var context: NSManagedObjectContext!
    let dataHelper = CoreDataHelper.instace
    var tableLines : [TableLines] = []
    var tableLinesLine = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        context = dataHelper.managedObjectContext
        fetchData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tableLinesLine.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = tableLinesLine[indexPath.row]

        return cell
    }
  
    func fetchData(){
        do{
            tableLines = try  context.fetch(TableLines.fetchRequest())
            if tableLines.count != 0{
                for item in tableLines{
                    tableLinesLine.append(item.line!)
                }
            }
        }catch{
            print("error - \(error)")
            
        }
    }
}
