//
//  ActivityTableViewCell.swift
//  Tripo
//
//  Created by Amgad Salah on 18/07/2023.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var subTitleLbl: UILabel!
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var cardView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.addShadow()
        cardView.addRoundedCorner()
        titleLbl.font = UIFont(name: Theme.bodyFontNameDemiBold, size: 20)
        subTitleLbl.font = UIFont(name: Theme.bodyFontName, size: 20)

    }
    
    func setUp(model:ActivityModel){
        imgView.image = getActivityImageView(type: model.activityType)
        titleLbl.text = model.title
        subTitleLbl.text = model.subTitle
    }
    
    
    
    func getActivityImageView(type: ActivityType) -> UIImage?
    {
        switch type {
        case .auto:
            return UIImage(systemName: "car")
        case .excursion:
            return UIImage(systemName: "arrow.up.and.down.and.arrow.left.and.right")
        case .flight:
            return UIImage(systemName:"airplane.circle.fill")
        case .food:
            return UIImage(systemName:"fork.knife.circle.fill")
        case .hotel:
            return UIImage(systemName:"house.circle.fill")
        }
    }
    
}
