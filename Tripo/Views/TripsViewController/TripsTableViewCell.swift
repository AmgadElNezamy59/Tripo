//
//  TripsTableViewCell.swift
//  Tripo
//
//  Created by Amgad Salah on 15/07/2023.
//

import UIKit

class TripsTableViewCell: UITableViewCell {
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var tripImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.addShadow()
        cardView.addRoundedCorner()
        cardView.backgroundColor = Theme.accent
        titleLbl.font = UIFont(name: Theme.mainFontame, size: 39)
        tripImageView.layer.cornerRadius = cardView.layer.cornerRadius
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setUp(tripModel :TripModel){
        titleLbl.text = tripModel.title
        tripImageView.image = tripModel.image
    }

}
