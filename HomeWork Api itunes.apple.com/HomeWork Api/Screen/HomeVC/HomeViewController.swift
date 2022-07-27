//
//  HomeViewController.swift
//  HomeWork Api
//
//  Created by Vu Nam Ha on 26/07/2022.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchTextField: UITextField!
    var arrData: [Results] = []
    var param: Parameters = ["term": "",
                             "limit": 0]
    var limit:Int = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        configCollectionView()
        hideKeyboardWhenTappedAround()
    }
    
    func setupUI() {
        navigationController?.isNavigationBarHidden = true
        searchTextField.leftViewMode = .always
        searchTextField.leftView = UIView(frame: .init(x: 0, y: 0, width: 40, height: 40))
        searchTextField.delegate = self
    }
    
    func configCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "PhimCell", bundle: nil), forCellWithReuseIdentifier: "cell")
    }
    
    func loadMore() {                           // load thêm dữ liệu nếu scroll đến cuối collectionView
        limit += 20
        print("limit now = \(limit) ")
        
        if let url = URL(string: "https://itunes.apple.com/search?")  {
            param["term"] = searchTextField.text
            param["limit"] = limit
            Alamofire.request(url, method: .get, parameters: param, headers: nil).responseJSON { response in
                guard let value = response.result.value else {
                    print("No data response")
                    return
                }
                // đã lấy được data là value
                
                let data = Phim(JSON(value))
                self.arrData = data.results!
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PhimCell
        cell.bindData(item: arrData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == arrData.count - 1 {             // load đến cuối thì gọi hàm  load thêm dữ liệu
            loadMore()
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = collectionView.bounds.width
        return CGSize(width: w/2 - 12, height: w/2 - 12)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.phim = arrData[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {          // action khi nhấn Return
        textField.resignFirstResponder()
       
        if let url = URL(string: "https://itunes.apple.com/search?")  {
            param["term"] = searchTextField.text
            param["limit"] = 20
            limit = 20
            print("limit now = \(limit) ")
            
            Alamofire.request(url, method: .get, parameters: param, headers: nil).responseJSON { response in
                guard let value = response.result.value else {
                    print("No data response")
                    return
                }
                // đã lấy được data là value
                
                let data = Phim(JSON(value))
                self.arrData = data.results!
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.collectionView.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: true)
    }
    
}


extension UIViewController {
    // Ẩn Keyboard khi tap vào màn hình
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false   // vẫn nhận sự kiện tap vào content của CollectionView
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
