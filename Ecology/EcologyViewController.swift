//
//  EcologyViewController.swift
//  HackUCSC2015
//
//  Created by Arjun Gopisetty on 1/11/15.
//  Copyright (c) 2015 HackUCSC2015Team. All rights reserved.
//
import Foundation
import UIKit

class EcologyViewController: ResponsiveTextFieldViewController {
    

    @IBOutlet var schoolGroupLabel: UILabel!
    @IBOutlet var phSlider: UISlider!
    @IBOutlet var otterCount: UITextField!
    @IBOutlet var phValue: UITextField!
    var GroupName = String()
    var SchoolName = String()
    var otterButton = 0
    @IBAction func otterButton(sender: AnyObject) {
        otterButton++
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        phValue.text = "7.00"
        //print(GroupName + "hi")
        schoolGroupLabel.text = "School: " + SchoolName + "  Group: " + GroupName
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderSlid(sender: UISlider) {
        let temp = NSString(format: "%.2f", sender.value)
        phValue.text = temp
    }
    func gatherAllData(){
        var aDictionary = [String : String]()
        var bDictionary = [String : String]()
        var cDictionary = [String : String]()
        var dDictionary = [String : String]()
        aDictionary["seawater_ph"] = phValue.text
        aDictionary["otter_count"] = otterCount.text
        aDictionary["emeasurement_time"] = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .NoStyle, timeStyle: .ShortStyle)
        aDictionary["emeasurement_date"] = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .ShortStyle, timeStyle: .NoStyle)
        bDictionary["type"] = "ecology"
        cDictionary["group"] = GroupName
        dDictionary["id"] = "some id"
        //var myNewDictArray: [[String:String]] = []
        //myNewDictArray.append(aDictionary)
        //myNewDictArray.append(bDictionary)
        //myNewDictArray.append(cDictionary)
        sharedData().setObject(aDictionary, forKey: "data")
        sharedData().addEntriesFromDictionary(bDictionary)
        sharedData().addEntriesFromDictionary(cDictionary)
        sharedData().addEntriesFromDictionary(dDictionary)

        //bData().setObject(sharedData(), forKey: "group_data")
        //cData().setObject(bData(), forKey: "data")
    }
    
   
    @IBAction func saveData(sender: AnyObject) {
        gatherAllData()
        println(sharedData())
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var DestVC: SubmitDataViewController = segue.destinationViewController as SubmitDataViewController
        DestVC.groupName = GroupName
    }


}
