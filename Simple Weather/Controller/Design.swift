//
//  Design.swift
//  Simple Weather
//
//  Created by Matheus Amendola on 05/07/20.
//  Copyright © 2020 Matheus Amendola. All rights reserved.
//

import Foundation
import UIKit

extension ViewController {
    
    //Aplica Gradiente para View
    func applyGradient() {
        let gradient = CAGradientLayer()
        let invertedGradient = CAGradientLayer()
        
        let condition = "sunny"
        
        var firstColor: UIColor
        var secondColor: UIColor
        
        if condition == "sunny"{
          firstColor = hexStringToUIColor(hex: "#6e3f98")
          secondColor = hexStringToUIColor(hex: "#d6ab97")
          gradient.colors = [firstColor.cgColor,secondColor.cgColor]
          invertedGradient.colors = [secondColor.cgColor,firstColor.cgColor]
            
        } else if condition == "Clouds" {
            firstColor = hexStringToUIColor(hex: "#0234a0")
            secondColor = hexStringToUIColor(hex: "#7299b8")
            gradient.colors = [firstColor.cgColor,secondColor.cgColor]
            invertedGradient.colors = [secondColor.cgColor,firstColor.cgColor]
        }
        
        gradient.locations = [0.0, 0.5, 1.0]
        gradient.frame = view.bounds
        view.layer.insertSublayer(gradient, at: 0)
        
        let animation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = gradient.colors
        animation.toValue = invertedGradient.colors
        
        animation.duration = 5.0
        animation.autoreverses = true
        animation.repeatCount = Float.infinity

        gradient.add(animation, forKey: nil)

        if !UIAccessibility.isReduceTransparencyEnabled {
            gradient.backgroundColor = nil
            
            let blurEffect = UIBlurEffect(style: .dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            
            blurEffectView.frame = gradient.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            }
    }
    
    //Tradutor de Hex para UIColor
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
