//
//  STListViewTableViewController.swift
//  NewDraft1
//
//  Created by Joe Xu on 3/12/17.
//  Copyright © 2017 UNITI. All rights reserved.
//

import UIKit

class STListViewTableViewController: UITableViewController {

    
    var img_head : UIImageView?;
    
    @IBOutlet var tv: UITableView!
    
    static var currTag : Tags?;
    
    
    var data = DataAccessPoint.data!.tags;
    
    
    override func viewWillAppear(_ animated: Bool) {
        /*
        self.tv.contentInset = UIEdgeInsets(top: (self.img_head?.bounds.height)!,left: 0,bottom: 0,right: 0)
        */
        
        //self.tv.contentInset = UIEdgeInsets(top: 200 ,left: 0,bottom: 0,right: 0)
        self.view.backgroundColor = UIColor.white;
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.count;
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCellTableViewCell", for: indexPath) as! ListCellTableViewCell

        
        cell.lab_tag.text = data[indexPath.row];
        
        
        
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIImageView? {
        
        img_head = UIImageView();
        /*
        img_head?.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 240.0 / 667 * self.view.bounds.height);
        */
        
        img_head? = UIImageView(image: UIImage(named: "listview_headPhoto")!)
        img_head?.backgroundColor = UIColor.brown;
        
        return img_head!;
        
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 240.0 / 667 * self.view.bounds.height;
    }
    
    
    
    @IBAction func btn_append_click(_ sender: UIButton) {
        
        let st : UIStoryboard = UIStoryboard(name: "STMain", bundle:nil)
        
        let nst = st.instantiateViewController(withIdentifier: "StBd_append")
        
        self.present(nst, animated:true, completion:nil)
        
        
    }
    
    
    
    
    
    
    
}
