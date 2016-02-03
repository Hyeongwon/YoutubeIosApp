//
//  VideoModel.swift
//  YoutubeApp
//
//  Created by byunhyeongwon on 2015. 12. 23..
//  Copyright © 2015년 Joshua HyeongwonByun. All rights reserved.
//

import UIKit
import Alamofire

class VideoModel: NSObject {
    
    let API_Key = "AIzaSyAhitkyhBz2cHqTpyDTqqOgSh1K36Gq63c"
    let UPLOAD_PLAYLIST_ID = "PLMRqhzcHGw1ZF7VdTt2EALt_5i6RELc0k"
    
    func getFeedVideos() {
        
        Alamofire.request(.GET, "https://www.googleapis.com/youtube/v3/playlistItems", parameters: ["part" : "snippet", "playlistId" : UPLOAD_PLAYLIST_ID, "key" : API_Key], encoding: ParameterEncoding.URL, headers: nil).responseJSON { (response) -> Void in
            
            if let JSON = response.result.value {
                
                for video in JSON["items"] as! NSArray {
                    print(video);
                    
                    //TODO Create videos objects off of the JSON reponse
                    
                }
            }
        }
        //Fetch the videos dynamically through the YouTube DATA API
    }
    
    func getVideos() -> [Video] {
        
        // Create a empty array of video objects
        var videos = [Video]()
        
        // Create a video object
        let video1 = Video()
        
        // Assign properties
        video1.videoId = "ojbb6nGvIi8"
        video1.videoTitle = "How To Make an App - Ep 1 - Tools and Materials"
        video1.videoDescription = "Lesson 1: Tools and Materials This lesson is an orientation of what you need to start making apps and the tools and resources that Apple provides."
        
        // Append it into the videos array
        videos.append(video1)
        
        // Create a video object
        let video2 = Video()
        
        // Assign properties
        video2.videoId = "Oeb4VtuCc8c"
        video2.videoTitle = "How To Make an App - Ep 2 - Xcode 7 and Playgrounds"
        video2.videoDescription = "Lesson 2: Xcode 7 and Playgrounds This lesson will help you get your feet wet with Xcode 7 and experimenting with some basic Swift code. Follow along and if you've never programmed before, you'll see that it's not hard!"
        
        // Append it into the videos array
        videos.append(video2)
        
        // Create a video object
        let video3 = Video()
        
        // Assign properties
        video3.videoId = "CYZYcEi8Ll4"
        video3.videoTitle = "How To Make an App - Ep 3 - Xcode 7 Tutorial"
        video3.videoDescription = "Lesson 3: Xcode 7 Tutorial In this lesson, we walk through the main components and areas of Xcode 7. Take a tour of the app where you'll spend most of your time in!"
        
        // Append it into the videos array
        videos.append(video3)
        
        // Create a video object
        let video4 = Video()
        
        // Assign properties
        video4.videoId = "N9IoWM9pcOg"
        video4.videoTitle = "How To Make an App - Ep 4 - App Anatomy"
        video4.videoDescription = "Lesson 4: App Anatomy This lesson goes through the common components of all iPhone apps."
        
        // Append it into the videos array
        videos.append(video4)
        
        // Create a video object
        let video5 = Video()
        
        // Assign properties
        video5.videoId = "wkVZuNQyJzA"
        video5.videoTitle = "How To Make an App - Ep 5 - Your First Swift App"
        video5.videoDescription = "Lesson 5: Your First Swift App Go through the files in an Xcode 7 project and build your first Swift app!"
        
        // Append it into the videos array
        videos.append(video5)
        
        // Return the array to the caller
        return videos
        
    }
}
