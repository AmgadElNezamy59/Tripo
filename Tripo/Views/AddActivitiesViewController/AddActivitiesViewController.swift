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
    @IBOutlet var activityTypeButtons: [UIButton]!
    
    var savingDone : ((Int ,ActivityModel)->())?

    
    
    var tripIndex : Int!
    var tripModel : TripModel!
    
        

    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.font = UIFont (name: Theme.mainFontname, size: 24)
        dayPickerView.dataSource = self
        dayPickerView.delegate = self

    }
    
    
    
    @IBAction func activityTypeSelected(_ sender: UIButton) {
        
        
        activityTypeButtons.forEach ({$0.tintColor = Theme.accent})
        sender.tintColor = Theme.tint
    }
    
    

    @IBAction func save(_ sender: UIButton) {
        guard titleTextField.hasValue,let newTitle = titleTextField.text else { return }

        let activityType: ActivityType = getSelectedActivityType()
        let dayIndex = dayPickerView.selectedRow(inComponent: 0)
        let activityModel = ActivityModel(title: newTitle, subTitle: subtitleTextField.text ?? "", activityType: activityType)
        ActivityFunctions.createActivity(at: tripIndex, for: dayIndex, using: activityModel)
        dismiss(animated: true)
        
        if let savingDone = savingDone {
            savingDone (dayIndex, activityModel)
        }

    }
    
    
    
    
    
    func getSelectedActivityType () -> ActivityType {
        for (index, button) in activityTypeButtons.enumerated() {
            if button.tintColor == Theme.tint {
                return ActivityType(rawValue: index) ?? .excursion
            }
        }
        return .excursion
    }
    
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}

extension AddActivitiesViewController : UIPickerViewDataSource,UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tripModel.dayModels.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return tripModel.dayModels[row].title.mediumDate()
    }
    
}

