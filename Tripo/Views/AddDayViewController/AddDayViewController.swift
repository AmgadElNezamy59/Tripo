//
//  AddDayViewController.swift
//  Tripo
//
//  Created by Amgad Salah on 25/07/2023.
//

import UIKit

class AddDayViewController: UIViewController {
    
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var titleTxtField: UITextField!
    @IBOutlet weak var subTitleTxtField: UITextField!
    @IBOutlet weak var titleLbl: UILabel!
    
    var savingDone : (()->())?
    var tripIndexToEdit: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpView.addRoundedCorner()
        popUpView.addShadow()
        popUpView.backgroundColor = Theme.backgroundColor
        titleLbl.font = UIFont(name: Theme.mainFontname, size: 28)

        
        titleLbl.layer.shadowOpacity = 1
        titleLbl.layer.shadowColor = UIColor .white.cgColor
        titleLbl.shadowOffset = CGSize.zero
        titleLbl.layer.shadowRadius = 5
        
      
        
        
        
        
    }
    
    
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        dismiss(animated: true)
        
    }
    
    
    
    @IBAction func saveBtnPressed(_ sender: Any) {
        guard titleTxtField.text != "", let newTripName = titleTxtField.text else {
            titleTxtField.layer.borderColor = Theme.tint?.cgColor
            titleTxtField.layer.borderWidth = 1
            titleTxtField.layer.cornerRadius = 5
            titleTxtField.placeholder = "Trip name required"
            return
        }
        
//        if let index = tripIndexToEdit {
//            TripFunctions.updateTrip(at: index, title: newTripName, image: tripImageView.image)
//        }else{
//            TripFunctions.createTrip(tripmodel: TripModel(title: newTripName, image: tripImageView.image))
//        }
        
        if let savingDone = savingDone{
            savingDone()
        }
        dismiss(animated: true)
        
    }
}
