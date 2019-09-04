//
//  ListTableViewController.swift
//  Empresas iOS
//
//  Created by Mariaelena Silveira on 28/08/19.
//  Copyright © 2019 Mariaelena Nascimento Silveira. All rights reserved.
//

import UIKit

class ListTableViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var mensagemLabel: UILabel!
    
    var arrayEnterprise: [Enterprise] = []
    var tableViewArrayEnterprise: [Enterprise] = []
    
    let listViewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listViewModel.delegate = self
        searchBar.delegate = self
        
        configureUI()
        touchScreenHideKeyboard()
    }
    
    private func configureUI() {
        tableView.isHidden = true
        
        let colorPink = UIColor(red: 222/255, green: 71/255, blue: 114/225, alpha: 1)
        
        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor = colorPink.cgColor
        searchBar.isHidden = true
        searchBar.changeClearButtonColor(color: colorPink)
        
        let cancelButtonAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UIBarButtonItem.appearance().setTitleTextAttributes(cancelButtonAttributes , for: .normal)
    }
    
    @IBAction func searchButtonAction(_ sender: Any) {
        listViewModel.loadEnterprises()
        searchBar.becomeFirstResponder()
        searchBar.isHidden = false
    }
}

extension ListTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewArrayEnterprise.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = Bundle.main.loadNibNamed("EnterpriseTableViewCell", owner: self, options: nil)?.first as? EnterpriseTableViewCell else { return UITableViewCell()}
        cell.enterprise = tableViewArrayEnterprise[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        detailsViewController.enterprise = tableViewArrayEnterprise[indexPath.row]
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}

extension ListTableViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.isHidden = true
        mensagemLabel.isHidden = false
        tableView.isHidden = true
        view.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let enterprises = listViewModel.arrayEnterprise
        
        guard !searchText.isEmpty else {
            tableViewArrayEnterprise = enterprises
            tableView.reloadData()
            return
        }
        
        tableViewArrayEnterprise = enterprises.filter({ enterprise -> Bool in
            let enterpriseName = enterprise.enterpriseName
            return enterpriseName.contains(searchText)
        })
        
        tableView.reloadData()
        mensagemLabel.isHidden = true
        tableView.isHidden = false
    }
}
