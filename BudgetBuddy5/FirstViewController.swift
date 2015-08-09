//
//  FirstViewController.swift
//  BudgetBuddy5
//
//  Created by Oshani on 8/9/15.
//  Copyright (c) 2015 Oshani Seneviratne. All rights reserved.
//

import UIKit

class FirstViewController: XLFormViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.initializeForm()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initializeForm()
    }
    
    func initializeForm() {
        
        let form : XLFormDescriptor
        var section : XLFormSectionDescriptor
        var row : XLFormRowDescriptor
        
        form = XLFormDescriptor(title: "My Budget")
        form.assignFirstResponderOnShow = true
        
        section = XLFormSectionDescriptor.formSectionWithTitle("My Budget")
        //section.footerTitle = "This is a long text that will appear on section footer"
        form.addFormSection(section)
        
        // Eating
        row = XLFormRowDescriptor(tag: Tags.Eating.rawValue, rowType: XLFormRowDescriptorTypeText, title: "Eating : ")
        row.required = true
        row.value = "$\(remainingValues[Tags.Eating]!) remaining out of $\(initialValues[Tags.Eating]!)"
        section.addFormRow(row)
        
        // Drinking
        row = XLFormRowDescriptor(tag: Tags.Drinking.rawValue, rowType: XLFormRowDescriptorTypeText, title: "Drinking : ")
        row.value = "$\(remainingValues[Tags.Drinking]!) remaining out of $\(initialValues[Tags.Drinking]!)"
        row.required = true
        section.addFormRow(row)
        
        // Shopping
        row = XLFormRowDescriptor(tag: Tags.Shopping.rawValue, rowType: XLFormRowDescriptorTypeText, title: "Shopping : ")
        row.value = "$\(remainingValues[Tags.Shopping]!) remaining out of $\(initialValues[Tags.Shopping]!)"
        row.required = true
        section.addFormRow(row)
        
        section = XLFormSectionDescriptor.formSectionWithTitle("Time Period")
        form.addFormSection(section)
        
        // Starts
        row = XLFormRowDescriptor(tag: "start", rowType: XLFormRowDescriptorTypeDateTimeInline, title: "Started")
        row.required = true
        row.value = dates[Tags.StartDateTime]
        section.addFormRow(row)
        
        // Ends
        row = XLFormRowDescriptor(tag: "end", rowType: XLFormRowDescriptorTypeDateTimeInline, title: "Ends")
        row.required = true
        row.value = dates[Tags.EndDateTime]
        section.addFormRow(row)

        
        self.form = form
        
        
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Save, target: self, action: "savePressed:")
        
        println(events.count)
        
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        let formVals = self.form.formValues()
        if (formVals[Tags.Eating.rawValue] as! String).toInt() != nil{
            initialValues[Tags.Eating] = (formVals[Tags.Eating.rawValue] as! String).toInt()
        }
        if (formVals[Tags.Drinking.rawValue] as! String).toInt() != nil{
            initialValues[Tags.Drinking] = (formVals[Tags.Drinking.rawValue] as! String).toInt()
        }
        if (formVals[Tags.Shopping.rawValue] as! String).toInt()  != nil{
            initialValues[Tags.Shopping] = (formVals[Tags.Shopping.rawValue] as! String).toInt()
        }
        
        dates[Tags.StartDateTime] = (formVals[Tags.StartDateTime.rawValue] as! NSDate)
        dates[Tags.EndDateTime] = (formVals[Tags.EndDateTime.rawValue] as! NSDate)
        
        println(initialValues)
        println(dates)
   }
    
    func savePressed(button: UIBarButtonItem)
    {
        let validationErrors : Array<NSError> = self.formValidationErrors() as! Array<NSError>
        if (validationErrors.count > 0){
            self.showFormValidationError(validationErrors.first)
            return
        }
        self.tableView.endEditing(true)
        let alertView = UIAlertView(title: "Valid Form", message: "No errors found", delegate: self, cancelButtonTitle: "OK")
        alertView.show()

    }
    
    
}
