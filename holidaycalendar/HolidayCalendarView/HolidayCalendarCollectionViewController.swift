//
//  HolidayCalendarCollectionView.swift
//  holidaycalendar
//
//  Created by Ryan McGrath on 11/18/18.
//  Copyright © 2018 Ryan McGrath. All rights reserved.
//

import Cocoa

class HolidayCalendarCollectionViewController: NSViewController {
    var layout = HolidayCalendarFlowLayout()
    var dataSource = HolidayCalendarDataSource()
    
    override func loadView() {
        let collectionView = NSCollectionView(frame: .zero)
        collectionView.collectionViewLayout = layout
        collectionView.delegate = layout
        collectionView.dataSource = dataSource
        collectionView.register(HolidayCalendarCollectionViewItem.self, forItemWithIdentifier: Cells.calendarDay.reuseIdentifier)
        collectionView.allowsEmptySelection = true
        collectionView.allowsMultipleSelection = false
        collectionView.isSelectable = true
        collectionView.backgroundColors = [Styles.windowBackgroundColor]
        view = collectionView
    }

    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
}
