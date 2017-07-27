//
//  File.swift
//  CrowdDJ
//
//  Created by Joshua Kopen on 7/12/17.
//  Copyright © 2017 Joshua Kopen. All rights reserved.
//

import UIKit
import SafariServices
import AVFoundation


//THIS CLASS CURRENTLY EXISTS JUST TO TEST THINGS OUT IN THE APP


class ViewController: UIViewController {
    
    // MARK: Variables
    let mp = MusicPlayer()
    
    // MARK: Functions    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view does load")
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.returnToApplication), name: NSNotification.Name(rawValue: "loginSuccessfull"), object: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func returnToApplication() {
        mp.updateAfterFirstLogin()
    }
    
    // MARK: Outlets
    
    @IBAction func buttonPressed(_ sender: Any) {
        mp.takeAction()
    }
    
    @IBAction func makeUser(_ sender: Any) {
        MusicSearch.searchSong(songName: "sean mendes", mp:mp)
    }
    
    
}
