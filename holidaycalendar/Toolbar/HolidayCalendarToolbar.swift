//
//  HolidayCalendarToolbar.swift
//  holidaycalendar
//
//  Created by Ryan McGrath on 12/3/18.
//  Copyright © 2018 Ryan McGrath. All rights reserved.
//

import Cocoa

class HolidayCalendarToolbar: NSToolbar {
    convenience init() {
        self.init(identifier: "DefaultToolbar")
        delegate = self
    }
    
    lazy var helpButton: NSButton = {
        return NSButton(title: "Help", target: self, action: #selector(onHelpPressed))
    }()
    
    @objc func onHelpPressed() {
        let popover = NSPopover()
        popover.behavior = .transient
        popover.contentSize = CGSize(width: 300.0, height: 150.0)
        popover.contentViewController = HolidayCalendarHelpViewController()
        popover.show(relativeTo: .zero, of: helpButton, preferredEdge: .maxY)
    }
}

extension HolidayCalendarToolbar: NSToolbarDelegate {
    func toolbar(_ toolbar: NSToolbar, itemForItemIdentifier itemIdentifier: NSToolbarItem.Identifier, willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
        let item = NSToolbarItem(itemIdentifier: itemIdentifier)
        
        if(itemIdentifier.rawValue == "HelpButton") {
            item.view = helpButton
            item.minSize = CGSize(width: 80.0, height: 24.0)
            item.maxSize = CGSize(width: 80.0, height: 24.0)
        }
        
        return item
    }
    
    func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        return [.flexibleSpace, NSToolbarItem.Identifier("HelpButton")]
    }
}
