//
//  HolidayCalendarWindowController.swift
//  holidaycalendar
//
//  Created by Ryan McGrath on 11/21/18.
//  Copyright © 2018 Ryan McGrath. All rights reserved.
//

import Cocoa

class HolidayCalendarWindowController: NSWindowController {
    convenience init() {
        let styleMask: NSWindow.StyleMask = [.resizable, .miniaturizable, .closable, .titled]
        let initialRect = CGRect(x: 100.0, y: 100.0, width: 600.0, height: 350.0)
        let appWindow = NSWindow(contentRect: initialRect, styleMask: styleMask, backing: .buffered, defer: false)
        appWindow.backgroundColor = Styles.windowBackgroundColor
        appWindow.contentMinSize = CGSize(width: 600.0, height: 350.0)
        appWindow.title = "Holiday Calendar"
        appWindow.titlebarAppearsTransparent = true
        appWindow.titleVisibility = .hidden
        appWindow.appearance = NSAppearance(named: .vibrantDark)
        
        self.init(window: appWindow)
    }
}
