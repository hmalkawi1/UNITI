//
//  ListCellTableViewCell.swift
//  NewDraft1
//
//  Created by Joe Xu on 3/12/17.
//  Copyright © 2017 UNITI. All rights reserved.
//

import UIKit

class ListCellTableViewCell: UITableViewCell {

    //Over max int would lead a disaster
    static var cnt : Int = 0;
    
    @IBOutlet weak var lab_tag: UILabel!
    @IBOutlet weak var btn_append: UIButton!
    @IBOutlet weak var btn_edit: UIButton!
    @IBOutlet weak var btn_view: UIButton!
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        btn_append.tag = ListCellTableViewCell.cnt;
        
        ListCellTableViewCell.cnt = ListCellTableViewCell.cnt + 1;
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
        
    }

}
