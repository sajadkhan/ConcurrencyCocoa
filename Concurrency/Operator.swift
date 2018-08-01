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
    private let operations = OperationFactory()
    
    //Run a custom Synronous Operation
    func runSyncronousCustomOperation() {
        //Get an instance of operation, look at Operations instance method customSyncrounousOperation to know how this operation is created.
        let syncrounousOperation = operations.customSyncronousOperation()
        
        //Start the operation
        print("Custom sync operation start")
        syncrounousOperation.start()
        
        //As this is a syncrounous operation below code will only executed once the operation is comolete
        print("Custom sync operation ends")
        
        //Now after operation comletion look at the results of the operation
        if let image = syncrounousOperation.image {
            print("Fetche Image dimensions = \(image.size.width) X \(image.size.height)")
            if let data = image.tiffRepresentation {
                print("Fetched Image file size = \(data.count)")
            }
        }
    }
}

