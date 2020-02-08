import Foundation
import Alamofire

typealias JSON = [String:Any]

class ApiManager: Codable {
    
    static let shared = ApiManager()
    private init() {}
    
    private let endpoint = "https://www.theaudiodb.com/api/v1/json/1/"
    
    
    func getArtists(artistName: String, success successBlock: @escaping  (GetArtistResponse) -> Void, onError: @escaping () -> Void){
        Alamofire.request("\(endpoint)search.php", parameters: ["s": artistName]).responseJSON { response in
            switch response.result {
            case .success(let value):
                guard let json = value as? JSON else {return}
                do {
                    let getArtistResponse = try GetArtistResponse(json: json)
                    successBlock(getArtistResponse)
                }catch {}
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func getTopTracks(artistName: String, success successBlock: @escaping  (GetTrackResponse) -> Void, onError: @escaping () -> Void){
        Alamofire.request("\(endpoint)track-top10.php", parameters: ["s": artistName]).responseJSON { response in
            switch response.result {
            case .success(let value):
                guard let json = value as? JSON else {return}
                do {
                    let getTrackResponse = try GetTrackResponse(json: json)
                    successBlock(getTrackResponse)
                }catch {}
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func getAlbums(artistName: String, success successBlock: @escaping  (GetAlbumResponse) -> Void, onError: @escaping () -> Void){
        Alamofire.request("\(endpoint)searchalbum.php", parameters: ["s": artistName]).responseJSON { response in
            switch response.result {
            case .success(let value):
                guard let json = value as? JSON else {return}
                do {
                    let getAlbumResponse = try GetAlbumResponse(json: json)
                    successBlock(getAlbumResponse)
                }catch {}
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func getMusicVideos(artistID: String, success successBlock: @escaping  (GetMusicVideoResponse) -> Void, onError: @escaping () -> Void){
        Alamofire.request("\(endpoint)mvid.php", parameters: ["i": artistID]).responseJSON { response in
            switch response.result {
            case .success(let value):
                guard let json = value as? JSON else {return}
                do {
                    let getMusicVideoResponse = try GetMusicVideoResponse(json: json)
                    successBlock(getMusicVideoResponse)
                }catch {}
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func getAlbumTracks(albumID: String, success successBlock: @escaping  (GetTrackResponse) -> Void, onError: @escaping () -> Void){
        Alamofire.request("\(endpoint)track.php", parameters: ["m": albumID]).responseJSON { response in
            switch response.result {
            case .success(let value):
                guard let json = value as? JSON else {return}
                do {
                    let getTrackResponse = try GetTrackResponse(json: json)
                    successBlock(getTrackResponse)
                }catch {}
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func getAlbumByName(albumName: String, success successBlock: @escaping  (GetShortAlbumResponse) -> Void, onError: @escaping () -> Void){
        Alamofire.request("\(endpoint)searchalbum.php", parameters: ["a": albumName]).responseJSON { response in
            switch response.result {
            case .success(let value):
                guard let json = value as? JSON else {return}
                do {
                    let getAlbumResponse = try GetShortAlbumResponse(json: json)
                    successBlock(getAlbumResponse)
                }catch {}
            case .failure(let error):
                print(error)
            }
        }
    }
    

}
