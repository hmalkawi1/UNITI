//
//  ViewController.swift
//  NewDraft1
//
//  Created by Joe Xu on 3/11/17.
//  Copyright © 2017 UNITI. All rights reserved.
//

import UIKit

class MainViewController : UIViewController {

    
    private var img_background : UIImageView?;
    private var img_box : UIImageView?;
    private var lab_load : UILabel?;
    private var ai : UIActivityIndicatorView?;
    
    
    private var lab : UILabel?;
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        setElementInitVal();
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        
        
        
        UIView.animate(withDuration: 2, animations: {
            
            self.img_background?.alpha = 0.9;
            
            
            }, completion: { final in
                
                UIView.animate(withDuration: 1.7, delay: 0.0, options: [.autoreverse, .repeat], animations: {
                    
                    self.img_box?.alpha = 0.45;
                    
                    }, completion: { final in
                        
                })
                
                
        })
        
        
        UIView.animate(withDuration: 1.1, delay: 0.0, options: [], animations: {
            
            self.img_box?.frame = CGRect(x: 0.197333 * self.view.bounds.width, y: 0.6731634 * self.view.bounds.height, width: 0.613 * self.view.bounds.width, height: 0.0525 * self.view.bounds.height);
            
            }, completion: { final in
                
                
                let hideObj : UILabel = UILabel(frame: CGRect(x: 0.4130434 * (self.img_box?.bounds.width)!, y: 0.2 * (self.img_box?.bounds.height)!, width: 0.386956 * (self.img_box?.bounds.height)! * 10, height: 0.6 * (self.img_box?.bounds.height)!));
                hideObj.text = "i dont know why I need text";
                hideObj.font = UIFont(name: "systemFont", size: 18);
                hideObj.isHidden = true;
                self.img_box?.addSubview(hideObj);
                
                
                
                self.ai?.center = CGPoint(x: (hideObj.center.x) - 120, y: (hideObj.center.y));
                self.ai?.startAnimating();
                
                
                
                
                
                
                
                
                
                UIView.animate(withDuration: 0.9, delay: 0.0, usingSpringWithDamping: 0.35, initialSpringVelocity: 0.3, options: [], animations: {
                    
                    self.lab_load?.frame = CGRect(x: 0.4130434 * (self.img_box?.bounds.width)!, y: 0.2 * (self.img_box?.bounds.height)!, width: 0.386956 * (self.img_box?.bounds.height)! * 10, height: 0.6 * (self.img_box?.bounds.height)!);
                    
                    }, completion: { final in
                        
                        
                        
                        self.transNextView();
                        
                        
                });
                
        })
        
        
        
        
        
        
        
        
        
    }
    
    
    //  Helper Functions
    func setElementInitVal() -> Void {
    
        
        img_background = UIImageView(image: UIImage(named: "loading_background" ));
        img_background?.frame = self.view.bounds;
        img_background?.center = self.view.center;
        img_background?.alpha = 0.05;
        self.view.addSubview(img_background!);
        
        img_box = UIImageView(image: UIImage(named: "box"));
        img_box?.frame = CGRect(x: self.view.bounds.width / 2.0 , y: 0.6732 * self.view.bounds.height, width: 0.0, height: 0.0);
        img_box?.alpha = 0.9;
        self.img_background?.addSubview(img_box!);
        
        
        lab_load = UILabel();
        lab_load?.frame = CGRect(x: 0.4130434 * (self.img_box?.bounds.width)! + 100, y: 0.2 * (self.img_box?.bounds.height)!, width: 0.386956 * (self.img_box?.bounds.height)! * 3, height: 0.6 * (self.img_box?.bounds.height)!);
        lab_load?.font = UIFont(name: "systemFont", size: 18);
        lab_load?.text = "Loading";
        self.img_box?.addSubview(lab_load!);
        
        
        self.ai = UIActivityIndicatorView();
        self.img_box?.addSubview(ai!);
        
        
    
    }
    
    
    func initDataBase() -> Int {
        
        DataAccessPoint.loadData();
        
        //only for debug
        return 0;
    }
    
    
    func transNextView() -> Void {
        if self.initDataBase() == 0 {
            
            sleep(4);
            
            
            let st : UIStoryboard = UIStoryboard(name: "STMain", bundle:nil)
            
            let nst = st.instantiateViewController(withIdentifier: "StBd_list")
            
            self.present(nst, animated:true, completion:nil)
        }
        else{
            print("Something go wrong, bye bye");
            exit(0);
        }
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

