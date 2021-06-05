//
//  HomeModel.swift
//  chat
//
//  Created by 현경 on 2021/06/05.
//

import SwiftUI
import Firebase

class HomeModel: ObservableObject {
    
    @Published var txt = ""
    @Published var msgs : [MsgModel] = []
    @AppStorage("current_user") var user = ""
    let ref = Firestore.firestore()
    
    init() {
        readAllMsgs()
    }
    
    func onAppear() {
        // checking whether user is joined already
        if user == ""{
            // join alert
            UIApplication.shared.windows.first?.rootViewController?.present(alertView(), animated: true)
        }
    }
    
    func alertView()->UIAlertController{
        let alert = UIAlertController(title: "Joined Chat", message: "Enter Nick Name", preferredStyle: .alert)
        
        alert.addTextField { (txt) in
            txt.placeholder = "hyeon"
        }
        
        let join = UIAlertAction(title: "Join", style: .default){ (_) in
            
            // checking for empty click
            let user = alert.textFields![0].text ?? ""
            
            if user != ""{
                self.user = user
                return
            }
            
            // repromiting alert view
            UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
        }
        
        alert.addAction(join)
        
        return alert
    }
    
    func readAllMsgs(){
        ref.collection("Msgs").order(by: "timeStamp", descending: false).addSnapshotListener { (snap, err) in
            if err != nil {
                print(err!.localizedDescription)
                return
            }
            guard let data = snap else{return}
            
            data.documentChanges.forEach{ (doc) in
                // adding when data is added
                if doc.type == .added{
                    let msg = try! doc.document.data(as: MsgModel.self)!
                    
                    DispatchQueue.main.async {
                        self.msgs.append(msg)
                    }
                }
            }
        }
    }
    func writeMsg(){
        let msg = MsgModel(msg: txt, user: user, timeStamp: Date())
        
        let _ = try! ref.collection("Msgs").addDocument(from: msg) { (err) in
            
            if err != nil {
                print(err!.localizedDescription)
                return
            }
            
            self.txt = ""
        }
    }
}
