//
//  AddTripViewController.swift
//  Tripo
//
//  Created by Amgad Salah on 16/07/2023.
//

import UIKit

class AddTripViewController: UIViewController {

    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var tripTxtField: UITextField!
    @IBOutlet weak var titleLbl: UILabel!
    
    var savingDone : (()->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpView.addRoundedCorner()
        popUpView.addShadow()
        popUpView.backgroundColor = Theme.backgroundColor
        titleLbl.font = UIFont(name: Theme.mainFontame, size: 28)


      
    }
    

    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        dismiss(animated: true)
       
    }
    
    @IBAction func saveBtnPressed(_ sender: Any) {
        dismiss(animated: true)
        guard let tripTxtField = tripTxtField.text else {return}
        TripFunctions.createTrip(tripmodel: TripModel(title: tripTxtField))
        if let savingDone = savingDone{
            savingDone()
        }

    }
        
}
