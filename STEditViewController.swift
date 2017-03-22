//
//  STEditViewController.swift
//  NewDraft1
//
//  Created by Joe Xu on 3/18/17.
//  Copyright © 2017 UNITI. All rights reserved.
//

import UIKit

class STEditViewController: UIViewController {
    
    private var BTN_LEAVE_FBOUNDS : CGRect?;
    private var BTN_OK_FBOUNDS : CGRect?;
    private var LAB_FBOUNDS : CGRect?;
    private var TXT_FBOUNDS : CGRect?;
    
    
    @IBOutlet weak var btn_leave: UIButton!
    @IBOutlet weak var lab_title: UILabel!
    @IBOutlet weak var txt_tag: UITextField!
    @IBOutlet weak var btn_ok: UIButton!
    
    private var txt_sol_1 : UITextField?;
    private var txt_sol_2 : UITextField?;
    private var txt_sol_3 : UITextField?;
    
    private let data = DataAccessPoint.data;
    private let index = STListViewTableViewController.curIndex;
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        BTN_LEAVE_FBOUNDS = CGRect(x: 0.042666 * self.view.bounds.width, y: 0.029985007 * self.view.bounds.height, width: 0.096 * self.view.bounds.width, height: 0.0449775112 * self.view.bounds.height);
        
        BTN_OK_FBOUNDS = CGRect(x: 0.421333 * self.view.bounds.width, y: 0.91454272 * self.view.bounds.height, width: 0.1573333 * self.view.bounds.width, height: 0.055472263 * self.view.bounds.height);
        
        LAB_FBOUNDS = CGRect(x: 0.213333 * self.view.bounds.width, y: 0.029985007 * self.view.bounds.height, width: 0.5733333 * self.view.bounds.width, height: 0.044977511 * self.view.bounds.height);
        
        TXT_FBOUNDS = CGRect(x: 0.0426667 * self.view.bounds.width, y: 0.155922 * self.view.bounds.height, width: 0.9146667 * self.view.bounds.width, height: 0.044977511 * self.view.bounds.height);
        
        
        btn_ok.frame = BTN_OK_FBOUNDS!;
        btn_leave.frame = BTN_LEAVE_FBOUNDS!;
        lab_title.frame = LAB_FBOUNDS!;
        txt_tag.frame = TXT_FBOUNDS!;
        
        
        btn_ok.center.y += self.view.bounds.height;
        btn_leave.center.x += self.view.bounds.width;
        lab_title.center.y -= self.view.bounds.height;
        
        btn_ok.alpha = 0.0;
        btn_leave.alpha = 0.0;
        lab_title.alpha = 0.0;
        txt_tag.alpha = 0.0;
        
        
        lab_title.text = "Edit Tag \(DataAccessPoint.data?.getTagString(STListViewTableViewController.curIndex!))";
        
        txt_tag.text = DataAccessPoint.data?.getTagString(STListViewTableViewController.curIndex!);
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        UIView.animate(withDuration: 1.5, animations: {
            self.btn_ok.alpha = 1.0;
            self.btn_leave.alpha = 1.0;
            self.lab_title.alpha = 1.0;
            self.txt_tag.alpha = 1.0;
        })
        
        
        UIView.animate(withDuration: 1.3, delay: 0.2, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.5, options: [], animations: {
            
            self.btn_ok.frame = self.BTN_OK_FBOUNDS!;
            self.btn_leave.frame = self.BTN_LEAVE_FBOUNDS!;
            
            
            }, completion: { _ in
                
                self.txt_sol_1 = UITextField();
                self.txt_sol_1?.frame = self.TXT_FBOUNDS!;
                self.txt_sol_1?.placeholder = "Solution #1";
                
                self.txt_sol_2 = UITextField();
                self.txt_sol_2?.frame = self.TXT_FBOUNDS!;
                self.txt_sol_2?.placeholder = "Solution #2";
                
                self.txt_sol_3 = UITextField();
                self.txt_sol_3?.frame = self.TXT_FBOUNDS!;
                self.txt_sol_3?.placeholder = "Solution #3";
                
                
                self.view.addSubview(self.txt_sol_1!);
                self.view.addSubview(self.txt_sol_2!);
                self.view.addSubview(self.txt_sol_3!);
                
                UIView.animate(withDuration: 0.4, delay: 0.0, options: [], animations: {
                    
                        self.txt_sol_1?.center.y += 0.11094452773 * self.view.bounds.height;
                    
                    self.txt_sol_2?.center.y += 2 * 0.11094452773 * self.view.bounds.height;
                    
                    self.txt_sol_3?.center.y += 3 * 0.11094452773 * self.view.bounds.height;
                    
                    }, completion: { _ in
                        
                        let texts = self.data?.getSolutions(self.index!);
                        
                        /*So ugly code, only for this project, just for keeping simple and fast implementation without concern anything*/
                        var i = 0;
                        
                        for str in texts!{
                            
                                
                                switch(i){
                                    
                                case 0:
                                    self.txt_sol_1?.text = str;
                                    
                                case 1:
                                    self.txt_sol_2?.text = str;
                                case 2:
                                    
                                    self.txt_sol_3?.text = str;
                                    
                                default: break
                                }
                            
                            
                            i += 1;
                            
                            
                        }
                        
                        
                        
                });
                
                
                
        })
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    @IBAction func btn_ok_click(_ sender: UIButton) {
        
        data?.editSolutions(STListViewTableViewController.curIndex!, (txt_sol_1?.text)!, (txt_sol_2?.text)!, (txt_sol_3?.text)!);
        
        
        let st : UIStoryboard = UIStoryboard(name: "STMain", bundle:nil)
        
        let nst = st.instantiateViewController(withIdentifier: "StBd_list");
        
        self.present(nst, animated:true, completion:nil)
        
        
        
    }
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    


}
