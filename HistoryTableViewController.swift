//
//  HistoryTableViewController.swift
//  UNITI
//
//  Created by wei yao on 2017-03-20.
//  Copyright © 2017 Shawn Noruzi. All rights reserved.
//

import UIKit



var list = [" "] // inital data for simple list

class HistoryTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    
    
   

    @IBOutlet weak var tableview: UITableView!
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int// defined # of rows in our table list
    
    {
    
       return(list.count) // count() functoin will return the size of the list
    
    
    
    }
    
    
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        
    {
    
    
    
        let cell = UITableViewCell(style: UITableViewCellStyle.default , reuseIdentifier: "cell")
        
        
        cell.textLabel?.text = list[indexPath.row]
        
        return(cell)
        
    
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)// delete function  with swip gesture
        
    
    
    {
        if editingStyle == UITableViewCellEditingStyle.delete
            
        {
            list.remove(at: indexPath.row)
            
            tableview.reloadData()
            
        }
    
    
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableview.reloadData()
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
