//
//  ViewController.swift
//  YoutubeApp
//
//  Created by byunhyeongwon on 2015. 12. 22..
//  Copyright © 2015년 Joshua HyeongwonByun. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var videos:[Video] = [Video]()
    var selectedVides:Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let model = VideoModel()
        self.videos = model.getVideos()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        // Get the width of the screen to calculate the hight of the row
        return (self.view.frame.size.width / 320) * 180
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return videos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("BasicCell")!
        
        let videotitle = videos[indexPath.row].videoTitle
        
        // Get the label for the cell
        let label = cell.viewWithTag(2) as! UILabel
        label.text = videotitle
        
        // Cunstruct the video thumbnail url
        let videoThumnailUrlString = "https://i1.ytimg.com/vi/" + videos[indexPath.row].videoId + "/maxresdefault.jpg"
        
        // Create an NSURL object
        let videoThumnailUrl = NSURL(string: videoThumnailUrlString)
        
        if(videoThumnailUrl != nil) {
            
            // Create an NSURLRequst object
            let request = NSURLRequest(URL: videoThumnailUrl!)
            
            // Create an NSURLSession
            let session = NSURLSession.sharedSession()
            
            // Create a datatask and pass in the request
            let datatask = session.dataTaskWithRequest(request, completionHandler:
                { (data:NSData?, response:NSURLResponse?, error:NSError?) -> Void in
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    // Get a referece to the imageview element of the cell
                    let imageView = cell.viewWithTag(1) as! UIImageView
                    
                    // Create an image object from the data and assign it into the imageview
                    imageView.image = UIImage(data: data!)
                })
            })
            datatask.resume()
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // Take note of which video the user selected
        self.selectedVides = self.videos[indexPath.row]
        
        // Call the segue
        self.performSegueWithIdentifier("goToDetail", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Get a reference to the destination view controller
        let detailViewController = segue.destinationViewController as! VideoDetailViewController
        
        // Set the selected video property of the destination view controller
        detailViewController.selectedVideo = self.selectedVides
    }


}

