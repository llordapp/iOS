//
//  ChooseAccountViewController.swift
//  Llord
//
//  Created by Llord on 11/03/2016.
//  Copyright © 2016 Llord. All rights reserved.
//

import Foundation
import UIKit

class ChooseAccountViewController: UIViewController {
    
    
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var pageControl: UIPageControl!
    
    @IBOutlet weak var approveButton: UIButton!
    
    var request : Request?

    var pageImages: [UIImage] = []
    var pageViews: [UIImageView?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        approveButton.layer.cornerRadius = 4
        approveButton.layer.masksToBounds = true
        
        
        pageImages = [UIImage(named:"card1.png")!,
            UIImage(named:"card2.png")!,
            UIImage(named:"card3.png")!,
            UIImage(named:"card4.png")!]
        
        let pageCount = pageImages.count
        // Set up the page control
        pageControl.currentPage = 0
        pageControl.numberOfPages = pageCount
        
        // Set up the array to hold the views for each page
        for _ in 0..<pageCount {
            pageViews.append(nil)
        }
        
        // Set up the content size of the scroll view
        let pagesScrollViewSize = scrollView.frame.size
        scrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * CGFloat(pageImages.count), pagesScrollViewSize.height)
        
        // Load the initial set of pages that are on screen
        loadVisiblePages()
    }
    
    func loadPage(page: Int) {
        
        if page < 0 || page >= pageImages.count {
            // If it's outside the range of what you have to display, then do nothing
            return
        }
        
        // Load an individual page, first checking if you've already loaded it
        if let pageView = pageViews[page] {
            // Do nothing. The view is already loaded.
        } else {
            var frame = scrollView.bounds
            frame.origin.x = frame.size.width * CGFloat(page)
            frame.origin.y = 0.0
            frame = CGRectInset(frame, 10.0, 0.0)
            
            let newPageView = UIImageView(image: pageImages[page])
            newPageView.contentMode = .ScaleAspectFit
            newPageView.frame = frame
            scrollView.addSubview(newPageView)
            pageViews[page] = newPageView
        }
    }
    
    func purgePage(page: Int) {
        
        
        if page < 0 || page >= pageImages.count {
            // If it's outside the range of what you have to display, then do nothing
            return
        }
        
        // Remove a page from the scroll view and reset the container array
        if let pageView = pageViews[page] {
            pageView.removeFromSuperview()
            pageViews[page] = nil
        }
        
    }
    
    func loadVisiblePages() {
        
        // First, determine which page is currently visible
        let pageWidth = scrollView.frame.size.width
        let page = Int(floor((scrollView.contentOffset.x * 2.0 + pageWidth) / (pageWidth * 2.0)))
        
        // Update the page control
        pageControl.currentPage = page
        
        // Work out which pages you want to load
        let firstPage = page - 1
        let lastPage = page + 1
        
        
        // Purge anything before the first page
        for var index = 0; index < firstPage; ++index {
            purgePage(index)
        }
        
        // Load pages in our range
        for var index = firstPage; index <= lastPage; ++index {
            loadPage(index)
        }
        
        // Purge anything after the last page
        for var index = lastPage+1; index < pageImages.count; ++index {
            purgePage(index)
        }
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        // Load the pages that are now on screen
        loadVisiblePages()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPushPay(sender: AnyObject) {
        
        let info = [
            "paymentInfoId":request!.id as! AnyObject,
            "expiryDate":"0119",
            "cardNumber":"4263970000005262",
            "type":"VISA",
            "cardHolderName":"Joe Smith",
            "cvn":"123",
            "cvnPresent":"true"
        ]
        
        LlordClient.sharedInstance().postPayment(info) { (success, errorString) in
            
            if (success) {
                
                print("success")
            }
            
        }
        
    }
    
}