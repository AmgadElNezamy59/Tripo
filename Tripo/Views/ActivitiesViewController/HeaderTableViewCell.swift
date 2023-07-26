//
//  HeaderTableViewCell.swift
//  Tripo
//
//  Created by Amgad Salah on 18/07/2023.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var subTitleLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLbl.font = UIFont(name: Theme.bodyFontFameBold, size: 20)
        subTitleLbl.font = UIFont(name: Theme.bodyFontNameDemiBold, size: 18)

    }
    
    func setUp(model: DayModel){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        self.titleLbl.text = formatter.string(from: model.title)
        self.subTitleLbl.text = model.subTitle
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
