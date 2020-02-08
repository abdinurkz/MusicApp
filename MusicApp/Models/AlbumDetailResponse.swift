import Foundation

struct AlbumDetailResponse {
    
        let albumName: String
        let albumID: String
        let releasedYear: String
        let genre: String
    
    
    init?(json: JSON) {
        guard let albumName = json["strAlbum"] as? String,
            let albumID = json["idAlbum"] as? String,
            let releasedYear = json["intYearReleased"] as? String,
            let genre = json["strGenre"] as? String
            
        
        else { return nil }
            
        
        self.albumName = albumName
        self.albumID = albumID
        self.releasedYear = releasedYear
        self.genre = genre
        
    }
    
}

