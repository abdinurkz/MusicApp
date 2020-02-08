import Foundation

struct MusicVideoResponse {
    
        let trackName: String
        let thumbnail: String
        let link: String
    
    
    init?(json: JSON) {
        guard let trackName = json["strTrack"] as? String,
            let thumbnail = json["strTrackThumb"] as? String,
            let link = json["strMusicVid"] as? String
            
        
        else { return nil }
            
        
        self.trackName = trackName
        self.thumbnail = thumbnail
        self.link = link
        
    }
    
}

