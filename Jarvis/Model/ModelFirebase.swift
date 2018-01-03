import Foundation
import Firebase
import FirebaseDatabase

class ModelFirebase {
    let ref:DatabaseReference?
    
    init(){
        FirebaseApp.configure()
        ref = Database.database().reference()
    }
    
    func addQuestion(myQuestion:Question){
        let myRef = ref?.child("Questions").child(myQuestion.questionId)
        myRef?.setValue(myQuestion.toJson())
    }
    
    func getQuestionFromFirebase(byId:String,callback:@escaping (Question?)->Void){
        let myRef = ref?.child("Questions").child(byId)
        
        myRef?.observeSingleEvent(of: .value, with: { (snapshot) in
            if let val = snapshot.value as? [String:Any]{
                let question = Question(fromJson: val)
                callback(question)
            }else{
              callback(nil)
            }
        })
    }
    
    func getQuestionsFromFirebase(callback:@escaping ([Question]?)->Void){
        let myRef = ref?.child("Questions")
        myRef?.observeSingleEvent(of: .value, with: { (snapshot) in
            if let values = snapshot.value as? [String:[String:Any]]{
                var QuestionsArray = [Question]()
                for questionJson in values{
                    let question = Question(fromJson: questionJson.value)
                    QuestionsArray.append(question)
                }
                callback(QuestionsArray)
            }else{
                callback(nil)
            }
        })
    }
}
