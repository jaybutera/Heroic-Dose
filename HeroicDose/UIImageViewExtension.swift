//
//  UIImageExtension.swift
//  HeroicDose
//

import UIKit

extension UIImageView{
    
    func setImageFromURl(stringImageUrl url: String){
        
        if let url = URL(string: url) {
           
        if let data1 = NSData(contentsOf: url){
            self.image = UIImage(data: data1 as Data)
            }
        }
    }
}


