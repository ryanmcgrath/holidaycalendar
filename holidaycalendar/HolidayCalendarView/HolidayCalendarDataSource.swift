//
//  HolidayCalendarDataSource.swift
//  holidaycalendar
//
//  Created by Ryan McGrath on 12/3/18.
//  Copyright © 2018 Ryan McGrath. All rights reserved.
//

import Cocoa

class HolidayCalendarDataSource: NSObject, NSCollectionViewDataSource {
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 25
    }

    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        guard let item = collectionView.makeItem(withIdentifier: Cells.calendarDay.reuseIdentifier, for: indexPath) as? HolidayCalendarCollectionViewItem else {
            fatalError("Couldn't get a valid NSCollectionViewItem. Did the type change or something...?")
        }

        item.dayLabel.stringValue = String(indexPath.item + 1)
        return item
    }
}
