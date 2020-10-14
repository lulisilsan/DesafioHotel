//
//  BestHotelDetailViewController.swift
//  DesafioHotel
//
//  Created by Luciana on 09/10/20.
//  Copyright © 2020 Luciana Santana. All rights reserved.
//

import UIKit

class BestHotelDetailViewController: UIViewController {
    
    @IBOutlet weak var labelNameHotel: UILabel!
    @IBOutlet weak var labelDataCheckin: UILabel!
    @IBOutlet weak var labelDataCheckout: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    
    var bestHotel: Hotel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = bestHotel?.name {
            labelNameHotel.text = name
        }
        
        if let price = bestHotel?.stayPrice {
            labelPrice.text = String(price)
        }
        
        let dataFormatter = DateFormatter()
        dataFormatter.dateStyle = DateFormatter.Style.short
        dataFormatter.dateFormat = "dd-MM-YYYY"
        
        if let checkIn = bestHotel?.checkIn {
            labelDataCheckin.text = dataFormatter.string(from: checkIn)
        }
        
        if let checkOut = bestHotel?.checkOut {
            labelDataCheckout.text = dataFormatter.string(from: checkOut)
        }
    }
    
    static func getBestHotelDetail(bestHotel: Hotel) -> BestHotelDetailViewController? {
        if let hotelView = UIStoryboard(name: "BestHotelDetail", bundle: nil).instantiateInitialViewController() as? BestHotelDetailViewController {
            hotelView.bestHotel = bestHotel
            return hotelView
        }
        return nil
    }
    
    @IBAction func actionCloseDetail(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
