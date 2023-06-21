//
//  DayForcastTableViewCell.swift
//  Forecast_Codable
//
//  Created by Karl Pfister on 2/6/22.
//

import UIKit

class DayForcastTableViewCell: UITableViewCell {

    @IBOutlet weak var dayNameLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var forcastedHighLabel: UILabel!
    
    func updateViews(day: Day) {
        forcastedHighLabel.text = "\(day.highTemp)"
        let clouds = UIImage(named: day.weather.iconString)
        iconImageView.image = clouds
        dayNameLabel.text = day.validDate
        }
}
