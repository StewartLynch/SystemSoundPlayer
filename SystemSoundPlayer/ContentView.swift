//
// Created for SystemSoundPlayer
// by  Stewart Lynch on 2023-07-31
// Using Swift 5.0
// Running on macOS 14.0
// 
// Folllow me on Mastodon: @StewartLynch@iosdev.space
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch


// Credit to https://github.com/TUNER88/iOSSystemSoundsLibrary

import SwiftUI
import AudioToolbox


struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(SystemSound.all) { sound in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(sound.name)
                                .font(.title)
                            Text( sound.id == -1  ?  "kSystemSoundID_Vibrate" :  "id: \(String(sound.id))")
                            Text(sound.id == -1 ? "" : sound.category)
                        }
                        Spacer()
                        Button {
                            if sound.id == -1 {
                                AudioServicesPlayAlertSoundWithCompletion(
                                    SystemSoundID(
                                        kSystemSoundID_Vibrate
                                    )
                                ) {}
                            } else {
                                AudioServicesPlayAlertSoundWithCompletion(
                                    SystemSoundID(
                                        sound.id
                                    )
                                ) {}
                            }
                        } label: {
                            Image(systemName: "speaker.wave.3")
                        }
                        .font(.title)
                        .buttonStyle(.plain)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("System Sounds")
        }
    }
}

#Preview {
    ContentView()
}
