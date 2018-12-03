//
//  AppDelegate.swift
//  holidaycalendar
//
//  Created by Ryan McGrath on 11/18/18.
//  Copyright © 2018 Ryan McGrath. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    var windowController: HolidayCalendarWindowController?
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        NSApp.mainMenu = HolidayCalendarMenu()
        windowController = HolidayCalendarWindowController()
        windowController?.window?.toolbar = HolidayCalendarToolbar()
        windowController?.contentViewController = HolidayCalendarCollectionViewController()
        windowController?.showWindow(self)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
    }
}
