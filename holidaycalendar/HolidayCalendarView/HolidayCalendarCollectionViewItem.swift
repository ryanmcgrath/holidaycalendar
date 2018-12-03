//
//  HolidayCalendarCollectionViewItem.swift
//  holidaycalendar
//
//  Created by Ryan McGrath on 12/3/18.
//  Copyright © 2018 Ryan McGrath. All rights reserved.
//

import Cocoa

class HolidayCalendarCollectionViewItem: NSCollectionViewItem {
    public var leftAnchor: NSLayoutConstraint?
    public var initialTouchOne: NSTouch?
    public var initialTouchTwo: NSTouch?
    public var currentTouchOne: NSTouch?
    public var currentTouchTwo: NSTouch?
    public var initialPoint: CGPoint?
    public var isTracking = false
    
    public lazy var contentView: NSView = {
        let view = NSView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.wantsLayer = true
        view.layer?.backgroundColor = Styles.presentBackgroundColor.cgColor
        return view
    }()
    
    public lazy var dayLabel: NSTextField = {
        let label = NSTextField.init(labelWithString: "")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = NSFont(name: "Impact", size: 32.0)
        label.alignment = .center
        return label
    }()

    override func loadView() {
        let itemView = NSView(frame: .zero)
        itemView.postsFrameChangedNotifications = false
        itemView.postsBoundsChangedNotifications = false
        itemView.wantsLayer = true
        itemView.layer?.backgroundColor = Styles.openPresentBackgroundColor.cgColor
        itemView.allowedTouchTypes = [.direct, .indirect]

        contentView.addSubview(dayLabel)
        itemView.addSubview(contentView)
        
        leftAnchor = contentView.leftAnchor.constraint(equalTo: itemView.leftAnchor)
        NSLayoutConstraint.activate([
            dayLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18.0),
            dayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dayLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),

            contentView.topAnchor.constraint(equalTo: itemView.topAnchor),
            leftAnchor!,
            contentView.bottomAnchor.constraint(equalTo: itemView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: itemView.widthAnchor),
        ])
        
        view = itemView
    }
    
    override func touchesBegan(with event: NSEvent) {
        if(isTracking) { return }

        let initialTouches = event.touches(matching: .touching, in: view)
        if(initialTouches.count != 2) { return }
        
        isTracking = true
        initialPoint = view.convert(event.locationInWindow, from: nil)

        let touches = Array(initialTouches)
        initialTouchOne = touches[0]
        initialTouchTwo = touches[1]
        currentTouchOne = touches[0]
        currentTouchTwo = touches[1]
    }

    override func touchesMoved(with event: NSEvent) {
        if(!isTracking) { return }
        
        let currentTouches = event.touches(matching: .touching, in: view)
        if(currentTouches.count != 2) { return }
        
        currentTouchOne = nil
        currentTouchTwo = nil
        
        currentTouches.forEach { (touch: NSTouch) in
            if(touch.identity.isEqual(initialTouchOne?.identity)) {
                currentTouchOne = touch
            } else {
                currentTouchTwo = touch
            }
        }
        
        let initialXPoint = [
            initialTouchOne?.normalizedPosition.x ?? 0.0,
            initialTouchTwo?.normalizedPosition.x ?? 0.0
        ].min() ?? 0.0
        
        let currentXPoint = [
            currentTouchOne?.normalizedPosition.x ?? 0.0,
            currentTouchTwo?.normalizedPosition.x ?? 0.0
        ].min() ?? 0.0
        
        let deviceWidth = initialTouchOne?.deviceSize.width ?? 0.0
        let oldX = (initialXPoint * deviceWidth).rounded(.up)
        let newX = (currentXPoint * deviceWidth).rounded(.up)

        var delta: CGFloat = 0.0
        if(oldX > newX) { // Swiping left
            delta = (oldX - newX) * -1.0
        } else if(newX > oldX) { // Swiping right
            delta = newX - oldX
        }

        NSAnimationContext.runAnimationGroup { [weak self] (context: NSAnimationContext) in
            context.timingFunction = CAMediaTimingFunction(name: .easeIn)
            context.duration = 0.2
            context.allowsImplicitAnimation = true
            self?.leftAnchor?.animator().constant = delta
        }
    }
    
    func endTracking(_ delta: CGFloat) {
        initialTouchOne = nil
        initialTouchTwo = nil
        currentTouchOne = nil
        currentTouchTwo = nil
        isTracking = false
        
        let leftThreshold: CGFloat = 50.0
        let rightThreshold: CGFloat = -50.0
        var to: CGFloat = 0.0
        
        if(delta > leftThreshold) {
            to = leftThreshold
        } else if(delta < rightThreshold) {
            to = rightThreshold
        }
        
        NSAnimationContext.runAnimationGroup { [weak self] (context: NSAnimationContext) in
            context.timingFunction = CAMediaTimingFunction(name: .easeIn)
            context.duration = 0.5
            context.allowsImplicitAnimation = true
            self?.leftAnchor?.animator().constant = to
        }
    }

    override func touchesEnded(with event: NSEvent) {
        if(self.isTracking) {
            self.endTracking(leftAnchor?.constant ?? 0)
        }
    }
    
    override func touchesCancelled(with event: NSEvent) {
        if(self.isTracking) {
            self.endTracking(leftAnchor?.constant ?? 0)
        }
    }
}
