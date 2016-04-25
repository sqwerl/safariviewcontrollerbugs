# safariviewcontrollerbugs

This sample project outlines two safari view controller bugs
that have also been filed as radars.

First:
Swiping to dismiss a Safari View Controller in landscape results in an unstable UI
when the presenting view controller only supports portrait mode.

Second:
Presenting a safari view controller wrapped in a container view controller
fails to properly properly receive delegate callbacks when the container view controller
is set as the Safari View Controller's delegate. The safariViewControllerDidFinish:
method is not called after swiping to dismiss, because the container view controller
becomes deallocated before transition can complete. This problem does not occur
when the done button is tapped.