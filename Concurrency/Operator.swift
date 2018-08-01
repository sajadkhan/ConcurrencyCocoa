//
//  Operator.swift
//  Concurrency
//
//  Created by Sajad on 8/1/18.
//  Copyright © 2018 Sajad. All rights reserved.
//

import Foundation

//Operator purpose is to create and run different operations
//Run BlockOperations and Custom Operations
//Run Asyncrounous Operations and Syncronous Operations
//Use Operation Queue to run operation

class Operator {
    //Create an operation factory instance to create different operation.
    private let operationFactory = OperationFactory()
    
    //MARK: - Custom Synchronous Operation
    
    //Run a custom Synronous Operation
    func runSynchronousOperation() {
        //Get an instance of operation, look at Operations instance method customSyncrounousOperation to know how this operation is created.
        let synchrounousOperation = operationFactory.customSynchronousOperation()
        
        //Start the operation
        synchrounousOperation.start()
        
        //As this is a syncrounous operation below code will only executed once the operation is comolete
        //Now after operation comletion look at the results of the operation
        if let image = synchrounousOperation.image {
            print("Fetched Image dimensions = \(image.size.width) X \(image.size.height)")
            if let data = image.tiffRepresentation {
                print("Fetched Image file size = \(data.count)")
            }
        }
    }
    
    
    //MARK: - Custom Asynchronous Operation
    
    //Run a custom asynchronous method
    func runAsynchronousOperation() {
        //Get an asynchronous operation from factory
        let asynchronousOperation = operationFactory.customAsynchronousOperation()
        
        //Start the operation
        asynchronousOperation.start()
        
        //As we have started a async operation we haven't blocked our thread, So we can start some thing else here and both will execute parallel.
        //Keep priting dots while operation is performing its task and not finished
        //It is also possible to use KVO to achieve this by adding an observer on isFinished property, but for simplicity we are using this approach. 
        while !asynchronousOperation.isFinished {
            print(".")
        }
        
        //When operation finished we can look at its result.
        if let image = asynchronousOperation.image {
            print("Fetched Image dimensions = \(image.size.width) X \(image.size.height)")
            if let data = image.tiffRepresentation {
                print("Fetched Image file size = \(data.count)")
            }
        }
        
    }
    
    //MARK: - Perform Operations Using Operation Queue
    func pefromOperationsUsingQueue() {
        let queue = OperationQueue()
        
    }
}

