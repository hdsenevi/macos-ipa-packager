//
//  TasksViewController.swift
//  ipa-packager
//
//  Created by Shanaka Senevirathne on 18/6/20.
//  Copyright © 2020 shanaka. All rights reserved.
//

import Cocoa

class TasksViewController: NSViewController {

    //Controller Outlets
    @IBOutlet var outputText:NSTextView!
    @IBOutlet var spinner:NSProgressIndicator!
    @IBOutlet var projectPath:NSPathControl!
    @IBOutlet var repoPath:NSPathControl!
    @IBOutlet var buildButton:NSButton!
    @IBOutlet var targetName:NSTextField!
    
    
    dynamic var isRunning = false
    var outputPipe:Pipe!
    var buildTask:Process!
    
    
    @IBAction func startTask(_ sender:AnyObject) {
      
    }
    
    @IBAction func stopTask(_ sender:AnyObject) {
      
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
