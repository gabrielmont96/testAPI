//
//  ShowViewController.swift
//  trainingmvp
//
//  Created by stag on 08/11/18.
//  Copyright © 2018 stag. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {
    var arrayShow = [ShowModel]()
    var presenter: ShowPresenter!
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ShowPresenter(self)
        
        table.dataSource = self
        table.delegate = self
        presenter.getShow()
    }
}

extension ShowViewController: ShowView{
    func onError(error: String) {
    }
    
    func onShow(_ show: [ShowModel]) {
        self.arrayShow = show
        self.table.reloadData()
    }
}

extension ShowViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return arrayShow.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let show = arrayShow[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ShowCell") as? ShowCell{
            cell.setup(show: show)
            return cell
        }
        return UITableViewCell()
    }
}

extension ShowViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
