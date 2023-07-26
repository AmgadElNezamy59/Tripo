//
//  AddActivitiesViewController.swift
//  Tripo
//
//  Created by Amgad Salah on 26/07/2023.
//

import UIKit

class AddActivitiesViewController: UIViewController {
    
    @IBOutlet weak var subtitleTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dayPickerView: UIPickerView!
    
    var tripIndex : Int!
    var tripModel : TripModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.font = UIFont (name: Theme.mainFontname, size: 24)
    }
    

    @IBAction func save(_ sender: UIButton) {
    }
    
    
    @IBAction func cancel(_ sender: UIButton) {
    }
    
}
