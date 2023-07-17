//
//  TripsViewController.swift
//  Tripo
//
//  Created by Amgad Salah on 15/07/2023.
//

import UIKit

class TripsViewController : UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addBtn: FlaotingActionButton!
    
    @IBOutlet var helpView: UIVisualEffectView!
    var tripIndexToEdit: Int?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        TripFunctions.readTrips {
            
            self.tableView.reloadData()
            if Data.tripModels.count > 0 {
                if UserDefaults.standard.bool(forKey: "seenTripHelp") == false{
                    self.helpView.frame = self.view.frame
                    self.view.addSubview(self.helpView)
                }
            }
            
            
        }
        
    
        view.backgroundColor = Theme.backgroundColor
        
    
    }
    
    
    @IBAction func cancelHelpBtn(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.helpView.alpha = 0
        } completion: { Bool in
            self.helpView.removeFromSuperview()
            UserDefaults.standard.set (true, forKey: "seenTripHelp")

        }

    }
    
    
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "toAddTripSegue"{
            let popUp = segue.destination as! AddTripViewController
            popUp.tripIndexToEdit = self.tripIndexToEdit
            popUp.savingDone = { [weak self] in
                self?.tableView.reloadData()
            }
            tripIndexToEdit = nil
        }
    }
}


//MARK: TripsViewController extension with UITableViewDataSource

extension TripsViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Data.tripModels.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" ,for: indexPath) as! TripsTableViewCell
        cell.selectionStyle = .none
        cell.setUp(tripModel: Data.tripModels[indexPath.row])
        return cell
        
    }
    
}


//MARK: TripsViewController extension with UITableViewDelegate

extension TripsViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.size.height * 0.22
    }
    
    
    
    // trailingSwipeActionsConfigurationForRowAtindexPath
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, view, actionPerformed : @escaping (Bool)->()) in
            
            let alert = UIAlertController(title: "Delete Trip", message: "Are you sure you want to delete this trip?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { alertAction in
                actionPerformed(false)
            }))
            
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { alertAction in
                TripFunctions.deleteTrip(index: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                actionPerformed(true)
            }))
            
            self.present(alert, animated: true)
        }
        delete.image = UIImage(systemName: "trash.fill")
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    
    
    // leadingSwipeActionsConfigurationForRowAt
    
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "Edit") { (action, view, actionPerformed : @escaping (Bool) -> ()) in
            
            self.tripIndexToEdit = indexPath.row
            self.performSegue(withIdentifier: "toAddTripSegue", sender: nil)
           
            actionPerformed(true)
            

        }
        edit.image = UIImage(systemName: "pencil")
        edit.backgroundColor = UIColor(named: "Edit")
        
        return UISwipeActionsConfiguration(actions: [edit])
    }
    
}
