//
//  STAppendViewController.swift
//  NewDraft1
//
//  Created by Joe Xu on 3/13/17.
//  Copyright © 2017 UNITI. All rights reserved.
//

import UIKit

class STAppendViewController: UIViewController {

    
    @IBOutlet weak var lab_title: UILabel!
    @IBOutlet weak var lab_time: UILabel!
    @IBOutlet weak var lab_details: UILabel!
    
    
    @IBOutlet weak var dp: UIDatePicker!
    @IBOutlet weak var txt: UITextView!
    
    
    private var clickNum : Int = 0;
    
    
    
    var index : Int?;
    
    private var LAB_TITLE_FBOUNDS : CGRect? = nil;
    private var LAB_TIME_FBOUNDS : CGRect? = nil;
    private var LAB_DETAILS_FBOUNDS : CGRect? = nil;
    
    private var DP_FBOUNDS : CGRect? = nil;
    private var TXT_FBOUNDS : CGRect? = nil;
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        index = STListViewTableViewController.curIndex;
        
        
        LAB_TITLE_FBOUNDS = CGRect(x: 0.24 * self.view.bounds.width / 1.5, y: 0.029985 * self.view.bounds.height, width: 0.506667 * self.view.bounds.width * 2, height: 0.05997 * self.view.bounds.height);
        
        LAB_TIME_FBOUNDS = CGRect(x: 0.0426667 * self.view.bounds.width , y: 0.151424 * self.view.bounds.height, width: self.lab_time.bounds.width, height: self.lab_time.bounds.height);
        
        
        LAB_DETAILS_FBOUNDS = CGRect(x: 0.0426667 * self.view.bounds.width, y: 0.376311 * self.view.bounds.height, width: self.lab_details.bounds.width, height: self.lab_details.bounds.height);
        
        DP_FBOUNDS = CGRect(x: 0.0426667 * self.view.bounds.width, y: 0.2203898 * self.view.bounds.height, width: 0.9573333 * self.view.bounds.width, height: 0.136431784 * self.view.bounds.height);
        
        TXT_FBOUNDS = CGRect(x: 0.042666667 * self.view.bounds.width, y: 0.4452773613 * self.view.bounds.height, width: 0.9146666667 * self.view.bounds.width, height: 0.469265367 * self.view.bounds.height);
        
        
        lab_title.center.x -= self.view.bounds.width;
        lab_time.center.x += self.view.bounds.width;
        lab_details.center.x += self.view.bounds.width;
        
        dp.center.y += self.view.bounds.height;
        txt.center.y -= self.view.bounds.width;
        
        dp.alpha = 0.2;
        txt.alpha = 0.3;
        
        lab_title.text = "Append contents for \(DataAccessPoint.data!.getTagString(index!))";
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 1.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.6, options: [], animations: {
            
            self.lab_title.frame = self.LAB_TITLE_FBOUNDS!;
            self.lab_time.frame = self.LAB_TIME_FBOUNDS!;
            self.lab_details.frame = self.LAB_DETAILS_FBOUNDS!;
            
            }, completion: nil)
        
        UIView.animate(withDuration: 1.2, delay: 0.3, options: [.curveEaseInOut ], animations: {
            
            self.dp.frame = self.DP_FBOUNDS!;
            self.txt.frame = self.TXT_FBOUNDS!;
            
            }, completion: nil)
        
        UIView.animate(withDuration: 1.5, delay: 0.5, options: [], animations: {
            
            self.dp.alpha = 1.0;
            self.txt.alpha = 1.0;
            
            }, completion: nil)
        
        
    }
    
    @IBAction func btn_ok_click(_ sender: AnyObject) {
        
        
        /*
        _ = DataAccessPoint.data?.addDetails((DataAccessPoint.data?.getTagString(index!))!, Items(1, dp.date as NSDate, txt.text) );
        
        let st : UIStoryboard = UIStoryboard(name: "STMain", bundle:nil)
        
        let nst = st.instantiateViewController(withIdentifier: "StBd_list")
        
        self.present(nst, animated:true, completion:nil)
        */
        
        
        if clickNum == 0 {
            
            clickNum += 1;
            
            _ = DataAccessPoint.data?.addDetails((DataAccessPoint.data?.getTagString(index!))!, Items(1, dp.date as NSDate, txt.text) );
            
            
            UIView.animateKeyframes(withDuration: 2.0, delay: 0.0, options: [], animations: {
                
                
                
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.8, animations: {
                    
                    self.lab_title.alpha = 0.0;
                    self.lab_time.alpha = 0.0;
                    self.lab_details.alpha = 0.0;
                    self.dp.alpha = 0.0;
                    self.txt.alpha = 0.0;
                    
                    self.lab_title.center.y -= self.view.bounds.height;
                    self.lab_time.center.y -= self.view.bounds.height;
                    self.lab_details.center.y -= self.view.bounds.height;
                    
                    self.dp.center.y -= self.view.bounds.height;
                    self.txt.center.y -= self.view.bounds.height;
                    
                });
                
                UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.2, animations: {
                    
                    self.lab_title.text = "Solutions for \(DataAccessPoint.data!.getTagString(self.index!))";
                    
                    let texts = DataAccessPoint.data?.getSolutions(self.index!);
                    
                    var finalTexts : String = "";
                    
                    for str in texts!{
                        
                        finalTexts += "~\t" + str + "\n";
                        
                    }

                    self.txt.text = finalTexts;
                    
                });
                
                
                UIView.addKeyframe(withRelativeStartTime: 1.0, relativeDuration: 1.0, animations: {
                    
                    self.lab_title.alpha = 1.0;
                    self.txt.alpha = 1.0;
                    
                    self.lab_title.center.y += self.view.bounds.height;
                    self.txt.frame = CGRect(x: 0.0, y: 0.101949025 * self.view.bounds.height, width: self.txt.bounds.width, height: self.txt.bounds.height);
                    
                    
                });
                
                
                
                
                }, completion: nil)
            
            
            
            
            
            
            
        }else {
            
            let st : UIStoryboard = UIStoryboard(name: "STMain", bundle:nil)
            
            let nst = st.instantiateViewController(withIdentifier: "StBd_list")
            
            self.present(nst, animated:true, completion:nil)
            
            
            
        }
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        
        
        
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        
    }
    
    
    
    
}
