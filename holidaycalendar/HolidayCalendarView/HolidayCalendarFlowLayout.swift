//
//  HolidayCalendarFlowLayout.swift
//  holidaycalendar
//
//  Created by Ryan McGrath on 11/18/18.
//  Copyright © 2018 Ryan McGrath. All rights reserved.
//

import Cocoa

class HolidayCalendarFlowLayout: NSCollectionViewFlowLayout, NSCollectionViewDelegateFlowLayout {
    override init() {
        super.init()
        sectionInset = NSEdgeInsetsMake(10, 10, 10, 10)
        minimumInteritemSpacing = 10.0
        minimumLineSpacing = 10.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func collectionView(_ collectionView: NSCollectionView, layout: NSCollectionViewLayout, sizeForItemAt: IndexPath) -> NSSize {
        return NSSize(width: 74.0, height: 74.0)
    }
}

extension HolidayCalendarFlowLayout: NSCollectionViewDelegate {
    
}
