//
//  ActivitiesViewController.swift
//  Tripo
//
//  Created by Amgad Salah on 18/07/2023.
//

import UIKit

class ActivitiesViewController: UIViewController {
    
    @IBOutlet weak var addBtn: FlaotingActionButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backgroundImageView : UIImageView!
    
    var tripId: UUID!
    var tripModel: TripModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        TripFunctions.readTrip(by: tripId) { [weak self]  model in
            guard let self = self else { return}
            self.tripModel = model
            guard let model = model else { return}
            self.title = model.title
            self.backgroundImageView.image = model.image
            self.tableView.reloadData()
            
            
            
        }
        
    }
    
    
    @IBAction func addAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "Which would you like to add?", message: nil, preferredStyle: .actionSheet)
        
        let dayAction = UIAlertAction(title: "Day", style: .default,handler:handleAddDay)
        
        let activityAction = UIAlertAction(title: "Activity", style: .default) { action in
            print("Add new activity")
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(dayAction)
        alert.addAction(activityAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
        
        
    }
    
    
    func handleAddDay (action: UIAlertAction) {
        print("Add new day")
    }
    
    
}

extension ActivitiesViewController:UITableViewDataSource ,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tripModel?.dayModels.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let dayModel = tripModel?.dayModels[section]
        let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! HeaderTableViewCell
        
        cell.setUp(model: dayModel!)
        
        return cell.contentView
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell")
        return cell?.bounds.height ?? 44
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripModel?.dayModels[section].activityModels.count ?? 0
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = tripModel?.dayModels[indexPath.section].activityModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell") as! ActivityTableViewCell
        
        cell.setUp(model: model!)
        
        
        
        return cell
    }
    
    
}

