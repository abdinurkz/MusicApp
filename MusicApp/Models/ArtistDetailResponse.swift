import Foundation

struct ArtistDetailResponse {
    
        let artistName: String
        let artistID: String
        let bornYear: String
        let genre: String
        let website: String
        let biography: String
        let thumb: String
        let logo: String
    
    init?(json: JSON) {
        guard let artistName = json["strArtist"] as? String,
            let artistID = json["idArtist"] as? String,
            let bornYear = json["intBornYear"] as? String,
            let genre = json["strGenre"] as? String,
            let website = json["strWebsite"] as? String,
            let biography = json["strBiographyEN"] as? String,
            let thumb = json["strArtistThumb"] as? String,
            let logo = json["strArtistLogo"] as? String
            
        
            else { return nil }
            
        
        self.artistName = artistName
        self.artistID = artistID
        self.bornYear = bornYear
        self.genre = genre
        self.website = website
        self.biography = biography
        self.thumb = thumb
        self.logo = logo
    }
    
}

