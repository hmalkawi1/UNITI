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
    var solutions : [[String]] = [];
    
    
    
    func addTag(_ var1 : String, _ var2 : String) -> Int{
        
        tags.append(var1);
        descriptions.append(var2);
        items.append(   [Items()]  );
        solutions.append(  ["", "", ""]  );
        
        
        
        
        
        return 0;
    }
    
    
    func editSolutions(_ var0 : Int, _ var1 : String, _ var2 : String, _ var3 : String) {
        
        solutions[var0][0] = var1;
        solutions[var0][1] = var2;
        solutions[var0][2] = var3;
        
    }
    
    
    
    func deleteTag() -> Int {
        
        //Wait for implementation
        
        
        
        
        return 0;
    }
    
    func addDetails(_ tag : String, _ item : Items) -> Int{
        
        var cnt : Int = 0;
        
        for tagName in tags{
            
            if tagName == tag {
                
                
                
                items[cnt].append(item);
                
                
                
                return 0;
            }
            cnt = cnt + 1;
            
        }
        
        return -1;
    }
    
    func getTagString(_ index : Int) -> String {
        
        //It will result in a disaster if use this method
        return tags[index];
        
    }
    
    
    func getTagContentsDetail(_ index : Int) -> [Items] {
        
        return items[index];
    }
    
    
    func getSolutions(_ index : Int) -> [String] {
        
        return solutions[index];
        
    }
    
    
    
    
    
    
    

}
