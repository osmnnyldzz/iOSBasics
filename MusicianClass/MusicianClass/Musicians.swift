//
//  Musicians.swift
//  MusicianClass
//
//  Created by Osman Yıldız on 2.03.2021.
//

import Foundation

enum MusicianTypes {
    case LeadGuitar
    case Vocalist
    case Drummer
    case Bassist
}


class Musicians {
    var name : String
    var age : Int
    var instrument : String
    var type: MusicianTypes
    
    init(nameInit:String,ageInit:Int,instrumentInit:String,typeInit: MusicianTypes) {
        name = nameInit
        age = ageInit
        instrument = instrumentInit
        type = typeInit
    }
    
    func sing() {
        print("Tek taşımı kendim aldım aga")
    }
}
