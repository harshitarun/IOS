//
//  ViewController.swift
//  Colllect
//
//  Created by Arun, Shetty Harshit (US - Bengaluru) on 14/12/18.
//  Copyright © 2018 Arun, Shetty Harshit (US - Bengaluru). All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate{
   // let b = CollectionViewCell()
    @IBOutlet weak var collectionView: UICollectionView!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.progress.isHidden = true
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //collectionView.delegate = self
        //collectionView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
        //b.progress.isHidden = false
    }
    

}

