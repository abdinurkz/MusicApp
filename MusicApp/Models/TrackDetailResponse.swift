import Foundation

struct TrackDetailResponse {
    
        let trackName: String
        let albumName: String
        let duration: String
        let genre: String
        let mood: String
        let thumb: String
    
    init?(json: JSON) {
        guard let trackName = json["strTrack"] as? String,
            let albumName = json["strAlbum"] as? String,
            let duration = json["intDuration"] as? String,
            let genre = json["strGenre"] as? String,
            let mood = json["strMood"] as? String,
            let thumb = json["strTrackThumb"] as? String
            
        
        else { return nil }
            
        
        self.trackName = trackName
        self.albumName = albumName
        self.duration = duration
        self.genre = genre
        self.mood = mood
        self.thumb = thumb
    }
    
}

