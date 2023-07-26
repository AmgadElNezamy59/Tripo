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

        
     
      
        
        
        
        
    }
    
    
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        dismiss(animated: true)
        
    }
    
    
    @IBAction func saveBtnPressed(_ sender: Any) {
        
        guard titleTxtField.hasValue,let newTitle = titleTxtField.text else { return }
        
        if let savingDone = savingDone{
            savingDone()
        }
        dismiss(animated: true)
        
    }
}
