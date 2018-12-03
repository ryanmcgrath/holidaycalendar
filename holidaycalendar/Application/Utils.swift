//
//  Utils.swift
//  holidaycalendar
//
//  Created by Ryan McGrath on 12/3/18.
//  Copyright © 2018 Ryan McGrath. All rights reserved.
//

import Cocoa
import Foundation

struct Styles {
    static let windowBackgroundColor = NSColor(red: 26.0/255.0, green: 28.0/255.0, blue: 47.0/255.0, alpha: 1)
    static let presentBackgroundColor = NSColor(red: 236.0/255.0, green: 88.0/255.0, blue: 65.0/255.0, alpha: 1)
    static let openPresentBackgroundColor = NSColor(red: 60.0/255.0, green: 189.0/255.0, blue: 172.0/255.0, alpha: 1)
}

enum Cells: String {
    case calendarDay
    
    var reuseIdentifier: NSUserInterfaceItemIdentifier {
        switch self {
            case .calendarDay: return NSUserInterfaceItemIdentifier(rawValue: "LOL")
        }
    }
}
