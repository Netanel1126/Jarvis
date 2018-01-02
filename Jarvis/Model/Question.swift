import Foundation


class Question {
    let questionId:String
    var content:String
    var correct_answer:String
    
    var answer1:String
    var answer2:String
    var answer3:String
    var answer4:String
    /*ToDo add audio and picter*/
    
    init(fromJson: [String:Any]) {
        self.questionId = fromJson["questionId"] as! String
        self.content = fromJson["content"] as! String
        self.answer1 = fromJson["answer1"] as! String
        self.answer2 = fromJson["answer2"] as! String
        self.answer3 = fromJson["answer3"] as! String
        self.answer4 = fromJson["answer4"] as! String
        self.correct_answer = fromJson["correct_answer"] as! String
    }
    
    init(_ questionId:String, _ myQuestion:String,_ correct_answer:String,_ answer1:String,_ answer2:String,_ answer3:String,_ answer4:String) {
        self.content = myQuestion
        self.correct_answer = correct_answer
        self.answer1 = answer1
        self.answer2 = answer2
        self.answer3 = answer3
        self.answer4 = answer4
        self.questionId = questionId
    }
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["questionId"] = questionId
        json["content"] = content
        json["answer1"] = answer1
        json["answer2"] = answer2
        json["answer3"] = answer3
        json["answer4"] = answer4
        json["correct_answer"] = correct_answer
        return json
    }
    
    func checkIfCorrect(answer : String) ->Bool{
        if correct_answer.contains(answer) {
            return true
        }
        
        return false
    }
}
