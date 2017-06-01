//
//  IPImage.swift
//  IPImage
//
//  Created by Benigno on 6/1/17.
//  Copyright © 2017 ninjas7. All rights reserved.
//

import UIKit

/**
 The class that generates circular UIImage objects.
 */
public class IPImage: NSObject {
    
    //MARK: - Properties
    /**
     Input text. The first letter from the first and last word (depending on number of words) will be text at the center of the image.
    */
    public var text:String = ""
    
    private var _radius:Double = 0
    private var _length:Double = 0
    
    /**
     Radius of the circular image
    */
    public var radius:Double {
        get {
            return _radius
        }
        set {
            _radius = newValue
            _length = _radius * 2
        }
    }
    
    /**
     Font for the text.
     
     If it is not initialized before `generateImage()`, it will be assigned with a value:
     
         UIFont.systemFont(ofSize: CGFloat(radius))
    */
    public var font:UIFont?
    
    /**
     Color for the text.
     
     If it is not initialized before `generateImage()`, it will default to `UIColor.white`
     */
    public var textColor:UIColor?
    
    /**
     Fill color of the circular image.
     
     If it is not initialized before `generateImage()`, it will default to `UIColor.gray`
     */
    public var backgroundColor:UIColor?
    
    //MARK: - Initailization
    /**
     Initialize an IPImage object. The default value of `radius` is 25. `text` is empty.
    */
    public convenience override init() {
        self.init(text: "", radius: 25)
    }
    
    /**
     Initialize an IPImage object.
     
     - Parameters:
         - text: Source of the initials
         - radius: Circular image radius
     */
    public convenience init(text: String, radius: Double) {
        self.init(text: text, radius: radius, font: nil)
    }
    
    /**
     Initialize an IPImage object.
     
     - Parameters:
         - text: Source of the initials
         - radius: Circular image radius
         - font: Font for the text at the center
     */
    public convenience init(text: String, radius: Double, font: UIFont?) {
        self.init(text: text, radius: radius, font: font, textColor: nil, randomBackgroundColor: false)
    }
    
    /**
     Initialize an IPImage object.
     
     - Parameters:
         - text: Source of the initials
         - radius: Circular image radius
         - textColor: Color of the text at the center
         - randomBackgroundColor: Randomized fill color
     */
    public init(text: String, radius: Double, font: UIFont?, textColor: UIColor?, randomBackgroundColor: Bool) {
        super.init()
        
        self.text = text
        self.radius = radius
        self.textColor = textColor ?? .white
        self.backgroundColor = randomBackgroundColor ? self.randomColor() : .gray
        
        if let aFont = font {
            if aFont.pointSize > CGFloat(radius) {
                self.font = UIFont(name: aFont.fontName, size: CGFloat(radius))
            } else {
                self.font = font
            }
        } else {
            self.font = UIFont.systemFont(ofSize: CGFloat(radius))
        }
        
    }
    
    /**
     Initialize an IPImage object.
     
     - Parameters:
         - text: Source of the initials
         - radius: Circular image radius
         - textColor: Color of the text at the center
         - backgroundColor: Randomized fill color
     */
    public init(text: String, radius: Double, font: UIFont?, textColor: UIColor?, backgroundColor: UIColor?) {
        super.init()
        
        self.text = text
        self.radius = radius
        self.textColor = textColor ?? .white
        self.backgroundColor = backgroundColor ?? .lightGray
        
        if let aFont = font {
            if aFont.pointSize > CGFloat(radius) {
                self.font = UIFont(name: aFont.fontName, size: CGFloat(radius))
            } else {
                self.font = font
            }
        } else {
            self.font = UIFont.systemFont(ofSize: CGFloat(radius))
        }
        
    }
    
    //MARK: - Private
    private func randomColor() -> UIColor {
        
        let red = CGFloat(arc4random_uniform(256))/255.0
        let green = CGFloat(arc4random_uniform(256))/255.0
        let blue = CGFloat(arc4random_uniform(256))/255.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        
    }
    
    private func setupView() -> UIView {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: _length, height: _length))
        view.backgroundColor = backgroundColor
        view.addSubview(setupLabel())
        rounded(view: view)
        
        return view
    }
    
    private func setupLabel() -> UILabel {
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: _length, height: _length))
        label.text = initials()
        label.font = font
        label.textColor = textColor
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        label.allowsDefaultTighteningForTruncation = true
        return label
        
    }
    
    private func rounded(view: UIView) {
        
        let width = view.frame.width
        let mask = CAShapeLayer()
        mask.path = UIBezierPath(ovalIn: CGRect(x: view.bounds.midX - width / 2, y: view.bounds.midY - width / 2, width: width, height: width)).cgPath
        view.layer.mask = mask
        
//        //TESTING
//        view.layer.shouldRasterize = true
//        view.layer.rasterizationScale = UIScreen.main.scale
        
    }
    
    //MARK: - Text Generation
    
    /**
     Generates the initials from the value of `text`. For example:
     
         text = "Harry"
     
     the result will be: **H**. If:
     
         text = "Harry Potter"
     
     the result will be: **HP**. And, if:
     
         text = "Harry Potter Jr."
     
     the result will be **HJ**.
     
     
     - Returns: String which is one or two charaters long depending on the number of words in `text`.
    */
    public func initials() -> String {
        
        let names = text.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: " ")
            
        if names.count > 1 {
            
            let firstName = names[0]
            let lastName = names[names.count - 1]
            
            let firstNameInitial = firstName.substring(to: firstName.index(after: firstName.startIndex)).uppercased()
            let lastNameInitial = lastName.substring(to: lastName.index(after: lastName.startIndex)).uppercased()
            
            return (firstNameInitial + lastNameInitial)
            
        } else {
            
            if text == "" {
                return ""
            }
            
            let firstName = text
            let firstNameInitial = firstName.substring(to: firstName.index(after: firstName.startIndex)).uppercased()
            return firstNameInitial
        }
        
    }
    
    //MARK: - Image Generation
    
    /**
     Call to generate the resulting image.
     
     - Returns: Circular image
    */
    public func generateImage() -> UIImage? {
        
        let view = setupView()
        
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0.0)
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
//        print(image ?? "No image")
        return image
    }
    
    
}
