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
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        TripFunctions.readTrips {
            self.tableView.reloadData()
        }
    
        view.backgroundColor = Theme.background
        
       
        
       

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
    
}
