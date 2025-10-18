//
//  UserRegisterModel.swift
//  AtomicRoutines
//
//  Created by Najabat Sofiyeva on 17.10.25.
//

import UIKit

struct User: Codable,Identifiable{
    var id:String
    var password:String
    var email:String
    var resigterDate:Date
}
