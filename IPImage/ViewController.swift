//
//  ViewController.swift
//  IPImage
//
//  Created by Benigno on 6/1/17.
//  Copyright © 2017 ninjas7. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupImages()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func setupImages() {
        
        setupImage1()
        setupImage2()
        setupImage3()
        setupImage4()
        
    }
    
    private func setupImage1() {
        
        let ipimage = IPImage(text: "Michael Jordan", radius: 20)
        imageView1.image = ipimage.generateImage()
        
    }
    
    private func setupImage2() {
        
        let ipimage = IPImage(text: "Bolt", radius: 25, font: UIFont(name: "Avenir", size: 12))
        imageView2.image = ipimage.generateImage()
        
    }
    
    private func setupImage3() {
        
        let ipimage = IPImage(text: "Neil Patrick Harris", radius: 30, font: UIFont(name: "Cochin-Italic", size: 300), textColor: nil, randomBackgroundColor: true)
        imageView3.image = ipimage.generateImage()
        
    }
    
    private func setupImage4() {
        
        let ipimage = IPImage(text: "Agent 355", radius: 50, font: nil, textColor: .black, backgroundColor: .white)
        imageView4.image = ipimage.generateImage()
        
    }
}

