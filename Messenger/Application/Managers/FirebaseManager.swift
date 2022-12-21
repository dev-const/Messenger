import Foundation
import UIKit
import FirebaseCore
import FirebaseStorage
import FirebaseDatabase
import FirebaseFirestore

class FirebaseManager {
    static let shared = FirebaseManager()
    
    private func configureFB() -> Firestore {
        var db: Firestore!
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        return db
    }
    
    func getPost(collection: String, docName: String, completion: @escaping(Document?) -> Void) {
        let db = configureFB()
        db.collection(collection).document(docName).getDocument { (document, error) in
            guard error == nil else { completion(nil)
                return
            }
            let document = Document(field1: document?.get("field1") as! String, field2: document?.get("field2") as! String)
            completion(document)
        }
        
        func getImage(picImage: String, completion: @escaping (UIImage) -> Void) {
            let storage = Storage.storage()
            let reference = storage.reference()
            let pathRef = reference.child("avatars")
            
            var image: UIImage = UIImage(systemName: "person.badge.plus")!
            
//            let fileRef = pathRef.chi
        }
        
    }
}

