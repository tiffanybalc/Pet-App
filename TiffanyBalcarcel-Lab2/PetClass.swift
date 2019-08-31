//
//  PetClass.swift
//  TiffanyBalcarcel-Lab2
//
//  Created by Tiffany Balcarcel on 6/26/18.
//  Copyright © 2018 Tiffany Balcarcel. All rights reserved.
//

import Foundation
import AVFoundation
import AudioToolbox

class Pet {
    
    enum AnimalType {
        case dog
        case cat
        case bird
        case bunny
        case fish
    }
    var animalType: AnimalType
    private (set) var animalPlayed: Int
    private (set) var animalFed: Int
    
    //learned to play audio using several stackoverflow and online resources
    //got sounds from soundbible.com and freesoundeffects.com
    
    var hSound: SystemSoundID!
    var fSound: SystemSoundID!
    
    
    init(animalType: AnimalType) {
        self.animalType = animalType
        self.animalPlayed = 0
        self.animalFed = 0
    }
    
    func play() {
        animalPlayed += 1
        if animalFed > 0 {
            animalFed -= 1 //added
        }
        else {
            animalFed = 0
        }
    }
    
    func makeHSound(resourceName: String) -> SystemSoundID {
        var hSoundID: SystemSoundID = 0
        let hSoundURL = CFBundleCopyResourceURL(CFBundleGetMainBundle(), "\(resourceName)" as CFString?, "mp3" as CFString?, nil)
        AudioServicesCreateSystemSoundID(hSoundURL!, &hSoundID)
        return hSoundID
    }
    func makeFSound(resourceName: String) -> SystemSoundID {
        var fSoundID: SystemSoundID = 0
        let fSoundURL = CFBundleCopyResourceURL(CFBundleGetMainBundle(), "\(resourceName)" as CFString?, "mp3" as CFString?, nil)
        AudioServicesCreateSystemSoundID(fSoundURL!, &fSoundID)
        return fSoundID
    }
    
    func happySound() {
        switch animalType {
            case .dog:
                hSound = makeHSound(resourceName: "bark3")
            case .cat:
                hSound = makeHSound(resourceName: "KittenMeow")
            case .bird:
                hSound = makeHSound(resourceName: "bluejaycall")
            case .bunny:
                hSound = makeHSound(resourceName: "CartoonHop")
            case .fish:
                hSound = makeHSound(resourceName: "Bubbles")
                }
        AudioServicesPlaySystemSound(hSound)
    }
    
    func feed() {
        animalFed += 1
        if animalPlayed > 0 {
            animalPlayed -= 1 //added
        }
        else {
            animalPlayed = 0
        }
    }
    
    func yumSound() {
        switch animalType {
        case .dog:
            fSound = makeFSound(resourceName: "bark")
        case .cat:
            fSound = makeFSound(resourceName: "CatMeow2")
        case .bird:
            fSound = makeFSound(resourceName: "PeacockBird")
        case .bunny:
            fSound = makeFSound(resourceName: "prdog3")
        case .fish:
            fSound = makeFSound(resourceName: "BubblingEating")
        }
        AudioServicesPlaySystemSound(fSound)
    }
    
}
