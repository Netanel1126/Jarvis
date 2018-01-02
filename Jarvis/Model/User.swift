import Foundation

class User {
    let userID:String
    var name:String
    var questions:[Question]?
    
    init(userID:String,name:String, questions:[Question]) {
        self.userID = userID
        self.name = name
        self.questions = questions
    }
    
    init(userID:String,name:String) {
        self.userID = userID
        self.name = name
        self.questions = [Question]()
    }
    
    init(fromJson:[String:Any]) {
        self.userID = fromJson["userID"] as! String
        self.name = fromJson["name"] as! String
        self.questions = [Question]()
        
        let model = ModelFirebase()
        var questionId = fromJsom["questionId"] as! [String]
        
      /*  for(qId in questionId){
            model.getQuestionFromFirebase(byId: qId, callback: {
                
            })*/
        }
    }
}
