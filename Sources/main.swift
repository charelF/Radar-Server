import Foundation
import HeliumLogger
import Kitura
import Dispatch
import KituraContracts


public class RESTfulServer {

    let router = Router()
    var activities: [Activity] = []
    
    func initRoutes(){
        
        // GET a single activity via its id
        router.get("/activities", handler:getActivity)
        
        // GET all activities
        router.get("/activities", handler:getActivities)
        
        // PUT (update/create) a single activity via its id
        router.put("/activities", handler:putActivity)
    }
    
    func getActivities(completion:([Activity]?, RequestError?) -> Void) {
        completion(self.activities, nil)
    }
    
    func getActivity(id: String, completion:(Activity?, RequestError?) -> Void) {
        let result = self.activities.filter {$0.id == id}
        switch result.count {
        case 0:
            completion(nil, .notFound)
        case 1:
            completion(result[0], nil)
        default:
            completion(nil, .conflict)
        }
    }

    func putActivity(id: String, activity:Activity, completion:(Activity?, RequestError?) -> Void) {
        if self.activities.contains(activity) {
            // we will replace the activity with the new one we just received
            let index = self.activities.firstIndex(of: activity)!
            self.activities[index] = activity
            return completion(activity, nil)
        } else {
            self.activities.append(activity)
            return completion(activity, nil)
        }
    }
    
    public func run() throws {
        initRoutes()
        Kitura.addHTTPServer(onPort: 8081, with: router)
        Kitura.run()
    }
}

HeliumLogger.use()

do {
    let server = RESTfulServer()
    try server.run()
} catch let error {
    print(error.localizedDescription)
}
