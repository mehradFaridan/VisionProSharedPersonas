// TestActivity.swift

import Foundation
import GroupActivities
import CoreTransferable

struct TestActivity: GroupActivity, Transferable {
    var metadata: GroupActivityMetadata  = {

        /*
         Defining the MetaData for our app. This is required by apple in order for Shared Experiances
         to be activited.
         */
        var metadata = GroupActivityMetadata()
        metadata.title = NSLocalizedString("Test Activity", comment: "Test Activity Comment")

        // Type must be generic for custom Experiances
        metadata.type = .generic
        return metadata
    }()
}
