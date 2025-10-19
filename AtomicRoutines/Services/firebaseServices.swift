//
//  firebaseServices.swift
//  AtomicRoutines
//
//  Created by Najabat Sofiyeva on 19.10.25.
//
import FirebaseFirestore
import FirebaseAuth


class RoutineManager {
        private let db = Firestore.firestore()
        
        static let shared = RoutineManager()
        private init() {}
        
        func updateTodayRoutine(tasks: [RoutineRow]) {
            guard let uid = Auth.auth().currentUser?.uid else { return }
            let todayString = DateFormatter.yyyyMMdd.string(from: Date())
            let routineDocRef = db.collection("users").document(uid).collection("routines").document(todayString)
            
            let data = tasks.map { ["title": $0.title, "isDone": $0.isDone] }
            routineDocRef.setData(["tasks": data]) 
        }
    
    
        func loadRoutine(for date: Date, completion: @escaping ([RoutineRow]) -> Void) {
               guard let uid = Auth.auth().currentUser?.uid else { return }
               
               let dateString = DateFormatter.yyyyMMdd.string(from: date)
               let routineDocRef = db.collection("users").document(uid)
                   .collection("routines")
                   .document(dateString)
               
               routineDocRef.getDocument { snapshot, error in
                   if let snapshot = snapshot, snapshot.exists {
                       if let data = snapshot.data(), let tasksData = data["tasks"] as? [[String: Any]] {
                           let tasks = tasksData.compactMap { dict -> RoutineRow? in
                               guard let title = dict["title"] as? String,
                                     let isDone = dict["isDone"] as? Bool else { return nil }
                               return RoutineRow(isDone: isDone, title: title)
                           }
                           completion(tasks) 
                       } else {
                           print("No schedule")
                           completion([])
                       }
                   } else {
                       print("No schedule")
                       completion([])
                   }
               }
           }
       }



extension DateFormatter {
    static let yyyyMMdd: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        return df
    }()
}
