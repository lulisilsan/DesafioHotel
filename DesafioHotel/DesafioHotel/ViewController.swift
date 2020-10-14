//
//  ViewController.swift
//  DesafioHotel
//
//  Created by Luciana on 09/10/20.
//  Copyright © 2020 Luciana Santana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dataPickerCheckIn: UIDatePicker!
    @IBOutlet weak var dataPickerCheckOut: UIDatePicker!
    @IBOutlet weak var switchReward: UISwitch!
    
    var arrayHotels = [
        Hotel(name: "Parque das Flores", placing: 3, taxWeekReward: 80.0, taxWeekNormal: 110.0, taxWeekendReward: 80.0, taxWeekendNormal: 90.0),
        Hotel(name: "Jardim Botanico", placing: 4, taxWeekReward: 110.0, taxWeekNormal: 160.0, taxWeekendReward: 50.0, taxWeekendNormal: 60.0),
        Hotel(name: "Mar Atlantico", placing: 5, taxWeekReward: 100.0, taxWeekNormal: 220.0, taxWeekendReward: 40.0, taxWeekendNormal: 150.0)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getReward () -> Bool {
        let reward = switchReward.isOn
        return reward
    }

    @IBAction func actionHotelResult(_ sender: Any) {
        let reward = getReward()
        let startData = dataPickerCheckIn.date
        let finalData = dataPickerCheckOut.date
        
        var bestHotel: Hotel? = nil
        
        for hotel in arrayHotels {
            guard let tempHotel: Hotel = bestHotel else {
                bestHotel = hotel
                continue
            }
            let priceBestHotel: Double = tempHotel.calculateStay(reward: reward, startData: startData, finalData: finalData)
            
            let currentHotel: Double = hotel.calculateStay(reward: reward, startData: startData, finalData: finalData)
            
            if currentHotel < priceBestHotel {
                bestHotel = hotel
            } else if currentHotel == priceBestHotel {
                if hotel.placing < tempHotel.placing{
                    bestHotel = hotel
                }
            }
            
        }
        
        if let hotelView = BestHotelDetailViewController.getBestHotelDetail(bestHotel: bestHotel!) {
            present(hotelView, animated: true, completion: nil)
        }
      
    }
    
}

