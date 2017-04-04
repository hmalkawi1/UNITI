//
//  DiaryViewController.swift
//  UNITI
//
//  Created by shawn noruzi on 2017-04-04.
//  Copyright © 2017 Shawn Noruzi. All rights reserved.
//

import UIKit

class DiaryViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var Table: UITableView!
   
    //our entries array
    var array1:[String] = []
    //no row has been selected yet
    var selectedRow:Int = -1
    //Send back editted text and save it - need variable newRowText for this
    var newRowText:String = ""
    //Required for Data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array1.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        //cell functionality - has a text label - include date as well in future perhaps?
        Cell.textLabel?.text = array1[indexPath.row]
        Cell.textLabel?.textColor = UIColor.white
        return Cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "newEntrySegue", sender: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //creating the add a new entry button
        let addNewEntryButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewEntry))
        
        
        //adding some new buttons for adding a new entry and editing an already existing one
        self.navigationItem.rightBarButtonItems = [addNewEntryButton,self.editButtonItem]

        loadData()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        //check to see if we have gone to detailed view first/edited it.
        if selectedRow == -1{
            return
        }
        array1[selectedRow] = newRowText
        //user deletes all text = entry in table view
        if newRowText == "" {
            array1.remove(at: selectedRow)
        }
        Table.reloadData()
        saveData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newEntryView:newEntryViewController=segue.destination as! newEntryViewController
        selectedRow = Table.indexPathForSelectedRow!.row
        //create reference to masterView
        newEntryView.masterView = self
        
        newEntryView.setText(t: array1[selectedRow])
    }
    
    func addNewEntry(){
        //whenever a new entry is adding it will have the form "Diary Entry #" where # = next diary entry row value
        let name:String = "Diary Entry \(array1.count+1)"
        
        //place it at the very top
        array1.insert(name, at: 0)
        let indexPath:IndexPath=IndexPath(row: 0, section: 0)
        Table.insertRows(at: [indexPath], with: .automatic)
        
        //select a row on a table
        Table.selectRow(at: indexPath, animated: true, scrollPosition: .none)
        
        //save text in the newEntry view 
        self.performSegue(withIdentifier: "newEntrySegue", sender: nil)
    }
    override func setEditing(_ editing: Bool, animated: Bool) {
        //when the user hits the edit icon the will be put into edit mode with red icons on the left handside
        super.setEditing(editing, animated: animated)
        //adding that functionality to the table
        Table.setEditing(editing,animated: animated)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //functionality for the edit button when selected
        array1.remove(at: indexPath.row)
        Table.deleteRows(at: [indexPath], with: .fade)
        saveData()
    }
    
    func saveData(){
        //saves to local storage
        UserDefaults.standard.set(array1, forKey: "Submit")
        //creating crash recovery
        UserDefaults.standard.synchronize()
    }
    
    func loadData(){
        //data is loaded from persistent storage
        if let loadedData = UserDefaults.standard.value(forKey: "Diary")as?[String]
        {array1=loadedData}
      //  Table.reloadData()
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
