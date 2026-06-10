//
//  RocketListViewController.swift
//  SpaceXRockets
//
//  Created by Naga Rajitha Bhogadi on 5/28/26.
//

import Foundation
//
//  RocketListViewController.swift
//  SpaceXRockets
//
//  Created by Naga Rajitha Bhogadi on 5/28/26.
//

import UIKit

protocol RocketProtocol {
    func getRocketList() -> [Rocket]
}

class RocketListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, RocketProtocol {
    // Marks: Out let
    @IBOutlet weak var rocketTable: UITableView!
    @objc func closeScreen() {
        navigationController?.popViewController(animated: true)
    }
   //Variables
    var rocketList: [Rocket] = []
   //view Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        

        rocketList = getRocketList()
        rocketTable.delegate = self
        rocketTable.dataSource = self
        rocketTable.rowHeight = 150
        rocketTable.estimatedRowHeight = 150
        
    }
    //TableView Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rocketList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let cell = tableView.dequeueReusableCell(withIdentifier: "RocketCell") as? RocketCell
        let rocket = rocketList[indexPath.row]
        cell?.nameLabel.text = rocket.name
        cell?.firstFlightLabel.text = rocket.firstFlight
        cell?.costLabel.text = rocket.cost
        cell?.countryLabel.text = rocket.country
        cell?.rocketImageView.image = UIImage(named: rocket.rocketImage)

      
   
        return cell ?? UITableViewCell()
    }
    // Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "showRocketDetail" {

            let detailVC = segue.destination as! RocketDetailViewController

            if let indexPath = rocketTable.indexPathForSelectedRow {
                detailVC.selectedRocket = rocketList[indexPath.row]
            }
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let detailVC = storyboard?.instantiateViewController(
            withIdentifier: "RocketDetailViewController"
        ) as! RocketDetailViewController

        detailVC.selectedRocket = rocketList[indexPath.row]
       

        navigationController?.pushViewController(detailVC, animated: true)
    }
}

// Rocket Data
extension RocketListViewController {
    
    func getRocketList() -> [Rocket] {
        
        var isInternetAvailable = false
        var objNetworkManager: NetworkProtocol?
        
        if isInternetAvailable {
            objNetworkManager = NetworkManager.sharedInstance
            print("In network")
        } else {
            objNetworkManager = MockNetworkManager.sharedInstance
            print("No network")
        }
        
        return objNetworkManager?.getDataFromServer(for: "https://serveraddress.com") ?? []
    }
}
 

