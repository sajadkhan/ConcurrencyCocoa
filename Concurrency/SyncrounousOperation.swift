//
//  LoadImageOperation.swift
//  Concurrency
//
//  Created by Sajad on 7/31/18.
//  Copyright © 2018 Sajad. All rights reserved.
//

import Foundation
import AppKit

//LoadImageOperation is subclass of Operation. It is a syncrounous operation so only a custom intializer and main method is implemented.

class SynchronousOperation: Operation {

    //private property to be set in intialization to save url for fetching image
    private var imageURL: URL!
    
    //Public (only get) property to fetch the image set as a result of operation
    private(set) var image: NSImage? 
    
    //Custom intializer for this class, as this is image load operation, it takes a url to image
    init(with url: URL) {
        super.init()
        imageURL = url
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
        }
        
    }

}
