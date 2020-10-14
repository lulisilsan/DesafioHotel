//
//  DataUtil.swift
//  DesafioHotel
//
//  Created by Luciana on 12/10/20.
//  Copyright © 2020 Luciana Santana. All rights reserved.
//

import Foundation

class DataUtil {
    
    static func calculateDays(startData: Date, finalData: Date) -> (workday: Int, weekend: Int){

        guard startData < finalData else { return (0,0)} // verifico se a data de checkin é menor que checkout.
        let calendar = Calendar.current
        
        var workday = 0
        var weekend = 0
        var data = calendar.date(bySettingHour: 12, minute: 0, second: 0, of: startData)!
        repeat {
            if calendar.isDateInWeekend(data) {
                weekend = weekend + 1
            } else {
                workday = workday + 1
            }
            data = calendar.date(byAdding: .day, value: 1, to: calendar.date(bySettingHour: 12, minute: 0, second: 0, of: data)!)!
        } while data < finalData
        return (workday, weekend)
    }
    
}


