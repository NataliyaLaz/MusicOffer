//
//  Int+Extension.swift
//  MusicOffer
//
//  Created by Nataliya Lazouskaya on 4.07.22.
//

import UIKit

extension Int {
    
    func convertIntoTime() -> [String]{
       
        let days = self / 86400
        let hours = (self % 86400) / 3600
        let minutes = ((self % 86400) % 3600) / 60
        let seconds = ((self % 86400) % 3600) % 60
        
        let timeArray = [days, hours, minutes, seconds]
        var timerStringArray:[String] = []
        for element in timeArray {
            if element < 10 {
                timerStringArray.append("0\(element)")
            } else {
                timerStringArray.append("\(element)")
            }
        }
        return timerStringArray
    }
}
