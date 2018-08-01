//
//  AsynchronousOperation.swift
//  Concurrency
//
//  Created by Sajad on 8/1/18.
//  Copyright © 2018 Sajad. All rights reserved.
//

import Foundation
import AppKit

//This is a subclass of abstract Operation class. This is a asynchronous operation so there a
//some required method to be sublcassed like start(), isExecuting, isFinished, isConcurrent. main() is optional but good to have cleaner code.

class AsynchronousOperation: Operation {
    
    //private property to be set in intialization to save url for fetching image
    private var imageURL: URL!
    
    //Public (only get) property to fetch the image set as a result of operation
    private(set) var image: NSImage?
    
    // Intializer
    init(with url: URL) {
        super.init()
        imageURL = url
    }
    
    //Private vars for maintaining states
    //When ever these changes notify KVO
    
    private var pExecuting: Bool = false {
        willSet {
            willChangeValue(forKey: "isExecuting")
        }
        didSet {
            didChangeValue(forKey: "isExecuting")
            if pExecuting == true {
                print("Custom Async operation is executing")
            } else {
                print("Custom Async method is not executing")
            }
        }
    }
    private var pFinished: Bool = false {
        willSet {
            willChangeValue(forKey: "isFinished")
        }
        didSet {
            didChangeValue(forKey: "isFinished")
            if pFinished == true {
                print("Custom Async operation has finished")
            }
        }
    }
    
    // MARK: - Override Methods and Properties
    
    override var isExecuting: Bool {
        return pExecuting
    }
    override var isFinished: Bool {
        return pFinished
    }
    override var isConcurrent: Bool {
        return true
    }

    
    override func start() {
        //Check if is cancelled
        print("Custom Async operation has started")
        if isCancelled {
            //If it cancelled move the operation to finish state
            pFinished = true
            return
        }
        
        //Operation is executing
        pExecuting = true
        
        //Setup when you function starts
        //Create a serial queue
        let queue = DispatchQueue(label: "com.concurrency.imageQueue")
    
        //Dispatch async to continue the execution
        queue.async {
            self.main()
        }
    }
    
    //This is the task which operation does. Its the requirement for subclassing Operation.
    //Its important to check if the operation was cancelled before doing actual work.
    //Places to check for isCancelled,
    //Immediately before you perform any actual work
    //At least once during each iteration of a loop, or more frequently if each iteration is relatively long
    //At any points in your code where it would be relatively easy to abort the operation
    override func main() {
        //check if operation was cancelled before performing any thing
        if !isCancelled {
            let data = try? Data(contentsOf: imageURL)
            if data != nil {
                let image = NSImage(data: data!)
                self.image = image
            }
            //Operation completed
            completeOperation()
        } else {
            //Operation was cancelled
            completeOperation()
        }
    }
    
    //Changed the state when operation is complete.
    private func completeOperation() {
        pExecuting = false
        pFinished = true
    }
}
