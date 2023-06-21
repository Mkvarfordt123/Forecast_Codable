//
//  DayDetailsViewController.swift
//  Forecast_Codable
//
//  Created by Karl Pfister on 2/6/22.
//

import UIKit

@available(iOS 16.0, *)
class DayDetailsViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var dayForcastTableView: UITableView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var currentHighLabel: UILabel!
    @IBOutlet weak var currentLowLabel: UILabel!
    @IBOutlet weak var currentDescriptionLabel: UILabel!
    
    //MARK: - Properties
    var days: [Day] = []
    var forecastData: TopLevelDictionary?
    
    //MARK: - View Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dayForcastTableView.dataSource = self
        
        NetworkController.fetchDays { forecastData in
            guard let forecastData = forecastData else { return }
            self.days = forecastData.days
            self.forecastData = forecastData
            DispatchQueue.main.async {
                self.dayForcastTableView.reloadData()
                
                self.updateViews()
            }
        }
    }
    
    func updateViews() {
    // guard or if-let or nil-collace
        cityNameLabel.text = forecastData?.cityName ?? "No City Found"
    }
}

//MARK: - Extenstions
@available(iOS 16.0, *)
extension DayDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "dayCell", for: indexPath) as? DayForcastTableViewCell else {return UITableViewCell()}
        let day = days[indexPath.row]
        cell.updateViews(day: day)
        // capture the day that matches the cell
        // tell the cell to update with that day
        return cell
    }
}

