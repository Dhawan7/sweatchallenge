//
//  ViewController.swift
//  Sweat App
//
//  Created by SachTech on 10/10/19.
//  Copyright © 2019 SachTech. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var workoutList:[WorkoutModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWorkout()
        // Do any additional setup after loading the view.
    }

    func loadWorkout()
    {
        
        if let path = Bundle.main.path(forResource: "trainer-programs", ofType: "json"){
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! NSArray
                //let arry = jsonResult["results"] as! NSArray
                for d in jsonResult{
                    let data = d as! NSDictionary
                    let model = WorkoutModel(dict: data)
                    self.workoutList.append(model)
                }
                tableView.reloadData()
            } catch {
            }
        }
    }

}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "workoutCell") as! WorkoutTVC
        let workout = workoutList[indexPath.row]
        cell.workout = workout
        cell.attributeList = workout.attributes
        cell.tags = workout.tags
        cell.lblTrainerName.text = "with " + workout.trainer.name
        cell.lblWorkoutName.text = workout.name
        cell.setAtttribData(workout.attributes)
        cell.layoutIfNeeded()
        cell.trainerImgView.sd_setImage(with: URL(string: workout.trainer.imageUrl), completed: nil)
        
        return cell
    }
    
    
}

