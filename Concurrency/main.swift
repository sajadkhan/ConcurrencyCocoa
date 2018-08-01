//
//  main.swift
//  Concurrency
//
//  Created by Sajad on 7/31/18.
//  Copyright © 2018 Sajad. All rights reserved.
//

import Foundation

//Configure before running to specify which methods you want to run, Its for debugging puposes.
let runCustomSyncOperation = false
let runCustomAsyncOperation = false
let runOperationQueue = true


//Use Operator to run different kinds of Operations
let myOperator = Operator()

//Create and run a custom synchronous operation
if runCustomSyncOperation {
    myOperator.runSynchronousOperation()
}

//Create and run a custom asynchronous operation
if runCustomAsyncOperation {
    myOperator.runAsynchronousOperation()
}

//Run some operation using Operation Queue
if runOperationQueue {
    myOperator.pefromOperationsUsingQueue()
}

//Just to keep the main runloop runnning
_ = readLine()



