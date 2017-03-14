//
//  Tags.swift
//  NewDraft1
//
//  Created by Joe Xu on 3/11/17.
//  Copyright © 2017 UNITI. All rights reserved.
//

import UIKit

class Tags: NSObject {
    
    //  Yeah, bad data structure, since I do not want to add tasty cream on top of a mess.
    var items : [[Items]] = [];
    var tags : [String] = [];
    var descriptions : [String] = [];
    
    
    func addTag(_ var1 : String, _ var2 : String) -> Int{
        
        tags.append(var1);
        descriptions.append(var2);
        items.append([Items()]);
        
        return 0;
    }
    
    
    func deleteTag() -> Int {
        //Wait for implementation
        return 0;
    }
    
    func addDetails(_ tag : String, _ item : Items) -> Int{
        
        var cnt : Int = 1;
        
        for tagName in tags{
            
            if tagName == tag {
                
                
                items[cnt].append(item);
                
                
                
                return 0;
            }
            cnt = cnt + 1;
            
        }
        
        
        
        
        return -1;
    }
    
    
    
    
    

}
