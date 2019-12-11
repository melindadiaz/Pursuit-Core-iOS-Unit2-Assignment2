//
//  DetailViewController.swift
//  GameOfThrones
//
//  Created by Melinda Diaz on 12/8/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var detailGotRef: GOTEpisode?
    
    @IBOutlet weak var gotImageView: UIImageView!
    @IBOutlet weak var gotNameLabel: UILabel!
    @IBOutlet weak var gotSeasonEpisodeLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var airDateLabel: UILabel!
    @IBOutlet weak var aboutDescriptionLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uploadData()
        
    }
   
    func uploadData() {
        gotImageView.image = UIImage(named: detailGotRef!.mediumImageID)
        gotNameLabel.text = detailGotRef!.name.description
        gotSeasonEpisodeLabel.text = "Season: \(detailGotRef!.season)   Episode: \(detailGotRef!.number)"
        runtimeLabel.text = "Runtime:  \(detailGotRef!.runtime)"
        airDateLabel.text = "AirDate:  \(detailGotRef!.airdate)"
        aboutDescriptionLabel.text = detailGotRef?.summary.description
        gotNameLabel.numberOfLines = 0
        gotSeasonEpisodeLabel.numberOfLines = 0
        runtimeLabel.numberOfLines = 0
        airDateLabel.numberOfLines = 0
        
    }
}
