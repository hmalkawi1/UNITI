//
//  STCheckViewController.swift
//  NewDraft1
//
//  Created by Joe Xu on 3/18/17.
//  Copyright © 2017 UNITI. All rights reserved.
//

import UIKit

class STCheckViewController: UIViewController {

    @IBOutlet weak var txt_contents: UITextView!
    
    @IBOutlet weak var btn_leave: UIButton!
    
    
    
    private var texts : NSAttributedString?
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        txt_contents.alpha = 0.0;
        btn_leave.alpha = 0.2;
        
        self.btn_leave.frame = CGRect(x: 0.042667 * self.view.bounds.width, y: 0.029985 * self.view.bounds.height, width: 0.13333 * self.view.bounds.width, height: 0.05697151 * self.view.bounds.height);
        
        self.btn_leave.center.x += self.view.bounds.width;
        
        txt_contents.center = self.view.center;
        
        
        let data = DataAccessPoint.data;
        
        let index = STListViewTableViewController.curIndex;
        
        let title : String = (data?.getTagString(index!))!;
        
        
        
        var finalText : String = title + "\n";
        
        let contents : [Items] = (data?.getTagContentsDetail(index!))!;
        
        for i in contents {
            
            if i.date != nil {
                finalText += i.getFormatOutput() + "\n";
            }
            
        }
        
        txt_contents.text = finalText;
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        
        UIView.animate(withDuration: 1.5, animations: {
            
         
            
            self.txt_contents.alpha = 1.0;
        })
        
        UIView.animate(withDuration: 1.2, animations: {
            
               self.txt_contents.frame = CGRect(x: 0.0, y: self.btn_leave.bounds.height + self.btn_leave.frame.minY, width: self.view.bounds.width, height: self.view.bounds.height);
            
        })
        
        UIView.animate(withDuration: 0.9, animations: {
            
            self.btn_leave.alpha = 1.0;
            self.btn_leave.frame = CGRect(x: 0.042667 * self.view.bounds.width, y: 0.029985 * self.view.bounds.height, width: 0.13333 * self.view.bounds.width, height: 0.05697151 * self.view.bounds.height);
            
        })
        
        
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
}





