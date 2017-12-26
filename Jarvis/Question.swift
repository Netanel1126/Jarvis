import Foundation


class Question{
    var myQuestion:String

    var correct_answer:[String]
    
    var answer1:String
    var answer2:String
    var answer3:String
    var answer4:String
    /*ToDo add audio and picter*/
    
    init(myQuetion:String,correct_answer:[String],answer1:String,answer2:String,answer3:String,answer4:String) {
        self.myQuestion = myQuetion
        self.correct_answer = correct_answer
        self.answer1 = answer1
        self.answer2 = answer2
        self.answer3 = answer3
        self.answer4 = answer4
 }
    
    func checkIfCorrect(answer : String) ->Bool{
        if correct_answer.contains(answer) {
            return true
        }
        
        return false
    }
}
