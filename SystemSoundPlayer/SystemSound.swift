//
// Created for SystemSoundPlayer
// by  Stewart Lynch on 2023-07-31
// Using Swift 5.0
// Running on macOS 14.0
// 
// Folllow me on Mastodon: @StewartLynch@iosdev.space
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch


import Foundation


struct SystemSound: Codable, Identifiable {
    let id: Int
    let category: String
    let name: String
    
    static var all: [SystemSound] {
        var systemSoundsArray = Bundle.main.decode([SystemSound].self, from: "Sounds.json")
        var uniqueSystemSounds: [String: SystemSound] = [:]

        // Filter duplicates by name
        systemSoundsArray = systemSoundsArray.reduce(into: []) { result, sound in
            if uniqueSystemSounds[sound.name] == nil {
                uniqueSystemSounds[sound.name] = sound
                result.append(sound)
            }
        }
        return systemSoundsArray.sorted(using: KeyPathComparator(\.name))
    }
}
