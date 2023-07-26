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
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var subTitleTxtField: UITextField!
    @IBOutlet weak var titleLbl: UILabel!
    
    var tripModel : TripModel!

    var savingDone : ((DayModel)->())?
    var tripIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpView.addRoundedCorner()
        popUpView.addShadow()
        popUpView.backgroundColor = Theme.backgroundColor
        titleLbl.font = UIFont(name: Theme.mainFontname, size: 28)

        
     
      
        
        
        
        
    }
    
    
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        dismiss(animated: true)
        
    }
    
    
    @IBAction func saveBtnPressed(_ sender: Any) {
        
        
        let dayModel = DayModel(title: datePicker.date, subtitle: subTitleTxtField.text ?? "", data: nil)
        
        DayFunctions.createDays(at: tripIndex, using: dayModel)
        
        if let savingDone = savingDone{
            savingDone(dayModel)
        }
        dismiss(animated: true)
        
        print(dayModel)
        
    }
    
    
    @IBAction func done(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
}
