//
//  Hotel.swift
//  DesafioHotel
//
//  Created by Luciana on 09/10/20.
//  Copyright © 2020 Luciana Santana. All rights reserved.
//

import Foundation

class Hotel {
    var name: String
    var placing: Int
    var taxWeekReward: Double
    var taxWeekNormal: Double
    var taxWeekendReward: Double
    var taxWeekendNormal: Double
    var stayPrice: Double? = nil
    var checkIn: Date? = nil
    var checkOut: Date? = nil
    
    init(name: String, placing: Int, taxWeekReward: Double, taxWeekNormal: Double, taxWeekendReward: Double, taxWeekendNormal: Double) {
        self.name = name
        self.placing = placing
        self.taxWeekReward = taxWeekReward
        self.taxWeekNormal = taxWeekNormal
        self.taxWeekendReward = taxWeekendReward
        self.taxWeekendNormal = taxWeekendNormal
    }
    
    func calculateStay (reward: Bool, startData: Date, finalData: Date) -> Double {
        let daysStay = DataUtil.calculateDays(startData: startData, finalData: finalData)
        let quantityWeekend = daysStay.weekend
        let quantityWorkday = daysStay.workday
        var totalStayValue: Double
        
        if reward {
            totalStayValue = (Double(quantityWeekend) * taxWeekendReward) + (Double(quantityWorkday) * taxWeekReward)
        } else {
            totalStayValue = (Double(quantityWeekend) * taxWeekendNormal) + (Double(quantityWorkday) * taxWeekNormal)
        }
        stayPrice = totalStayValue
        checkIn = startData
        checkOut = finalData
       return totalStayValue
    }
}
   
