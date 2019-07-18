//
//  ViewController.swift
//  GuidelineScrollView
//
//  Created by Jason Valencius Wijaya on 18/07/19.
//  Copyright © 2019 Jason Valencius Wijaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
   
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        scrollView.delegate = self
        
        let guidelineSlides:[Slide] = createSlides()
        setupSlideScrollView(guidelineSlides: guidelineSlides)
        
        pageControl.numberOfPages = guidelineSlides.count
        pageControl.currentPage = 0
        
        view.bringSubviewToFront(pageControl)
    }
    
    func createSlides() -> [Slide]{
        
        let slide1: Slide = Bundle.main.loadNibNamed( "Slide", owner: self, options: nil)?.first as! Slide
        slide1.label.text = "Slide 1"
        
        let slide2: Slide = Bundle.main.loadNibNamed( "Slide", owner: self, options: nil)?.first as! Slide
        slide2.label.text = "Slide 2"
        
        let slide3: Slide = Bundle.main.loadNibNamed( "Slide", owner: self, options: nil)?.first as! Slide
        slide3.label.text = "Slide 3"
        
        return [slide1, slide2, slide3]
    }
    
    func setupSlideScrollView(guidelineSlides: [Slide]){
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(guidelineSlides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< guidelineSlides.count{
            guidelineSlides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            
            scrollView.addSubview(guidelineSlides[i])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }


}

