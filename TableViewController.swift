//
//  TableViewController.swift
//  BoardGameTracker
//
//  Created by Zoran Lazic on 08/12/15.
//  Copyright © 2015 Zoran Lazic. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var boardGameArray: [BoardGame] = [BoardGame]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var boardGame = BoardGame(name: "Imperial Settlers", image: UIImage(named: "imperialsettlers"))
        boardGameArray.append(boardGame)
        
        boardGame = BoardGame(name: "Sheriff of Nottingham", image: UIImage(named: "sheriffofnottingham"))
        boardGame.rented = "Robin Hood"
        boardGameArray.append(boardGame)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boardGameArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! MyCell
        
        let boardGame = boardGameArray[indexPath.row]

        // Configure the cell...
        
        //cell.boardGameImageView.image = UIImage(named: boardGame.image)
        cell.boardGameName.text = boardGame.name
        if let image = boardGame.image {
            cell.boardGameImageView.image = image
        }
        
        if let rentedTo = boardGame.rented {
            cell.boardGameRentedLabel.text = "Rented to: \(rentedTo)"
        } else {
            cell.boardGameRentedLabel.text = ""
        }

        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDetail" {
            let detailVC: DetailViewController = segue.destinationViewController.childViewControllers.last as! DetailViewController
            
            // Get the cell that generated this segue.
            if let selectedGameCell = sender as? MyCell {
                let indexPath = tableView.indexPathForCell(selectedGameCell)!
                let selectedBoardGame = boardGameArray[indexPath.row]
                
                detailVC.boardGame = selectedBoardGame
                
            }
        }
    }
    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let boardGameSelected = boardGameArray[indexPath.row]
//        
//        let detailVC: DetailViewController = self.storyboard?.instantiateViewControllerWithIdentifier("DetailViewController") as! DetailViewController
//        
//        //detailVC.imageDetail = boardGameSelected.image
//        detailVC.nameDetail = boardGameSelected.name
//        
//        self.presentViewController(detailVC, animated: true, completion: nil)
//    }

    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }


    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            boardGameArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func unwindToBoardGameList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? AddViewController, boardGame = sourceViewController.boardGame {
            let newIndexPath = NSIndexPath(forRow: boardGameArray.count, inSection: 0)
            boardGameArray.append(boardGame)
            
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
        }
        
        if let sourceViewController = sender.sourceViewController as? DetailViewController, _ = sourceViewController.boardGame {
            tableView.reloadData()
        }
    }

}
