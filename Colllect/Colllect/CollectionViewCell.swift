//
//  CollectionViewCell.swift
//  Colllect
//
//  Created by Arun, Shetty Harshit (US - Bengaluru) on 14/12/18.
//  Copyright © 2018 Arun, Shetty Harshit (US - Bengaluru). All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var start: UIButton!
    
    @IBOutlet weak var stop: UIButton!
    
    @IBOutlet weak var progress: UIProgressView!
    
    var progressBarTimer: Timer!
    var isRunning = false

    @IBAction func Onclick(_ sender: Any) {
        
        if(!isRunning){
            //progressBarTimer.invalidate()
            //start.setTitle("Start", for: .normal)
            //start.setTitle("Stop", for: .normal)
            progress.isHidden = false
            progress.progress = 0.0
            self.progressBarTimer = Timer.scheduledTimer(timeInterval: 0.9, target: self, selector: #selector(CollectionViewCell.updateProgressView), userInfo: nil, repeats: true)
            progress.progressTintColor = UIColor.blue
            progress.progressViewStyle = .bar
            print("Begin of code")
            if let url = URL(string:"https://images.pexels.com/photos/39803/pexels-photo-39803.jpeg?cs=srgb&dl=apple-food-fruit-39803.jpg&fm=jpg") {
            image.contentMode = .scaleAspectFit
            downloadImage(from: url , image: image)
            print("End of code. The image will continue downloading in the background and it will be loaded when it ends.")
            }
            
        }
        isRunning = !isRunning
        
    }
    
    
    @IBAction func StopClick(_ sender: Any) {
        if(isRunning){
            progressBarTimer.invalidate()
            //start.setTitle("Start", for: .normal)
            progress.progress = 0.0
            
        }
        isRunning = !isRunning
    }
    
    @objc func updateProgressView(){
        progress.progress += 0.1
        progress.setProgress(progress.progress, animated: true)
        if(progress.progress == 1.0)
        {
            //progressBarTimer.invalidate()
            isRunning = false
            //start.setTitle("Start", for: .normal)
        }
    }
    

func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
    URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
}

func downloadImage(from url: URL , image: UIImageView) {
    print("Download Started")
    getData(from: url) { data, response, error in
        guard let data = data, error == nil else { return }
        print(response?.suggestedFilename ?? url.lastPathComponent)
        print("Download Finished")
        DispatchQueue.main.async() {
            image.image = UIImage(data: data)
        }
    }
}

}

