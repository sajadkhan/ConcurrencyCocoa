//
//  File.swift
//  Concurrency
//
//  Created by Sajad on 7/31/18.
//  Copyright © 2018 Sajad. All rights reserved.
//



import Foundation

//This class is written for creating different type of Operations including BlockOperation,
//CustomOperation which are subclasses of Operations. This class have methods to return both
//syncronous custom operation and asyncronous operation

class OperationFactory {
    
    //Create and return BlockOperation
    func blockOperation() -> BlockOperation {
        
        let operation = BlockOperation {
            //This is the block which actualy does the task associated with this operation
            print("Task in the block operation.")
        }
        return operation
    }
    
    //Create and return a custom operation, for loading an image from the network syncrounously
    //See LoadImageOperation class to see the implementation of the operation returned by this method.
    func customSyncronousOperation() -> SynchronousOperation {
        let operation = SynchronousOperation(with: URL(string: "https://saturn.jpl.nasa.gov/system/resources/detail_files/7848_PIA12797-full.jpg")!)
        return operation
    }
    
    
}
