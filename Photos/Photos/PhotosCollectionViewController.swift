//
//  PhotosCollectionViewController.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    var photos: [Photo]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let api = InstagramAPI()
        api.loadPhotos(didLoadPhotos)
        // FILL ME IN
    }

    /* 
     * IMPLEMENT ANY COLLECTION VIEW DELEGATE METHODS YOU FIND NECESSARY
     * Examples include cellForItemAtIndexPath, numberOfSections, etc.
     */
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let photoCell = collectionView.dequeueReusableCellWithReuseIdentifier("photoCell", forIndexPath: indexPath) as! PhotoCell;
        if (photos != nil) {
            let currentPhoto: Photo! = photos[(indexPath.section * 3) + indexPath.item];
            loadImageForCell(currentPhoto, imageView: photoCell.imageView)
        }
        return photoCell;
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3;
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        if (photos != nil) {
            return photos.count / 3;
        } else {
            return 0;
        }
    }
    
    @IBAction func unwindToPhotoFeed(segue: UIStoryboardSegue) {}
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nextView = segue.destinationViewController as! PhotoDetailViewController;
        let cell = sender as! UICollectionViewCell
        let indexPath = collectionView!.indexPathForCell(cell)
        let cellInfo: Photo! = photos[(indexPath!.section * 3) + indexPath!.item];
        print(cellInfo.url);
        print(cellInfo.username);
        print(cellInfo.likes);
        nextView.selectedPhoto = [cellInfo.url, cellInfo.username, String(cellInfo.likes)];
    }
    
    
    /* Creates a session from a photo's url to download data to instantiate a UIImage. 
       It then sets this as the imageView's image. */
    func loadImageForCell(photo: Photo, imageView: UIImageView) {
        let url = NSURL(string: photo.url);
        let photoData = NSData(contentsOfURL: url!);
        imageView.image = UIImage(data: photoData!);
    }
    
    /* Completion handler for API call. DO NOT CHANGE */
    func didLoadPhotos(photos: [Photo]) {
        self.photos = photos
        self.collectionView!.reloadData()
    }
    
}

