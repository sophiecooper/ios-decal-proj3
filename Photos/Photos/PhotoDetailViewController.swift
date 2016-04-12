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
        
        let url = NSURL(string: selectedPhoto[0]);
        let photoData = NSData(contentsOfURL: url!);
        imageView.image = UIImage(data: photoData!);
        
        imageUsername!.text = selectedPhoto[1];
        imageLikes!.text = selectedPhoto[2];
    }
}