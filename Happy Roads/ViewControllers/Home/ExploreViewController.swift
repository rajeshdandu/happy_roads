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
    @IBOutlet weak var kDButton: UIButton!
    @IBOutlet weak var kDTextField: UITextField!
    
    @IBOutlet weak var nBDIconImageView: UIImageView!
    @IBOutlet weak var nBDLabel: UILabel!
    @IBOutlet weak var nBDSupportView: UIView!
    @IBOutlet weak var nBDButton: UIButton!
    
    @IBOutlet weak var nBSlider: UISlider!
  
    @IBOutlet weak var filterViewHeight: NSLayoutConstraint!
    @IBOutlet weak var componetsViewHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var discoverBtn: UIButton!
    
    let baseRequest = BaseRequest()
    var travelType = [[String: Any]]()
    var selectionArray = [Bool]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HappyRoadsUtilities.shared.startLoading()
        decorateNavigationBar()
        decorateUI()
        loadTravelType()
    }
    
    func decorateUI() {
        
        kDTextField.backgroundColor = .clear
        kDTextField.borderStyle = .none
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: kDTextField.frame.size.height, height: kDTextField.frame.size.height))
        view.backgroundColor = .clear
        view.layer.cornerRadius = 4
        
        let imageView = UIImageView(frame: CGRect(x: view.frame.origin.x+6, y: view.frame.origin.x+6, width: view.frame.size.width-12, height: view.frame.size.height-12))
        
        kDTextField.attributedPlaceholder = NSAttributedString(string: kDTextField.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)])
 
        kDTextField.leftViewMode = .always
        kDTextField.leftView = view
        imageView.image = #imageLiteral(resourceName: "destination_icon_home")
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        kDTextField.useUnderlineColor()
        
        self.kDTextField.isHidden = true
        self.nBSlider.isHidden = true
        self.componetsViewHeight.constant = 1
        
        self.discoverBtn.isHidden = true
       
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
    
    @IBAction func kDButtonAction(_ sender: UIButton) {
        self.filterViewHeight.constant = 40
        self.kDLabel.isHidden = true
        self.nBDLabel.isHidden = true
        self.componetsViewHeight.constant = 70
        self.kDTextField.isHidden = false
        self.nBSlider.isHidden = true
        
        self.kDIconImageView.image = #imageLiteral(resourceName: "destination_icon_home")
        self.nBDIconImageView.image = #imageLiteral(resourceName: "radius_icon_home_select")

    }
    
    @IBAction func nBDButtionAction(_ sender: UIButton) {
        self.compressFiltersView()
        self.filterViewHeight.constant = 40
        self.kDLabel.isHidden = true
        self.nBDLabel.isHidden = true
        self.componetsViewHeight.constant = 70
        self.kDTextField.isHidden = true
        self.nBSlider.isHidden = false
        
        self.kDIconImageView.image = #imageLiteral(resourceName: "destination_icon_home")
        self.nBDIconImageView.image = #imageLiteral(resourceName: "radius_icon_home_select")

    }
    
    
    @IBAction func selectionButtonAction(_ sender: UIButton) {
        
        let point = sender.convert(CGPoint.zero, to: self.travelTypesTableView)
        guard let indexPath = self.travelTypesTableView.indexPathForRow(at: point) else { return }
        self.selectionArray[indexPath.row].toggle()
        self.travelTypesTableView.reloadData()
        
        discoverButtonAction()
        
    }
    
    func discoverButtonAction() {
        if selectionArray.contains(true) {
            self.discoverBtn.isHidden = false
            UIView.animate(withDuration: 0.5) {
                self.discoverBtn.alpha = 1
            }
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.discoverBtn.alpha = 0
            }) { (completed) in
                self.discoverBtn.isHidden = true
            }
        }
    }
    
    @IBAction func discoverButtonAction(_ sender: UIButton) {
        
        
        
    }
    
    func compressFiltersView() {
        self.filterViewHeight.constant = 40
        self.componetsViewHeight.constant = 1
        self.kDLabel.isHidden = true
        self.nBDLabel.isHidden = true
        self.kDTextField.isHidden = true
        self.nBSlider.isHidden = true
        
        self.nBDIconImageView.image = #imageLiteral(resourceName: "radius_icon_home_select")
        self.kDIconImageView.image = #imageLiteral(resourceName: "destination_icon_home")
    }
    
    func expandFiltersView() {
        self.filterViewHeight.constant = 70
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
        
        discoverButtonAction()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectionArray[indexPath.row].toggle()
        self.travelTypesTableView.reloadData()
    }
    
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if  scrollView.contentOffset.y > 0 {
            self.compressFiltersView()
        } else {
            self.expandFiltersView()
        }
    }
    
}
