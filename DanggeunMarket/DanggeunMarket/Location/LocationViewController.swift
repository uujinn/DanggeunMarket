//
//  LocationViewController.swift
//  DanggeunMarket
//
//  Created by 양유진 on 2021/09/29.
//

import UIKit
import SkeletonView

class LocationViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img5: UIImageView!
    @IBOutlet weak var img6: UIImageView!
    @IBOutlet weak var img7: UIImageView!
    @IBOutlet weak var img8: UIImageView!
    @IBOutlet weak var img9: UIImageView!
    @IBOutlet weak var img10: UIImageView!
    @IBOutlet weak var img11: UIImageView!
    @IBOutlet weak var img12: UIImageView!
    
    override func viewDidLoad() {
        view.isSkeletonable = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("hello")
        showAnimatedSkeleton()
        
            // Hide Skeleton after 3seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self!.img1.hideSkeleton()
            self!.img2.hideSkeleton()
            self!.img3.hideSkeleton()
            self!.img4.hideSkeleton()
            self!.img5.hideSkeleton()
            self!.img6.hideSkeleton()
            self!.img7.hideSkeleton()
            self!.img8.hideSkeleton()
            self!.img9.hideSkeleton()
            self!.img10.hideSkeleton()
            self!.img11.hideSkeleton()
            self!.img12.hideSkeleton()
        }
    }
    
    func showAnimatedSkeleton(){
        img1.showAnimatedSkeleton()
        img2.showAnimatedSkeleton()
        img3.showAnimatedSkeleton()
        img4.showAnimatedSkeleton()
        img5.showAnimatedSkeleton()
        img6.showAnimatedSkeleton()
        img7.showAnimatedSkeleton()
        img8.showAnimatedSkeleton()
        img9.showAnimatedSkeleton()
        img10.showAnimatedSkeleton()
        img11.showAnimatedSkeleton()
        img12.showAnimatedSkeleton()
    }
}
