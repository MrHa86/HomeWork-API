//
//  DetailViewController.swift
//  HomeWork Api
//
//  Created by Vu Nam Ha on 26/07/2022.
//

import UIKit
import Kingfisher
import AVKit
import AVFoundation

class DetailViewController: UIViewController {
    
    @IBOutlet weak var phimLabel4: UILabel!
    @IBOutlet weak var phimLabel3: UILabel!
    @IBOutlet weak var phimLabel2: UILabel!
    @IBOutlet weak var phimLabel1: UILabel!
    @IBOutlet weak var phimImage: UIImageView!
    var phim: Results = Results()                           // khởi tạo init() giá trị mặc định
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindData()
        
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(goBack))
        navigationItem.leftBarButtonItem = backButton
        navigationController?.isNavigationBarHidden = false
        
    }
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
        navigationController?.isNavigationBarHidden = true
    }
    func bindData() {
        if let imageUrl = phim.artworkUrl100 {
            let url = URL(string: imageUrl)
            phimImage.kf.setImage(with: url)
        }
        if let trackName = phim.trackName {
            phimLabel1.text = "Track: \(trackName) "
        }
        if let artistName = phim.artistName {
            phimLabel2.text = "Artist: \( artistName) "
        }
        if let trackPrice = phim.trackPrice {
            phimLabel3.text = "Price: \(trackPrice) $"
        }
        if let country = phim.country {
            phimLabel4.text = "Country: \(country) "
        }
    }
    
    @IBAction func actionWatch(_ sender: UIButton) {
        
        if let previewUrl = phim.previewUrl {
            let url = URL(string: previewUrl)
            let player = AVPlayer(url: url!)
            let vc = AVPlayerViewController()
            vc.player = player
            
            present(vc, animated: true) {
                vc.player?.play()
            }
            
        }
    }
    
    
}
