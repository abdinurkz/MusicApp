import Foundation

struct GetArtistResponse {
    let artist: [ArtistDetailResponse]
    init(json: JSON) throws {
        guard let artists = json["artists"] as? [JSON] else { throw NetworkingError.badNetworkingStuff }
        let artist = artists.map{ ArtistDetailResponse(json: $0) }.compactMap{ $0 }
        self.artist = artist
    }
}
