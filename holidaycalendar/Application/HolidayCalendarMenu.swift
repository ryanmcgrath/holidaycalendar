//
//  HolidayCalendarMenu.swift
//  holidaycalendar
//
//  Created by Ryan McGrath on 12/2/18.
//  Copyright © 2018 Ryan McGrath. All rights reserved.
//

import Cocoa

fileprivate func configureApplicationMenu(_ menu: NSMenu) {
    let menuItem = menu.addItem(withTitle: "Application", action: nil, keyEquivalent: "")
    let submenu = NSMenu(title: "Application")

    let title = NSLocalizedString("Quit", comment:"Quit menu item") //+ " " + applicationName
    let quitItem = submenu.addItem(withTitle:title, action:#selector(NSApplication.terminate(_:)), keyEquivalent:"q")
    quitItem.target = NSApp

    menu.setSubmenu(submenu, for: menuItem)
}

public func HolidayCalendarMenu() -> NSMenu {
    let menu = NSMenu(title: "MainMenu")
    
    configureApplicationMenu(menu)
    
    return menu
}
