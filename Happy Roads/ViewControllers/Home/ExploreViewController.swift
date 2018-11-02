//
//  ExploreViewController.swift
//  Happy Roads
//
//  Created by Saikumar on 30/10/18.
//  Copyright © 2018 Saikumar. All rights reserved.
//

import UIKit
import SDWebImage
import SideMenu

class ExploreViewController: UIViewController {

    @IBOutlet weak var travelTypesTableView: UITableView!
    
    @IBOutlet weak var kDIconImageView: UIImageView!
  
    @IBOutlet weak var kDLabel: UILabel!
    @IBOutlet weak var kDSupportView: UIView!
    
    @IBOutlet weak var nBDIconImageView: UIImageView!
    @IBOutlet weak var nBDLabel: UILabel!
    @IBOutlet weak var nBDSupportView: UIView!
    
    @IBOutlet weak var filterViewSpacing: NSLayoutConstraint!
    
    @IBOutlet weak var filterViewHeight: NSLayoutConstraint!
    
    let baseRequest = BaseRequest()
    var travelType = [[String: Any]]()
    var selectionArray = [Bool]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HappyRoadsUtilities.shared.startLoading()
        decorateNavigationBar()
        loadTravelType()
    }
    
    func decorateNavigationBar() {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 45))
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.navigationController?.navigationBar.inputView?.addSubview(view)
        
        
        self.navigationController?.navigationBar.isTranslucent = false
        let logoButton = UIButton(frame: CGRect(x: 0, y: 0, width: 45, height: 30))
        logoButton.setBackgroundImage(#imageLiteral(resourceName: "back_icon"), for: .normal)
        logoButton.addTarget(self, action: #selector(goBackFromThis), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: logoButton)
        self.navigationItem.leftBarButtonItem = barButton
        
        let menuBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "menu_icon"), style: .plain, target: self, action: #selector(menuBtnAction))
        menuBarButton.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
         self.navigationItem.rightBarButtonItem = menuBarButton
    }
    
    
    @objc func menuBtnAction() {
        present(SideMenuManager.default.menuRightNavigationController!, animated: true, completion: nil)
    }
  
    
    func loadTravelType() {
        
        baseRequest.JSONPostService(requestType: .getAllTravelType, parameters: [:], onSucess: { (JSONData) in
            
            if let travelData = JSONData as? [[String : Any]] {
                self.travelType = travelData
                DispatchQueue.main.async {
                    for _ in self.travelType { self.selectionArray.append(false) }
                    self.travelTypesTableView.reloadData()
                    HappyRoadsUtilities.shared.stopLoading()
                }
            }
            
        }) { (errorMessage) in
            self.showAlert(title: "Error", message: errorMessage, onTapOk: {})
        }
        
    }
    
    
    @IBAction func selectionButtonAction(_ sender: UIButton) {
        
        let point = sender.convert(CGPoint.zero, to: self.travelTypesTableView)
        guard let indexPath = self.travelTypesTableView.indexPathForRow(at: point) else { return }
        self.selectionArray[indexPath.row].toggle()
        self.travelTypesTableView.reloadData()
        
    }
    
    
    func compressFiltersView() {
        self.filterViewHeight.constant = 40
        self.kDLabel.isHidden = true
        self.nBDLabel.isHidden = true
    }
    
    func expandFiltersView() {
        self.filterViewHeight.constant = 80
        self.kDLabel.isHidden = false
        self.nBDLabel.isHidden = false
    }
    

}

extension ExploreViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return travelType.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExploreTableViewCell", for: indexPath) as! ExploreTableViewCell

        cell.exploreTitleLabel.text = self.travelType[indexPath.row]["TTypeName"] as? String
        
        let imgURLString = self.travelType[indexPath.row]["TTypeImage"] as? String
        if let imageString = imgURLString {
            cell.exploreImageView.sd_setImage(with: URL(string: baseRequest.getImageUrlWithHandler()+imageString), placeholderImage: #imageLiteral(resourceName: "placeholder"))
        }
        
        if selectionArray[indexPath.row] {
            cell.selectionButton.setBackgroundImage(#imageLiteral(resourceName: "round_home_selected"), for: .normal)
            cell.exploreTitleLabel.textColor = #colorLiteral(red: 0.9850470424, green: 0.8606113791, blue: 0.004870446865, alpha: 1)
        } else {
            cell.selectionButton.setBackgroundImage(#imageLiteral(resourceName: "round_home_unselected"), for: .normal)
            cell.exploreTitleLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectionArray[indexPath.row].toggle()
        self.travelTypesTableView.reloadData()
    }
    
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        print(scrollView.contentOffset.y)
        
        if  scrollView.contentOffset.y > 0 {
            self.compressFiltersView()
        } else {
            self.expandFiltersView()
        }
        
    }
    
}
