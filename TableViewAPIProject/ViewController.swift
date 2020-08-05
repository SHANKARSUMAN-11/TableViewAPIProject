//
//  ViewController.swift
//  TableViewAPIProject
//
//  Created by Shankar Suman on 21/03/20.
//  Copyright © 2020 Shankar Suman. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

class ViewController: UIViewController,UITableViewDataSource {
    
    var productDetails: ProductDetails?
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
       // tableView.delegate = self
    let myUrl = "https://www.blibli.com/backend/search/products?searchTerm=sansui&start=0&itemPerPage=26"

    getDataFromAPI(url: myUrl)

    let leftNib = UINib.init(nibName: "LeftProductCell", bundle: nil)
    self.tableView.register(leftNib, forCellReuseIdentifier: "LeftProductCell")
    //tableView.reloadData()
    }
    
    
    
//    func getDataFromAPI(myUrl: String){
//
//            Alamofire.request(myUrl,method: .get).responseData { response in
//              if response.result.isSuccess {
//                if let productJSON = response.result.value {
//                  self.product = try! JSONDecoder().decode(ProdutcDetails.self, from: productJSON)
//                  self.tableView.reloadData()
//                }
//              }
//              else {
//                print("response failed")
//              }
//            }
//
//    }
    func getDataFromAPI(url: String) {
        Alamofire.request(url, method: .get).responseData {
            response in
            switch response.result {
//            case .success:
//            if let productJSON = response.result.value {
//                self.productDetails = try! JSONDecoder().decode(ProductDetails.self, from: productJSON)
//                    print(self.productDetails?.data?.products?.count ?? 0)
//
//                }
                //            case .failure(_):
            case .success:
                if let productJSON = response.result.value {
                self.productDetails = try! JSONDecoder().decode(ProductDetails.self, from: productJSON)
                    self.tableView.reloadData()
                    print(self.productDetails?.data?.products?.count ?? 0)

                }

            case .failure(let error):
                print(error.self)
        }
        }
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionCount(n: self.productDetails?.data?.products?.count ?? 2)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section : \(section + 1)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section + 1
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell1 = tableView.dequeueReusableCell(withIdentifier: "LeftProductCell") as? LeftProductCell {
            //cell1.rightProductImage.removeFromSuperview()
            
            //cell1.rightProductImage.removeConstraints(cell1.rightProductImage.constraints)
            let lastIndex = sectionCount(n: indexPath.section+1)
            cell1.productName.text = self.productDetails?.data?.products?[lastIndex + indexPath.row].name
            
            guard let imageCount = self.productDetails?.data?.products?[lastIndex + indexPath.row].images?.count
                else {
                    return UITableViewCell()
            }
            let url = try! self.productDetails?.data?.products?[lastIndex + indexPath.row].images?[imageCount - 1].asURL()
//            cell1.leftProductImage.sd_setImage(with: url)
//            cell1.rightImageBottomConstraint = nil
//            cell1.rightImageTopConstraint = nil
//            cell1.rightImageTrailingConstraint = nil
//            cell1.rightProductImage.removeFromSuperview()
//            cell1.rightProductImage = nil
//            cell1.labelTrailingConstraint.constant = 8.0
//            cell1.labelLeadingConstraint.constant = 16.0
//            cell1.labelVerticalAlignmentConstraint.isActive = true
            cell1.leftProductImage.sd_setImage(with: url)
            if (lastIndex + indexPath.row)%2 == 0 {
                return cell1
            }
            
        } else {
            return UITableViewCell()
        }
        if let cell2 = tableView.dequeueReusableCell(withIdentifier: "LeftProductCell") as? LeftProductCell {
            //cell2.leftProductImage.removeFromSuperview()
           // cell2.leftProductImage.removeConstraints(cell2.leftProductImage.constraints)
            let lastIndex = sectionCount(n: indexPath.section)
            cell2.productName.text = self.productDetails?.data?.products?[lastIndex + indexPath.row].name
            
            guard let imageCount = self.productDetails?.data?.products?[lastIndex + indexPath.row].images?.count else {
                return UITableViewCell()
            }
            let url = try! self.productDetails?.data?.products?[lastIndex + indexPath.row].images?[imageCount - 1].asURL()
//            cell2.rightProductImage.sd_setImage(with: url)
//            cell2.leftImageTopConstraint = nil
//             cell2.leftImageBottomConstraint = nil
//             cell2.leftImageLeadingConstraint = nil
//             cell2.leftProductImage.removeFromSuperview()
//             cell2.leftProductImage = nil
//             cell2.labelLeadingConstraint.constant = 8.0
//             cell2.labelTrailingConstraint.constant = 16.0
            cell2.rightProductImage.sd_setImage(with: url)
            if (lastIndex + 1 + indexPath.row) % 2 != 0 {
                return cell2
            }
        } else {
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func sectionCount(n: Int) -> Int {
        var i = 0
        while( ((i*(i+1))/2) < n) {
            i += 1
        }
        return i
    }
    
    func previoussectionCount(n: Int) -> Int {
        let sum = n*(n-1)/2
        return sum
    }

}
