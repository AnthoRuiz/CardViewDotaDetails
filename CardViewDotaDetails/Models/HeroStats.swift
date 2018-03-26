//
//  HeroStats.swift
//  CardViewDotaDetails
//
//  Created by Anthony Ruiz on 3/25/18.
//  Copyright © 2018 Jakaboy. All rights reserved.
//

import Foundation

struct HeroStats: Decodable {
   let localized_name: String
   let primary_attr: String
   let attack_type: String
   let base_health: Int
   let base_mana: Int
   let base_armor: Float
   let img: String
   let roles = [String]()
   let move_speed: Int
   let base_attack_min: Int
   let base_attack_max: Int
}

