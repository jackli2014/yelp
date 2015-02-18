//
//  FilterViewController.swift
//  Yelp
//
//  Created by Shengjun Li on 2/17/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

     var delegate: FilterDelegate?;
    
    var isCategorySectionExpanded = false
    var categories = [
       "active",
        "arts",
        "auto",
        "beautysvg",
        "bicycles",
        "education",
        "food",
        "health",
        "homeservices",
        "hotelstravel",
        "nightlife",
        "pets",
        "restaurants",
        "shopping"
    ]

    var selectedCategories: [String] = []
    
   
    @IBOutlet weak var filterTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.filterTableView.dataSource = self
        self.filterTableView.delegate = self
        
        categories = [
            "active",
            "arts",
            "auto",
            "beautysvg",
            "bicycles",
            "education",
            "food",
            "health",
            "homeservices",
            "hotelstravel",
            "nightlife",
            "pets",
            "restaurants",
            "shopping"
        ]

        //print(categories.count)
        
        self.filterTableView.reloadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    /*
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }*/

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        //print(categories.count)
        return categories.count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("filterCell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = categories[indexPath.row]        // Configure the cell...
        print(indexPath.row)
        
        if let selected = find(selectedCategories, categories[indexPath.row]) {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       
            categoriesRowSelected(indexPath, inTableView: tableView)
      
    }

    
    
    private func categoriesRowSelected(indexPath: NSIndexPath, inTableView tableView: UITableView) {
        var rowAnimation = UITableViewRowAnimation.None
        
            var index = find(selectedCategories, categories[indexPath.row])
        print (index)
            if (index == nil) {
                selectedCategories.append(categories[indexPath.row])
                print("added")
            } else {
                selectedCategories.removeAtIndex(index!)
                print("removed")
            }
        
        
        tableView.reloadSections(NSIndexSet(index: indexPath.section), withRowAnimation: rowAnimation)
    }
    
   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
