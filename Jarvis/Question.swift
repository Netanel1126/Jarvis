import Foundation


class Question{
    var myQuestion:String

    var correct_answer:[String]
    
    var answer1:String
    var answer2:String
    var answer3:String
    var answer4:String
    /*ToDo add audio and picter*/
    
    init(_ myQuetion:String,_ correct_answer:[String],_ answer1:String,_ answer2:String,_ answer3:String,_ answer4:String) {
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
