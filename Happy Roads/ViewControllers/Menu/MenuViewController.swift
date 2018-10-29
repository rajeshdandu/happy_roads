//
//  MenuViewController.swift
//  Happy Roads
//
//  Created by Saikumar on 28/10/18.
//  Copyright © 2018 Saikumar. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var menuTableView: UITableView!
    
    let sectionTitlesArray = ["Home", "Fuel Stations", "Partner Services", "My Zone", "Offers & Promotions", "Invite Friends", "Help Line", "Happy Roads"]
    var sectionOpenCloseArray = [2, 2, 0, 0, 2, 2, 0, 0]
    let sectionImagesArray = [#imageLiteral(resourceName: "menu_home"), #imageLiteral(resourceName: "menu_fuel"), #imageLiteral(resourceName: "menu_partner_service"), #imageLiteral(resourceName: "menu_user_icon"), #imageLiteral(resourceName: "menu_promotions"), #imageLiteral(resourceName: "menu_invite_friends"), #imageLiteral(resourceName: "menu_call"), #imageLiteral(resourceName: "menu_happy_roads_logo")]
    
    let rowTitlesBufferArray = [[], [], ["Buy Roadside Assistance", "Book Zooncar"], ["My Trip Summary", "My fovorates", "My Notifications"], [], [], ["Call Roadside Assistance", "Emergency 112", "Call Emergency Contact"] , ["About us", "FAQ", "Terms & Conditions", "Privacy Policy"]]
    var rowTitlesArray = [[], [], [], [], [], [], [] , []]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func openCloseBtnAction(_ sender: UIButton) {
        
        guard let section = sender.superview?.tag else { return }
        
        if sectionOpenCloseArray[section] == 1 {
            for _ in 0..<rowTitlesBufferArray[section].count {
                rowTitlesArray[section].removeLast()
                let deleteIndex = IndexPath(row: rowTitlesArray[section].count, section: section)
                self.menuTableView.deleteRows(at: [deleteIndex], with: .fade)
                sectionOpenCloseArray[section] = 0
                sender.setBackgroundImage(#imageLiteral(resourceName: "arrow_sidemenu_down"), for: .normal)
            }
        } else if sectionOpenCloseArray[section] == 0 {
            for i in 0..<rowTitlesBufferArray[section].count {
                rowTitlesArray[section].insert(rowTitlesBufferArray[section][i], at: i)
                let insertIndex = IndexPath(row: i, section: section)
                self.menuTableView.insertRows(at: [insertIndex], with: .fade)
                sectionOpenCloseArray[section] = 1
                sender.setBackgroundImage(#imageLiteral(resourceName: "arrow_sidemenu_up"), for: .normal)
            }
            self.menuTableView.scrollToRow(at: IndexPath(row: rowTitlesArray[section].count-1, section: section), at: .bottom, animated: true)
        } else {}
        
        
        
    }
    

}


extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitlesArray.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = tableView.dequeueReusableCell(withIdentifier: "MenuSectionTableViewCell") as! MenuSectionTableViewCell
        view.contentView.tag = section
        
        view.menuSectionImageView.image = sectionImagesArray[section]
        view.menuSectionTitleLable.text = sectionTitlesArray[section]
        
        if sectionOpenCloseArray[section] == 2 {
            view.menuSectionOpenCloseBtn.isHidden = true
        } else {
            view.menuSectionOpenCloseBtn.isHidden = false
        }
        
        return view.contentView
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowTitlesArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuRowTableViewCell", for: indexPath) as! MenuRowTableViewCell
        cell.rowTitleLabel.text = rowTitlesArray[indexPath.section][indexPath.row] as? String
        
        return cell
        
    }


}
