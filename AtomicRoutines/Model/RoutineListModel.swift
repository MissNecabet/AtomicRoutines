//
//  Untitled.swift
//  AtomicRoutines
//
//  Created by Najabat Sofiyeva on 17.10.25.
//
import UIKit
struct RoutineRow {
    var isDone: Bool
    var title: String
    
   
    var asDictionary: [String: Any] {
        return [
            "isDone": isDone,
            "title": title
        ]
    }
}

//struct DailyRoutinList {
//    var date:Date
//    var tasks: [RoutineRow]
//}
