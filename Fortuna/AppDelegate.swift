//
//  AppDelegate.swift
//  Fortuna
//
//  Created by Delbert on 14-10-17.
//  Copyright (c) 2014年 Delbert. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var positiveQuotes : [String]!
    var negativeQuotes : [String]!
        


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // load JSON file
        let pPath = NSBundle.mainBundle().pathForResource("positiveQuotes", ofType: "json")
        positiveQuotes = loadJSON(pPath!) as [String]
        let nPath = NSBundle.mainBundle().pathForResource("negativeQuotes", ofType: "json")
        negativeQuotes = loadJSON(nPath!) as [String]
        // Assertion to make sure that the file is loaded
        
        assert(positiveQuotes.count>0, "should load positive quotes")
        assert(negativeQuotes.count>0, "should load negative quotes")
        return true
    }
    
    func loadJSON(path: String)->AnyObject?{
        let data = NSData(contentsOfFile: path)
        
        assert(data != nil, "Failed to load data form \(path)")
        
        var err : NSError?
        
        let json:AnyObject? = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.allZeros, error: &err)
        assert(err == nil, "Error parsing json: \(err)")
        
        return json
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

