//
//  SearchViewController.swift
//  Yelp
//
//  Created by Shengjun Li on 2/16/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource{

    @IBOutlet var searchResponseTableView: UITableView!
    
    @IBOutlet weak var searchQueryField: UITextField!
    
    
    
    let yelpClient = YelpClient(
        consumerKey: "LA9w9SXIc7uT78aEw7cfcA", consumerSecret: "--5-OyV9N8vfydzkcTmZxs3cPG0",
        accessToken: "MIk9Hb9bGO1QDCKJJ2UK4rvwfRTr0ScO", accessSecret: "y6fN1Tqp4WgocuuXFyNIeWgEPrs")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchResponseTableView.dataSource = self

        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("SearchResponseCell") as SearchResponseCell
        return cell
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
