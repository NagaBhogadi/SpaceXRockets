//
//  RocketDetailViewController.swift
//  SpaceXRockets
//
//  Created by Naga Rajitha Bhogadi on 5/28/26.
//

import Foundation
import UIKit

class RocketDetailViewController: UIViewController, UIScrollViewDelegate {
    // Mark: - IBOutlets
    @IBOutlet weak var imageScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var firstFlightLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var successRateLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //Mark: - Variables Assigning
    var selectedRocket: Rocket?
    var rocketImages: [String] = []
    //Creating View Life Cycle
    override func viewDidLoad() {
            super.viewDidLoad()
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor:UIColor.white
        ]
        imageScrollView.delegate = self
        imageScrollView.isPagingEnabled = true
        imageScrollView.showsHorizontalScrollIndicator = false

                setupRocketDetails()
            }

            override func viewDidLayoutSubviews() {
                super.viewDidLayoutSubviews()
                setupImageScroll()
            }
            //Creating function for  Rocket Deatiles Optional
            func setupRocketDetails() {

                guard let rocket = selectedRocket else {
                    print("NO DATA RECEIVED")
                    return
                }

                nameLabel.text = "Rocket Name: \(rocket.name)"
                firstFlightLabel.text = "First Flight: \(rocket.firstFlight)"
                countryLabel.text = "Country: \(rocket.country)"
                successRateLabel.text = "Success Rate: \(rocket.successRate)"
                massLabel.text = "Mass \(rocket.mass)"
                descriptionLabel.text = rocket.description
                rocketImages = rocket.detailImage
            }
            //set up for Imagescrolling
            func setupImageScroll() {

                imageScrollView.subviews.forEach { $0.removeFromSuperview() }

                pageControl.numberOfPages = rocketImages.count
                pageControl.currentPage = 0

                let width = imageScrollView.bounds.width
                let height = imageScrollView.bounds.height

                for i in 0..<rocketImages.count {

                    let imageView = UIImageView()
                    imageView.frame = CGRect(
                        x: width * CGFloat(i),
                        y: 0,
                        width: width,
                        height: height
                    )

                    imageView.image = UIImage(named: rocketImages[i])
                    imageView.contentMode = .scaleAspectFill
                    imageView.clipsToBounds = true

                    imageScrollView.addSubview(imageView)
                }

                imageScrollView.contentSize = CGSize(
                    width: width * CGFloat(rocketImages.count),
                    height: height
                )
            }
            //Scroll View Delegate
            func scrollViewDidScroll(_ scrollView: UIScrollView) {
                let page = round(scrollView.contentOffset.x / scrollView.frame.width)
                pageControl.currentPage = Int(page)
            }
        }
