
import UIKit

class FinishedGame_ViewController: UIViewController {

    @IBOutlet weak var winLose_Label: UILabel!
    var winLose: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        winLose_Label.text = winLose
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ReturnHome(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
