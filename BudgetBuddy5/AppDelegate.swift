//
//  AppDelegate.swift
//  BudgetBuddy5
//
//  Created by Oshani on 8/9/15.
//  Copyright (c) 2015 Oshani Seneviratne. All rights reserved.
//

import UIKit
import MapKit

//Evil Global Vars -- only for demo purposes :)

var events = [Event]()
var locations = [Location]()
var initialValues = [Tags.Eating : 2000, Tags.Drinking: 500, Tags.Shopping : 3000]
var remainingValues = [Tags.Eating : 1800, Tags.Drinking: 0, Tags.Shopping : 1300]
var dates = [Tags.StartDateTime: NSDate(timeIntervalSinceNow: 0),
    Tags.EndDateTime: NSDate(timeIntervalSinceNow: 60*60*24*30)]

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        println("app init")
        seedData()
        return true
    }

    func seedData() {
        var newLocation = Location(location : CLLocationCoordinate2D(latitude: 33.979091, longitude: -118.444000), locationName : "Bar1", poiType : Poi.Bar)
        locations.append(newLocation)
        var newEvent = Event(location: newLocation, dateTime : NSDate(dateString:"2015-08-04"), amountSpent : 1000)
        events.append(newEvent)

        newLocation = Location(location : CLLocationCoordinate2D(latitude: 33.989091, longitude: -118.454111), locationName : "Cafe1", poiType : Poi.Cafe)
        locations.append(newLocation)
        newEvent = Event(location: newLocation, dateTime : NSDate(dateString:"2015-08-05"), amountSpent : 100)
        events.append(newEvent)

        newLocation = Location(location : CLLocationCoordinate2D(latitude: 33.989091, longitude: -118.446120), locationName : "DepartmentStore1", poiType : Poi.DepartmentStore)
        locations.append(newLocation)
        newEvent = Event(location: newLocation, dateTime : NSDate(dateString:"2015-08-06"), amountSpent : 800)
        events.append(newEvent)

        newLocation = Location(location : CLLocationCoordinate2D(latitude: 33.989091, longitude: -118.494227), locationName : "BizHaus", poiType : Poi.Mall)
        locations.append(newLocation)
        newEvent = Event(location: newLocation, dateTime : NSDate(dateString:"2015-08-07"), amountSpent : 900)
        events.append(newEvent)

        newLocation = Location(location : CLLocationCoordinate2D(latitude: 33.981091, longitude: -118.423927), locationName : "BizHaus", poiType : Poi.NightClub)
        locations.append(newLocation)
        newEvent = Event(location: newLocation, dateTime : NSDate(dateString:"2015-08-08"), amountSpent : 1500)
        events.append(newEvent)

        newLocation = Location(location : CLLocationCoordinate2D(latitude: 33.908991, longitude: -118.454187), locationName : "BizHaus", poiType : Poi.Restaurant)
        locations.append(newLocation)
        newEvent = Event(location: newLocation, dateTime : NSDate(dateString:"2015-08-08"), amountSpent : 100)
        events.append(newEvent)
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

