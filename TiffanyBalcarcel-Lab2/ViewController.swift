//
//  ViewController.swift
//  TiffanyBalcarcel-Lab2
//
//  Created by Tiffany Balcarcel on 6/21/18.
//  Copyright © 2018 Tiffany Balcarcel. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var animalPic: UIImageView!
    
    var pet:Pet! {
        didSet {
            updateAnimal(currAnFed: 0, currAnPlayed: 0)
        }
    }
    
    @IBOutlet weak var happinessView: DisplayView!
    @IBOutlet weak var playCount: UILabel!
    @IBOutlet weak var foodView: DisplayView!
    @IBOutlet weak var foodCount: UILabel!
    
    var dog = Pet(animalType: .dog)
    var cat = Pet(animalType: .cat)
    var bird = Pet(animalType: .bird)
    var bunny = Pet(animalType: .bunny)
    var fish = Pet(animalType: .fish)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pet = dog
        updateAnimal(currAnFed: dog.animalFed, currAnPlayed: dog.animalPlayed)
    }
    
    @IBAction func dogButton(_ sender: UIButton) {
        backView.backgroundColor = UIColor.red
        animalPic.image = #imageLiteral(resourceName: "dog")
        pet = dog
        updateAnimal(currAnFed: dog.animalFed, currAnPlayed: dog.animalPlayed)
    }
    @IBAction func catButton(_ sender: UIButton) {
        backView.backgroundColor = UIColor.blue
        animalPic.image = #imageLiteral(resourceName: "cat")
        pet = cat
        updateAnimal(currAnFed: cat.animalFed, currAnPlayed: cat.animalPlayed)
    }

    @IBAction func birdButton(_ sender: UIButton) {
        backView.backgroundColor = UIColor.yellow
        animalPic.image = #imageLiteral(resourceName: "bird")
        pet = bird
        updateAnimal(currAnFed: bird.animalFed, currAnPlayed: bird.animalPlayed)
    }
    
    @IBAction func bunnyButton(_ sender: UIButton) {
        backView.backgroundColor = UIColor.green
        animalPic.image = #imageLiteral(resourceName: "bunny")
        pet = bunny
        updateAnimal(currAnFed: bunny.animalFed, currAnPlayed: bunny.animalPlayed)
    }
    
    
    @IBAction func fishButton(_ sender: UIButton) {
        backView.backgroundColor = UIColor.purple
        animalPic.image = #imageLiteral(resourceName: "fish")
        pet = fish
        updateAnimal(currAnFed: fish.animalFed, currAnPlayed: fish.animalPlayed)
    }
    
    func updateAnimal(currAnFed: Int, currAnPlayed: Int) {
        happinessView.value = CGFloat(currAnPlayed) / 10
        foodView.value = CGFloat(currAnFed) / 10
        happinessView.animateValue(to: happinessView.value)
        foodView.animateValue(to: foodView.value)
        playCount.text = "played: \(currAnPlayed)"
        foodCount.text = "fed: \(currAnFed)"
    }
    
    @IBAction func playButton(_ sender: UIButton) {
        if foodView.value <= 0 {
            return
        }
        else {
            pet.play()
            pet.happySound()
            updatePlayButton(currAnPlay: pet.animalPlayed)
            updateFeedButton(currAnFeed: pet.animalFed)
        }

    }
    
    func updatePlayButton(currAnPlay: Int) {
        if currAnPlay == 0 {
            happinessView.value = 0
        }
        if currAnPlay > 9 {
            happinessView.value = 1.0
        }
        else {
            happinessView.value = CGFloat(currAnPlay) / 10
        }
        happinessView.animateValue(to: happinessView.value)
        playCount.text = "played: \(currAnPlay)"
    }
    
    @IBAction func feedButton(_ sender: UIButton) {
        let currentDifference2 = pet.animalFed - pet.animalPlayed
        if currentDifference2 >= 10  {
            return
        }
        else {
            pet.feed()
            pet.yumSound()
            updateFeedButton(currAnFeed: pet.animalFed)
            updatePlayButton(currAnPlay: pet.animalPlayed)
        }
    }
    
    func updateFeedButton(currAnFeed: Int) {
        if currAnFeed == 0 {
            foodView.value = 0
        }
        if currAnFeed > 9 {
            foodView.value = 1.0
        }
        else {
            foodView.value = CGFloat(currAnFeed) / 10
        }
        foodView.animateValue(to: foodView.value)
        foodCount.text = "fed: \(currAnFeed)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

