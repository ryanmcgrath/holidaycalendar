# HolidayCalendar
Welcome! This is a demo project of a Holiday (often known as an _Advent_ calendar), built as a demo for an `NSCollectionViewItem` that has been engineered to be "swipeable". What's that mean?

Well, if you use `NSTableView`, you get swiping on cells for free - most often seen in Mail.app, but not unheard of elsewhere. Over on the iOS side of things, this is a pretty common usage pattern, ranging from built-in (`UITableView`) to excellent open source components ([SwipeCellKit](https://github.com/SwipeCellKit/SwipeCellKit)). `NSCollectionView` got an updated API in recent releases of macOS and it would be cool if it could support the same things as SwipeCellKit, at least in my opinion.

I went looking and, lo and behold... well, we'll just be nice and say that the docs for this are a bit "spread out", which is another phrase for "nonexistent". I wound up not using this in a project, so I figured I'd open source as far as I got, along with some next steps in case anybody's interested in continuing with it.

The meat of this, if you're concerned with swiping components, is found in `HolidayCalendarCollectionViewItem.swift`. It handles the logic for registering two-finger-trackpad touches, and sliding views to the left or right to reveal what's underneath. If you're interested in furthering this, you'll likely want to consider...

- I haven't tied this into a specific API; I would recommend just taking the SwipeCellKit API approach, or just integrating it into SwipeCellKit itself.
- Right now the animations are "dumb" in that they don't have a sense of velocity on the drag actions, as getting it in macOS drags can be a bit of a PITA. No reason it can't be done, I just didn't bother.

## Screenshots
![Unswiped](https://github.com/ryanmcgrath/holidaycalendar/blob/master/screenshots/Unswiped.png?raw=true)
![Swiped](https://github.com/ryanmcgrath/holidaycalendar/blob/master/screenshots/SwipedOpen.png?raw=true)

## What else is here?
This repo could also be used as scaffolding/reference for a nibless Swift Cocoa app, if you're into that sorta thing. I personally think Interface Builder makes anyone who deals with UI in code (web devs, etc) groan out loud, so maybe this goes towards showing it's not _that_ difficult or outlandish to do otherwise.

- It implements an `NSToolbar` in code, which... well the docs aren't really friendly to that.
- It implements an `NSMenu` in code, which... well, again, you see how this works.
- Implements window/rootview/etc in code.

## License, etc
This is very much a "do-wtf-you-want-with-it" license. Code is as-is.

Questions can be directed to [ryan@rymc.io](mailto:ryan@rymc.io) or [@ryanmcgrath on Twitter](https://twitter.com/ryanmcgrath).
