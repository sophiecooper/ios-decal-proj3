//
//  PhotoDetailViewController.swift
//  Photos
//
//  Created by Sophie Cooper on 4/12/16.
//  Copyright © 2016 iOS DeCal. All rights reserved.
//

import Foundation
import UIKit

class PhotoDetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var imageUsername: UILabel?;
    @IBOutlet var imageLikes: UILabel?;
    
    var selectedPhoto: Array<String>!
    
    override func viewDidLoad() {
        print(selectedPhoto)
        imageUsername!.text = selectedPhoto[0];
    }
    
    
}