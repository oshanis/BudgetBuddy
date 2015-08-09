//
//  Event.swift
//  BudgetBuddy5
//
//  Created by Oshani on 8/9/15.
//  Copyright (c) 2015 Oshani Seneviratne. All rights reserved.
//

import Foundation
import MapKit

struct Event {
    var location : Location
    var dateTime : NSDate
    var amountSpent : Int
}

struct Location {
    var location : CLLocationCoordinate2D
    var locationName : String
    var poiType : Poi
}

enum Poi {
   case Restaurant, Cafe, Bar, NightClub, DepartmentStore, Mall
}

enum Tags : String {
    case Eating = "eating"
    case Drinking = "drinking"
    case Shopping = "shopping"
    case StartDateTime = "start"
    case EndDateTime = "end"
}


extension NSDate
{
    convenience
    init(dateString:String) {
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        let d = dateStringFormatter.dateFromString(dateString)!
        self.init(timeInterval:0, sinceDate:d)
    }
}

