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
   
   @IBOutlet weak var heroAtack: UILabel!
   @IBOutlet weak var heroDef: UILabel!
   @IBOutlet weak var heroMana: UILabel!
   @IBOutlet weak var heroHeal: UILabel!
   
   @IBOutlet weak var heroSpeed: UILabel!
   @IBOutlet weak var heroAttribute: UILabel!
   @IBOutlet weak var heroRole: UILabel!
   
   
   
   
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
   func heroBasicStats(hero: HeroStats) {
      self.heroAtack.text = String(describing: hero.base_attack_min) + " - " + String(describing: hero.base_attack_max)
      self.heroDef.text = String(hero.base_armor).description
      self.heroHeal.text = String(hero.base_health)
      self.heroMana.text = String(hero.base_mana)
   }
   
   func heroAdvanceStats(hero: HeroStats) {
      self.heroSpeed.text = String(hero.move_speed)
      self.heroAttribute.text = String(hero.primary_attr)
      self.heroRole.text = ""
      var cosa = ""
      for role in hero.roles{
         cosa += role.description + " "
      }
      self.heroRole.text = cosa
   }
   
    override func viewDidLoad() {
        super.viewDidLoad()
      
      //Info Gerenal
      heroImage(hero: hero!)
      self.heroName.text = hero?.localized_name.capitalized
      heroType(hero: hero!)
      heroBasicStats(hero: hero!)
      heroAdvanceStats(hero: hero!)
      


        // Do any additional setup after loading the view.
    }
}
