//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Alex Paul on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  //set up UI i the detailedViewController 
    var gotRef = GOTEpisode.getSection()
    
    @IBOutlet weak var gotTableView: UITableView!
    
  override func viewDidLoad() {
    super.viewDidLoad()
    gotTableView.dataSource = self
    gotTableView.delegate = self

  }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      guard let indexPath = gotTableView.indexPathForSelectedRow,
        let detailViewController = segue.destination as? DetailViewController else {
            return
        }
        let um = gotRef[indexPath.section][indexPath.row]
        detailViewController.detailGotRef = um
        }
    }


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gotRef[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section % 2 == 1 {
        guard let cell = gotTableView.dequeueReusableCell(withIdentifier: "oddSeason", for: indexPath) as? OddTableViewCell else {
            return UITableViewCell()
        }
        cell.oddCellImage.image = UIImage(named: gotRef[indexPath.section][indexPath.row].mediumImageID)
        cell.oddTitleLabel.text = gotRef[indexPath.section][indexPath.row].name
        cell.oddEpisodeLabel.text = "S:\(gotRef[indexPath.section][indexPath.row].season), E: \(gotRef[indexPath.section][indexPath.row].number)"
        return cell
        } else {
            guard let cell2 = gotTableView.dequeueReusableCell(withIdentifier: "evenSeason", for: indexPath) as? EvenTableViewCell else {
                return UITableViewCell()
            }
            cell2.evenTitleLabel.text = gotRef[indexPath.section][indexPath.row].name
            cell2.evenSeasonImage.image = UIImage(named:gotRef[indexPath.section][indexPath.row].mediumImageID)
            cell2.evenEpisodeLabel.text = "S:\(gotRef[indexPath.section][indexPath.row].season), E:\(gotRef[indexPath.section][indexPath.row].number)"
            return cell2
        }
        }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(gotRef[section].first!.season) "
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return gotRef.count
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
        
        
    }
}
