//
//  PhimCell.swift
//  HomeWork Api
//
//  Created by Vu Nam Ha on 26/07/2022.
//

import UIKit

class PhimCell: UICollectionViewCell {

    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bindData(item: Results) {
        cellLabel.text = item.trackCensoredName
        if let collectionViewUrl = item.artworkUrl100 {
            let url = URL(string: collectionViewUrl)
            cellImage.kf.setImage(with: url)
        }
    }

}
