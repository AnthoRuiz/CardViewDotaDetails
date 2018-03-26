//
//  HomeViewController.swift
//  CardViewDotaDetails
//
//  Created by Anthony Ruiz on 3/25/18.
//  Copyright © 2018 Jakaboy. All rights reserved.
//

import UIKit
import RevealingSplashView
import SDWebImage

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{

   
   @IBOutlet weak var collectionView: UICollectionView!
   
   var heroes = [HeroStats]()
   let locationName = ["Hawaii Resort", "Mountain Expedition", "Scuba Diving"]

   //splash screen
   let revealingSplashScreen = RevealingSplashView(iconImage: UIImage(named:"dotaIcon")!, iconInitialSize: CGSize(width:80, height:80), backgroundColor: UIColor.white)
   
   func splash(){
      self.view.addSubview(self.revealingSplashScreen)
      self.revealingSplashScreen.animationType = SplashAnimationType.rotateOut
      self.revealingSplashScreen.startAnimation()
   }
   
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return self.heroes.count
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let urlString = "https://api.opendota.com" + (self.heroes[indexPath.row].img)
      let url = URL(string: urlString)
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
      cell.heroName.text = self.heroes[indexPath.row].localized_name.capitalized
      cell.heroImage.sd_setImage(with: url, completed: nil)
      return cell
   }
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      //add splas screen
      self.splash()
      collectionView.dataSource = self
      let url = URL(string: "https://api.opendota.com/api/herostats")
      URLSession.shared.dataTask(with: url!) { (data, response, error) in
         if error == nil {
            do{
               self.heroes = try JSONDecoder().decode([HeroStats].self, from: data!)
               DispatchQueue.main.async {
                  self.collectionView.reloadData()
               }
            }catch{
               print(error)
            }
         }
         }.resume()
      
   }
   

   
   

}
