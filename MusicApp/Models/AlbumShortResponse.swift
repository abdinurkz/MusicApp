import Foundation

struct AlbumShortResponse {
    
        let albumName: String
        let artistName: String
        let thumbnail: String
        let description: String
    
    
    init?(json: JSON) {
        guard let albumName = json["strAlbum"] as? String,
            let artistName = json["strArtist"] as? String,
            let thumbnail = json["strAlbumThumb"] as? String,
            let description = json["strDescriptionEN"] as? String
            
        
        else { return nil }
            
        
        self.albumName = albumName
        self.artistName = artistName
        self.thumbnail = thumbnail
        self.description = description
        
    }
    
}

