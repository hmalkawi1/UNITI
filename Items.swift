//
//  Records.swift
//  NewDraft1
//
//  Created by Joe Xu on 3/11/17.
//  Copyright © 2017 UNITI. All rights reserved.
//

import UIKit

class Items: NSObject {
    
    
    var details : String?;
    var date : NSDate?;
    var level : Int?;
    var isEmpty : Bool = true;
    
    init(_ lev: Int, _ dat: NSDate, _ content: String){
        
        level = lev;
        date = dat;
        details = content;
        isEmpty = false;
    }
    
    override init() {}
    

}
