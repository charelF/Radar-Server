import Foundation
import HeliumLogger
import Kitura
import Dispatch

//struct Song: Codable {
//    let title: String
//    let artist: String
//}
//
//struct Playlist: Codable{
//    let name: String
//    let songlist: [String]
//}
//
//
//var songs = ["0000-0001": Song(title:"Bad Romance", artist:"Lady Gaga"),
//            "0000-0002": Song(title:"Poker Face", artist:"Lady Gaga"),
//            "0000-0003": Song(title:"Shallow", artist:"Lady Gaga"),
//            "0000-0004": Song(title:"I See Fire", artist:"Ed Sheeran"),
//            "0000-0005": Song(title:"Perfect", artist:"Ed Sheeran"),
//            "0000-0006": Song(title:"Shape Of You", artist:"Ed Sheeran"),
//            "0000-0007": Song(title:"About A Girl", artist:"Nirvana"),
//            "0000-0008": Song(title:"Come As You Are", artist:"Nirvana"),
//            "0000-0009": Song(title:"Smells Like Teen Spirit", artist:"Nirvana"),
//            "0000-0010": Song(title:"American Idiot", artist:"Green Day"),
//            "0000-0011": Song(title:"Basket Case", artist:"Green Day"),
//            "0000-0012": Song(title:"Boulevard of Broken Dreams", artist:"Green Day"),
//            "0000-0013": Song(title:"Enter Sandman", artist:"Metallica"),
//            "0000-0014": Song(title:"Master Of Puppets",artist:"Metallica"),
//            "0000-0015": Song(title:"Nothing Else Matters", artist:"Metallica")
//]
//
//var playlists = ["0000-0123": Playlist(name:"SamplePlaylist", songlist:["0000-0001","0000-0003","0000-0004","0000-0007","0000-0010","0000-0015"])]
//
//
//
//public class RESTfulServer {
//
//    let router = Router()
//
//    func initRoutes(){
//        router.get("/songs", handler:getSongs)
//        router.get("/songs", handler:getSong)
//        router.post("/playlists", handler: createPlaylist)
//        router.put("/playlists", handler: updatePlaylist)
//        router.get("/playlists", handler: getPlaylist)
//    }
//
//    func getSongs(completion:([Song]?,RequestError?) -> Void) {
//
//        let songValues = [Song](songs.values)
//
//        completion(songValues,nil)
//    }
//
//     func getSong(id: String, completion:(Song?, RequestError?) -> Void){
//
//        guard let song = songs[id] else {
//            return completion(nil, .notFound)
//        }
//        completion(song,nil)
//    }
//
//    func createPlaylist(playlist: Playlist, completion:(String?, Playlist?,RequestError?) -> Void ){
//        let uuid = UUID().uuidString
//        let pl = Playlist(name:playlist.name , songlist: playlist.songlist)
//        playlists[uuid] = pl
//        completion(uuid,pl,nil)
//
//    }
//
//   func updatePlaylist(id: String, updatedPlaylist:Playlist, completion:(Playlist?, RequestError?) -> Void){
//        guard playlists[id] != nil else{
//            return completion(nil, .notFound)
//        }
//        playlists[id] = updatedPlaylist
//
//        completion(playlists[id],nil)
//
//
//    }
//
//    func getPlaylist(id: String, completion:(Playlist?, RequestError?) -> Void){
//        guard let playlist = playlists[id] else {
//                    return completion(nil, .notFound)
//                }
//                completion(playlist,nil)
//
//    }
//
//
//    public func run() throws {
//        initRoutes()
//        Kitura.addHTTPServer(onPort: 8080, with: router)
//        Kitura.run()
//    }
//
//}
//
//HeliumLogger.use()
//
//do {
//    let server = RESTfulServer()
//    try server.run()
//} catch let error {
//    print(error.localizedDescription)
//}


//var activities = testData


public class RESTfulServer {

    let router = Router()

    func initRoutes(){
        router.get("/activities", handler:getActivities)
//        router.get("/songs", handler:getSong)
//        router.post("/playlists", handler: createPlaylist)
//        router.put("/playlists", handler: updatePlaylist)
//        router.get("/playlists", handler: getPlaylist)
    }
    
    // we use a closure here: https://docs.swift.org/swift-book/LanguageGuide/Closures.html
    // completion is a closure/function that takes an optional array of activities and an optional error and returns nothing. it is called by getActivities upon completion of the code in getActivities
    func getActivities(completion:([Activity]?, RequestError?) -> Void) {
        
        //sleep(5) // for testing
        // while this clearly affects a request on the web (localhost:8080/activities)
        // it does not seem to affect the call in the app itself... Possibly
        // ios does some kind of optimisations?...
        
        let activities = testData
        
        // no error has happended so we call with nil and the retrieved activities
        completion(activities, nil)
        
    }
//
//    func getSongs(completion:([Song]?,RequestError?) -> Void) {
//
//        let songValues = [Song](songs.values)
//
//        completion(songValues,nil)
//    }
//
//     func getSong(id: String, completion:(Song?, RequestError?) -> Void){
//
//        guard let song = songs[id] else {
//            return completion(nil, .notFound)
//        }
//        completion(song,nil)
//    }
//
//    func createPlaylist(playlist: Playlist, completion:(String?, Playlist?,RequestError?) -> Void ){
//        let uuid = UUID().uuidString
//        let pl = Playlist(name:playlist.name , songlist: playlist.songlist)
//        playlists[uuid] = pl
//        completion(uuid,pl,nil)
//
//    }
//
//   func updatePlaylist(id: String, updatedPlaylist:Playlist, completion:(Playlist?, RequestError?) -> Void){
//        guard playlists[id] != nil else{
//            return completion(nil, .notFound)
//        }
//        playlists[id] = updatedPlaylist
//
//        completion(playlists[id],nil)
//
//
//    }
//
//    func getPlaylist(id: String, completion:(Playlist?, RequestError?) -> Void){
//        guard let playlist = playlists[id] else {
//                    return completion(nil, .notFound)
//                }
//                completion(playlist,nil)
//
//    }
       

    public func run() throws {
        initRoutes()
        Kitura.addHTTPServer(onPort: 8080, with: router)
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




// accessing localhost:8080/songs, we can see the jSON:

//[{"title":"About A Girl","artist":"Nirvana"},{"title":"Bad Romance","artist":"Lady Gaga"},{"title":"Shallow","artist":"Lady Gaga"},{"title":"Boulevard of Broken Dreams","artist":"Green Day"},{"title":"Nothing Else Matters","artist":"Metallica"},{"title":"Poker Face","artist":"Lady Gaga"},{"title":"I See Fire","artist":"Ed Sheeran"},{"title":"Smells Like Teen Spirit","artist":"Nirvana"},{"title":"Come As You Are","artist":"Nirvana"},{"title":"American Idiot","artist":"Green Day"},{"title":"Shape Of You","artist":"Ed Sheeran"},{"title":"Perfect","artist":"Ed Sheeran"},{"title":"Enter Sandman","artist":"Metallica"},{"title":"Master Of Puppets","artist":"Metallica"},{"title":"Basket Case","artist":"Green Day"}]
