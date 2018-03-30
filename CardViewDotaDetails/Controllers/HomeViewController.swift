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

   
   let collectionViewCell = CollectionViewCell()
   @IBOutlet weak var collectionView: UICollectionView!
   
   var heroes = [HeroStats]()

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
      cell.shadow()
      return cell
   }
   
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      performSegue(withIdentifier: "showDetail", sender: self)
   }
   
   
   
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if let destination = segue.destination as? HeroViewController{
         //print(heroes[collectionView.indexPathsForSelectedItems!.last!.item])
         destination.hero = heroes[collectionView.indexPathsForSelectedItems!.last!.item]
         //print(heroes[collectionView.indexPathsForSelectedItems!.last!.item].roles)
      }
   }
   
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      //add splas screen
      self.splash()

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
      collectionView.dataSource = self
      collectionView.delegate = self
      
   }
   

   
   

}
