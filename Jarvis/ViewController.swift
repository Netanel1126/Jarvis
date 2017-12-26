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
        
        myScore.text = "Score :\(score)"
        
        questions.append(Question("The answer of 1 + 1 is:",["2"], "3", "11", "2", "4"));
        questions.append(Question("What is the capital of France?",["Paris"], "Pakistan", "Paris", "Egypt", "San Francisco"))
        questions.append(Question("What is the closest star to the sun?",["Mercury"], "Saturn", "Earth", "Mars", "Mercury"))
        questions.append(Question("Who was the first president of the USA?",["George Washington"], "Abraham Lincoln", "Winston Churchil", "Haim Weizman", "George Washington"))
        
        myQuestion.text = questions[0].myQuestion
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
            myQuestion.text = questions[questionLoction].myQuestion
            answer1.setTitle(questions[questionLoction].answer1, for: .normal)
            answer2.setTitle(questions[questionLoction].answer2, for: .normal)
            answer3.setTitle(questions[questionLoction].answer3, for: .normal)
            answer4.setTitle(questions[questionLoction].answer4, for: .normal)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

