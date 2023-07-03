//
//  Model.swift
//  Care
//
//  Created by Alexander Suprun on 17.06.2023.
//

import Foundation
import UIKit

struct Model {
    var mainImage : UIImage
    
    static func Snimki1020 () -> [Model]
    {
        let first = Model(mainImage: UIImage(named: "01")!)
        let two = Model(mainImage: UIImage(named: "02")!)
        let three = Model(mainImage: UIImage(named: "03")!)
        let four = Model(mainImage: UIImage(named: "04")!)
        let five = Model(mainImage: UIImage(named: "05")!)
        let six = Model(mainImage: UIImage(named: "06")!)
        let seven = Model(mainImage: UIImage(named: "07")!)
        let eigth = Model(mainImage: UIImage(named: "08")!)
        let nine = Model(mainImage: UIImage(named: "09")!)
        let ten = Model(mainImage: UIImage(named: "10")!)
      return [first,two,three,four,five,six,seven,eigth,nine,ten]
    }
    
    static func Snimki010 () -> [Model]
    {
        let first = Model(mainImage: UIImage(named: "01_x")!)
        let two = Model(mainImage: UIImage(named: "02_x")!)
        let three = Model(mainImage: UIImage(named: "03_x")!)
        let four = Model(mainImage: UIImage(named: "04_x")!)
        let five = Model(mainImage: UIImage(named: "05_x")!)
        let six = Model(mainImage: UIImage(named: "06_x")!)
        let seven = Model(mainImage: UIImage(named: "07_x")!)
        let eigth = Model(mainImage: UIImage(named: "08_x")!)
        let nine = Model(mainImage: UIImage(named: "09_x")!)
        let ten = Model(mainImage: UIImage(named: "10_x")!)
      return [first,two,three,four,five,six,seven,eigth,nine,ten]
    }
   
    
}

struct Constans {
    static let leftDistanceToView: CGFloat = 20
    static let rightDistanceToView: CGFloat  = 20
    static let galleryMinimumLineSpacing : CGFloat = 100
    static let galleryItemWidth = (UIScreen.main.bounds.width - 40 )
}
