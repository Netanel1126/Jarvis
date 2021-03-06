import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myQuestion: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    @IBOutlet weak var myScore: UILabel!
    var score = 0
    var questionLoction = 0
    var questions:[Question] =  [Question]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let model = ModelFirebase()
        myScore.text = "Score :\(score)"
        
        questions.append(Question("First","The answer of 1 + 1 is:","2", "3", "11", "2", "4"));
        
        model.addQuestion(myQuestion: Question("First","The answer of 1 + 1 is:","2", "3", "11", "2", "4"));
        print("afterRight")
        questions.append(Question("2","What is the capital of France?","Paris", "Pakistan", "Paris", "Egypt", "San Francisco"))
        questions.append(Question("3","What is the closest star to the sun?","Mercury", "Saturn", "Earth", "Mars", "Mercury"))
        questions.append(Question("4","Who was the first president of the USA?","George Washington", "Abraham Lincoln", "Winston Churchil", "Haim Weizman", "George Washington"))
         print("afterEnter")
        myQuestion.text = questions[0].content
        answer1.setTitle(questions[0].answer1, for: .normal)
        answer2.setTitle(questions[0].answer2, for: .normal)
        answer3.setTitle(questions[0].answer3, for: .normal)
        answer4.setTitle(questions[0].answer4, for: .normal)
    }
    
    @IBAction func validate(_ sender: UIButton) {
        if questions[questionLoction].checkIfCorrect(answer: (sender.titleLabel?.text)!){
            score += 1;
            myScore.text = "Score :\(score * 100)"
        }
        if (questionLoction != questions.count - 1){
            questionLoction += 1;
            myQuestion.text = questions[questionLoction].content
            answer1.setTitle(questions[questionLoction].answer1, for: .normal)
            answer2.setTitle(questions[questionLoction].answer2, for: .normal)
            answer3.setTitle(questions[questionLoction].answer3, for: .normal)
            answer4.setTitle(questions[questionLoction].answer4, for: .normal)
        }else{
            self.performSegue(withIdentifier: "GameFinsed", sender:nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "GameFinsed"){
             let destViewController = segue.destination as! FinishedGame_ViewController
            if (score > 3){
                destViewController.winLose = "Win!!!"
            }else{
                destViewController.winLose = "Lose!!!"

            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

