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
    
    @objc dynamic var isRunning = false
    var outputPipe:Pipe!
    var buildTask:Process!
    
    @IBAction func startTask(_ sender:AnyObject) {
      outputText.string = ""

      if let projectURL = projectPath.url, let repositoryURL = repoPath.url {
        let projectLocation = projectURL.path
        let finalLocation = repositoryURL.path
        
        // By convention, the name of the folder and the name of the project file are the same.
        // Getting the lastPathComponent property of the project folder contained in projectURL and adding an “.xcodeproj” extension gets the path to the project file.
        let projectName = projectURL.lastPathComponent
        let xcodeProjectFile = projectLocation + "/\(projectName).xcodeproj"
        
        // Defines the subdirectory where your task will store intermediate build files while it’s creating the ipa file as build.
        let buildLocation = projectLocation + "/build"
        
        // These arguments will be provided to NATask to be used
        var arguments:[String] = []
        arguments.append(xcodeProjectFile)
        arguments.append(targetName.stringValue)
        arguments.append(buildLocation)
        arguments.append(projectName)
        arguments.append(finalLocation)
        
        buildButton.isEnabled = false
        spinner.startAnimation(self)
        
        runScript(arguments)
      }
    }
    
    @IBAction func stopTask(_ sender:AnyObject) {
      
        buildButton.isEnabled = true
        spinner.stopAnimation(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        buildButton.isEnabled = true
        spinner.stopAnimation(self)
    }
    
    func runScript(_ arguments:[String]) {
        // Sets isRunning to true. This enables the Stop button, since it’s bound to the TasksViewController‘s isRunning property via Cocoa Bindings.
        // You want this to happen on the main thread.
        isRunning = true
        
        // Creates a DispatchQueue to run the heavy lifting on a background thread
        let taskQueue = DispatchQueue.global(qos: DispatchQoS.QoSClass.background)
        
        // Uses async on the DispatchQueue The application will continue to process things like button clicks on the main thread,
        // but the NSTask will run on the background thread until it is complete.
        taskQueue.async {
            
            //TESTING CODE
            
            // This is a temporary line of code that causes the current thread to sleep for 2 seconds, simulating a long-running task.
            Thread.sleep(forTimeInterval: 2.0)
            
            // manipulating UI elements in main queue
            DispatchQueue.main.async(execute: {
                self.buildButton.isEnabled = true
                self.spinner.stopAnimation(self)
                self.isRunning = false
            })
            
        //TESTING CODE
      }
      
    }

}
