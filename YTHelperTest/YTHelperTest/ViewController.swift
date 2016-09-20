//
//  ViewController.swift
//  YTHelperTest
//
//  Created by Rupal Khilari on 9/14/16.
//  Copyright © 2016 Rupal Khilari. All rights reserved.
//

import UIKit

class ViewController: UIViewController, YTPlayerViewDelegate {

    @IBOutlet weak var youtubePlayer: YTPlayerView!
    @IBOutlet weak var playVideoButton: UIButton!
    @IBOutlet weak var muteVideoButton: UIButton!
    var playButtonState = 0
    var isMuted = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.youtubePlayer.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        
        let options = ["playsinline" : 1]
        youtubePlayer.loadWithVideoId("ucZl6vQ_8Uo", playerVars: options)
        // copyrighted wont load- :youtube.com/embed/-cUSV8MCOLY
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func playButton(sender: AnyObject) {
        
        if (playButtonState == 0) {
            playVideoButton.setTitle("Pause Video", forState: UIControlState.Normal)
            youtubePlayer.playVideo()
            playButtonState = 1
        }
        else {
            playVideoButton.setTitle("Play Video", forState: UIControlState.Normal)
            youtubePlayer.pauseVideo()
            playButtonState = 0
        }
    }
    
    @IBAction func muteButton(sender: AnyObject) {
        // move to some seconds.
        youtubePlayer.seekToSeconds(2.2, allowSeekAhead: true);
        if (isMuted) {
            muteVideoButton.setTitle("Mute", forState: UIControlState.Normal)
        }
    }
    func playerViewDidBecomeReady(playerView: YTPlayerView) {
        print("The player is now ready")
        
    }
    
    func playerView(playerView: YTPlayerView, didChangeToState state: YTPlayerState) {
        // the player changed to state
        print(state.rawValue);
    }
    
    func playerView(playerView: YTPlayerView, didPlayTime playTime: Float)
    {
        print(playTime)
    }
    
}

