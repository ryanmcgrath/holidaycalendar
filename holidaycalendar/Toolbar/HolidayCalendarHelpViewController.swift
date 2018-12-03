//
//  HolidayCalendarHelpViewController.swift
//  holidaycalendar
//
//  Created by Ryan McGrath on 12/3/18.
//  Copyright © 2018 Ryan McGrath. All rights reserved.
//

import Cocoa

class HolidayCalendarHelpViewController: NSViewController {
    override func loadView() {
        let label = NSTextField(wrappingLabelWithString: "This is just a demo! Two-finger swipe right on a day with your trackpad.")
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let rootView = NSView(frame: CGRect(x: 0.0, y: 0.0, width: 300.0, height: 150.0))
        rootView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: rootView.topAnchor, constant: 10.0),
            label.leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: 10.0),
            label.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: -10.0),
            label.bottomAnchor.constraint(equalTo: rootView.bottomAnchor, constant: -10.0)
        ])
        
        view = rootView
    }
}
