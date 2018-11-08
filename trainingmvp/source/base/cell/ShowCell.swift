//
//  ListCell.swift
//  trainingmvp
//
//  Created by stag on 08/11/18.
//  Copyright © 2018 stag. All rights reserved.
//

import UIKit
import Kingfisher

class ShowCell: UITableViewCell {

    @IBOutlet weak var viewRadius: UIView!
    @IBOutlet weak var picture: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var job: UILabel!
    
    @IBOutlet weak var age: UILabel!
    var id: Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewRadius.layer.cornerRadius = 8
        viewRadius.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    func setup(show: ShowModel){
        self.id = Int(show.id)
        self.name.text = show.name
        self.job.text = show.job
        self.age.text = show.age
        if let urlEncoded = show.imageURL{
            self.picture.kf.setImage(with: URL(string: urlEncoded))
            print (self.id)
        }
    }
}
