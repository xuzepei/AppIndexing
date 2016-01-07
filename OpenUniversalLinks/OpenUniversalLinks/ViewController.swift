//
//  ViewController.swift
//  OpenUniversalLinks
//
//  Created by xuzepei on 15/12/30.
//  Copyright © 2015年 xuzepei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    @IBAction func clickedLinkButton(sender: AnyObject) {
        
        print("clickedLinkButton")
        
        
        //If there is no installed app, will open the webpage instead.
        if let url = NSURL(string:"https://services.lockscreenshd.com/test") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.webView.loadHTMLString("<html><body><a href=\"https://services.lockscreenshd.com/test\">Universal link</a></body></html>", baseURL: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

