//
//  ContentView.swift
//  VisionProSharedPersonas
//
//  Created by Mehrad Faridan on 2024-09-24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    var body: some View {
        VStack {

            Button {
                // On button Press Shared Experiance is activated. 
                TestActivity().activate()
            } label: {
                Text("Start GroupSharing")
                Image(systemName: "person.2.fill")
            }

            ToggleImmersiveSpaceButton()
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
