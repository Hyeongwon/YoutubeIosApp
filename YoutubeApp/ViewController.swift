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
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return videos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("BasicCell")!
        
        let videotitle = videos[indexPath.row].videoTitle
        
        // Customize the cell to display the video title
        cell.textLabel?.text = videotitle
        
        return cell
    }


}

