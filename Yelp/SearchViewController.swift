//
//  SearchViewController.swift
//  Yelp
//
//  Created by Shengjun Li on 2/16/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, FilterDelegate{

    @IBOutlet var searchResponseTableView: UITableView!
    
    @IBOutlet weak var searchQueryField: UITextField!
    
    
    var venues = NSArray()
    var venuesData = NSDictionary()

    
    var client: YelpClient!
    
    // You can register for Yelp API keys here: http://www.yelp.com/developers/manage_api_keys
    let yelpConsumerKey = "vxKwwcR_NMQ7WaEiQBK_CA"
    let yelpConsumerSecret = "33QCvh5bIF5jIHR5klQr7RtBDhQ"
    let yelpToken = "uRcRswHFYa1VkDrGV6LAW2F8clGh5JHV"
    let yelpTokenSecret = "mqtKIxMIR4iBtBPZCmCLEb-Dz3Y"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchResponseTableView.dataSource = self
        //searchResponseTableView.delegate = self
        
        //searchResponseTableView.rowHeight = UITableViewAutomaticDimension
        
        client = YelpClient(consumerKey: yelpConsumerKey, consumerSecret: yelpConsumerSecret, accessToken: yelpToken, accessSecret: yelpTokenSecret)
        searchQueryField.text = "Thai"
        
        client.searchWithTerm("Thai", success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
           // println(response)
            
            self.venues = response["businesses"] as NSArray
            
            self.searchResponseTableView.reloadData()
            
            }) { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                println(error)
        }


        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venues.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("SearchResponseCell") as SearchResponseCell
        
        let json = JSON(venues)
        
        //println(json[indexPath.row] )
        
        cell.titleLabel?.text = json[indexPath.row]["name"].string
        //print(json[indexPath.row]["review_count"].number)
        let count = json[indexPath.row]["review_count"].number
        let tmp = "\(count)"
        var start = advance(tmp.startIndex, 9)
        var end =  advance(tmp.startIndex,  countElements(tmp)-1 )
        var reviews = tmp.substringWithRange(Range<String.Index>(start: start, end: end))
        cell.reviewsLabel.text =   reviews
        
        cell.tagsLabel?.text =  json[indexPath.row]["categories"][0].array?.description
        cell.addressLabel?.text = json[indexPath.row]["location"]["address"].array?.description
        
        var url = NSURL(string:json[indexPath.row]["snippet_image_url"].string! as String)
        //println (url)
        
        cell.venueImg?.setImageWithURL(url!)
        
        var urlRating = NSURL(string:json[indexPath.row]["rating_img_url"].string! as String)
        cell.ratingImg?.setImageWithURL(urlRating!)
    
        return cell
    }

    
   
    @IBAction func searchVenues(sender: UITextField) {
        client = YelpClient(consumerKey: yelpConsumerKey, consumerSecret: yelpConsumerSecret, accessToken: yelpToken, accessSecret: yelpTokenSecret)
        
        client.searchWithTerm(searchQueryField.text, success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
            //println(response)
            
            self.venues = response["businesses"] as NSArray
            
            self.searchResponseTableView.reloadData()
            
            }) { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                println(error)
        }

        
    }
  
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      
       
            var filtersNavigationController = segue.destinationViewController as UINavigationController
            var filtersViewController = filtersNavigationController.viewControllers[0] as FilterViewController
            filtersViewController.delegate = self
        
        
    }
    
    func didApplyFilter(categories: NSArray) {
        
        print("didapplyfilter")
        
        print( categories.count)
        
        var params = [
            "term": searchQueryField.text
           
        ]
        
        var cat : String = ""
        
        if (categories.count > 0) {
             cat = ",".join(categories as [String])
        }
        
        client = YelpClient(consumerKey: yelpConsumerKey, consumerSecret: yelpConsumerSecret, accessToken: yelpToken, accessSecret: yelpTokenSecret)
        
        
        client.searchWithTermAndFilter(searchQueryField.text, categories: cat,  success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
            //println(response)
            
            self.venues = response["businesses"] as NSArray
            
            self.searchResponseTableView.reloadData()
            
            }) { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                println(error)
        }
        
       

        
        
    
    }
    
    

}
