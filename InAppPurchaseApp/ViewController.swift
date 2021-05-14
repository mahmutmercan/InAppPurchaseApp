//
//  ViewController.swift
//  InAppPurchaseApp
//
//  Created by Mahmut MERCAN on 14.05.2021.
//

import UIKit

struct Model {
    let title: String
    let price: String
    let handler: (() -> Void)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var IAPTableView: UITableView!
    @IBOutlet weak var webSiteStackView: UIStackView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var purchaseButtonSetup: UIButton!
    
    var models = [Model]()
    var lastSelectedIndex: Int = 0
    var isSelected: Bool = true
    let cellSpacingHeight: CGFloat = 40
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IAPTableView.register(purchaseTVC.nib(), forCellReuseIdentifier: purchaseTVC.identifier)

        // Do any additional setup after loading the view.
        configureModel()
        IAPTableView.delegate = self
        IAPTableView.dataSource = self
        IAPTableView.frame = view.bounds
        IAPTableView.isUserInteractionEnabled = true
        IAPTableView.allowsSelection = true
        setupView()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        if let index = self.IAPTableView.indexPathForSelectedRow {
            self.IAPTableView.deselectRow(at: index, animated: true)
        }
    }
    
    
    //MARK: Configure Models
    func configureModel() {

        models.append(Model(title: "Year", price: "$229,99", handler: {
            IAPManager.shared.purchase(product: .year)
        }))
        
        models.append(Model(title: "Weekly", price: "$9,49", handler: {
            IAPManager.shared.purchase(product: .weekly)
        }))
        
        models.append(Model(title: "Month", price: "$27,99", handler: {
            IAPManager.shared.purchase(product: .month)
        }))
        
        models.append(Model(title: "Permanent Purchase", price: "$649,99", handler: {
            IAPManager.shared.purchase(product: .permanentPurchase)
        }))
    }
    
    //MARK: Header Image
    func setupView() {
        imageView.image = UIImage(named: "fitnessPhoto")
        imageView.contentMode = .scaleAspectFill
        purchaseButtonSetup.layer.cornerRadius = 40
    }
    
    //MARK: Setup TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: purchaseTVC.identifier, for: indexPath) as! purchaseTVC
        let model = models[indexPath.row]
        cell.configureCell(type: model.title, price: model.price)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! purchaseTVC
        cell.selectionStyle = .none
        let model = models[indexPath.row]
        lastSelectedIndex = indexPath.row
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
        
    //MARK: Buttons

    @IBAction func purchaseButton(_ sender: Any) {
        let model = models[lastSelectedIndex]
        model.handler()
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
    }
    
    @IBAction func termOfUseButtonTapped(_ sender: AnyObject) {
        UIApplication.shared.openURL(NSURL(string: "http://www.google.com")! as URL)
    }
    
    @IBAction func privacyButtonTapped(_ sender: AnyObject) {
        UIApplication.shared.openURL(NSURL(string: "http://www.google.com")! as URL)
    }
    
    @IBAction func alreadyPlusButtonTapped(_ sender: AnyObject) {
        UIApplication.shared.openURL(NSURL(string: "http://www.google.com")! as URL)
    }
}

