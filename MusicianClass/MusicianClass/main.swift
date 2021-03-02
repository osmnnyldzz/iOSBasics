//
//  main.swift
//  MusicianClass
//
//  Created by Osman Yıldız on 2.03.2021.
//

import Foundation
var otto = Musicians(nameInit: "Osman", ageInit: 23, instrumentInit: "Guitar",typeInit: .Drummer)
otto.sing()

print(otto.age)
print(otto.type)

var ottoyildiz = SuperMusician(nameInit: "Osman", ageInit: 23, instrumentInit: "Guitar", typeInit: .LeadGuitar)

ottoyildiz.sing()
