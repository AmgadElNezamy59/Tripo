//
//  AddTripViewController.swift
//  Tripo
//
//  Created by Amgad Salah on 16/07/2023.
//

import UIKit
import Photos

class AddTripViewController: UIViewController {
    
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var tripTxtField: UITextField!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var tripImageView: UIImageView!
    
    var savingDone : (()->())?
    var tripIndexToEdit: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpView.addRoundedCorner()
        popUpView.addShadow()
        popUpView.backgroundColor = Theme.backgroundColor
        titleLbl.font = UIFont(name: Theme.mainFontname, size: 28)
        tripImageView.layer.cornerRadius = 10
        
        titleLbl.layer.shadowOpacity = 1
        titleLbl.layer.shadowColor = UIColor .white.cgColor
        titleLbl.shadowOffset = CGSize.zero
        titleLbl.layer.shadowRadius = 5
        
        if let index = tripIndexToEdit {
            let trip = Data.tripModels[index]
            tripTxtField.text = trip.title
            tripImageView.image = trip.image
            titleLbl.text = "Edit Trip"
        }
        
        
        
        
    }
    
    
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        dismiss(animated: true)
        
    }
    
    
    
    @IBAction func saveBtnPressed(_ sender: Any) {
        guard tripTxtField.hasValue,let newTripName = tripTxtField.text else { return }
        
        
        if let index = tripIndexToEdit {
            TripFunctions.updateTrip(at: index, title: newTripName, image: tripImageView.image)
        }else{
            TripFunctions.createTrip(tripmodel: TripModel(title: newTripName, image: tripImageView.image))
        }
        
        if let savingDone = savingDone{
            savingDone()
        }
        dismiss(animated: true)
        
    }
    
    
    
    @IBAction func addPhoto(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            PHPhotoLibrary.requestAuthorization { (status) in
                switch status {
                case .authorized :
                    DispatchQueue.main.async {
                        let myPickerController = UIImagePickerController()
                        myPickerController.delegate = self
                        myPickerController.sourceType = .photoLibrary
                        self.present(myPickerController, animated: true)                    }
                default:
                    break
                }
            }
        }
    }
}

extension AddTripViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage{
            self.tripImageView.image = image
        }
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}
