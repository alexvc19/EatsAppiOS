//
//  FIRFirestoreService.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 19/12/20.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class FIRFirestoreService{
    
    private init() {}
    static let shared = FIRFirestoreService()
    
    private func reference(to collectionReference: FIRCollectionReference)-> CollectionReference{
        return Firestore.firestore().collection(collectionReference.rawValue)
    }
    
    func create<T: Encodable>(for encodebleObject: T, in collectionReference: FIRCollectionReference){
        do {
            let json = try encodebleObject.toJson(excluding: ["id"])
            
            reference(to: .users).addDocument(data: json)
            
        }catch {
            print(error)
        }
        
        //let parameters: [String: Any] = ["name": "Alexander", "phone": "312", "password": "q"]
        //let userRef = Firestore.firestore().collection("users")
        
        //userRef.addDocument(data: parameters)
    }
    func read<T: Decodable>(from collectionReference: FIRCollectionReference, returning objectType: T.Type, completion: @escaping ([T]) -> Void){
        
        reference(to: .photos).addSnapshotListener { (query, _) in
            guard let query = query else {return}
            
            do {
                var objects = [T]()
                for doc in query.documents{
                    let object = try doc.decode(as: objectType.self)
                    objects.append(object)
                }
                
                completion(objects)
                
            } catch{
                //print(error)
            }
            
        }
        reference(to: .categories).addSnapshotListener { (docum, _) in
            guard let docum = docum else {return}
            
            do {
                var objec = [T]()
                for doc in docum.documents{
                    let object = try doc.decode(as: objectType.self)
                    objec.append(object)
                }
                
                completion(objec)
                
            } catch{
                //print(error)
            }
            
        }
        
    }
    func update(){
     
        reference(to: .users).document("fbabaFf8vkqJz3AlgWLu").setData(["name": "mario", "phone": "123", "password": "qwerty"])
    }
    func delete(){
        let userRef = Firestore.firestore().collection("users")
        
        userRef.document("fbabaFf8vkqJz3AlgWLu").delete()
    }
}

