//
//  DataAccessPoint.swift
//  NewDraft1
//
//  Created by Joe Xu on 3/11/17.
//  Copyright © 2017 UNITI. All rights reserved.
//

import UIKit

class DataAccessPoint: NSObject {
    
    static var data : Tags?;
    
    
    static func loadData(){
        
        
        DataAccessPoint.data = Tags();
        
        _ = DataAccessPoint.data?.addTag("Anxity", "It means nervous");
        _ = DataAccessPoint.data?.addTag("Upset", "When you sad, lose happiness");
        _ = DataAccessPoint.data?.addTag("Anger", "Do not satisfy with current situation");
        _ = DataAccessPoint.data?.addTag("Happy", "Maybe it is not a problem, just for dubugging here");
        
        _ = DataAccessPoint.data?.addDetails("Anxity", Items(4, NSDate(timeIntervalSinceReferenceDate: 123456789.0) , "Today, I am not good") );
        
        
        DataAccessPoint.data?.editSolutions(0, "haha, this is my solution 1", "this is my solution 2", "this is my last useless solution");
        
        
        
        
        
    }
    
    
    
    
    
    //Super inefficient way, I know, just for saving time.
    static func sync(_ var1 : Tags) -> Int {
        
        DataAccessPoint.data = var1;
        
        //write on disk, wait for implementation
        
        return 0;
    }
    
    static func getSTHistRecords() -> Tags {
        
        return DataAccessPoint.data!;
    }
    
    
    
    
    

}
