//
//  HeroViewController.swift
//  CardViewDotaDetails
//
//  Created by Anthony Ruiz on 3/25/18.
//  Copyright © 2018 Jakaboy. All rights reserved.
//

import UIKit



class HeroViewController: UIViewController {
   @IBOutlet weak var heroName: UILabel!
   
   @IBOutlet weak var heroType: UIImageView!
   @IBOutlet weak var heroImage: UIImageView!
   
   
   var hero: HeroStats?
   
   func heroType(hero: HeroStats) {
      if hero.attack_type == "Melee"{
         self.heroType.image = UIImage(named:"swords")
      }else{
         self.heroType.image = UIImage(named:"bow")
      }
   }
   func heroImage(hero: HeroStats) {
      let urlString = "https://api.opendota.com" + (hero.img)
      let url = URL(string: urlString)
      self.heroImage.sd_setImage(with: url, completed: nil)
   }
   
    override func viewDidLoad() {
        super.viewDidLoad()
      
      //Info Gerenal
      heroImage(hero: hero!)
      self.heroName.text = hero?.localized_name.capitalized
      heroType(hero: hero!)
      


        // Do any additional setup after loading the view.
    }
}
