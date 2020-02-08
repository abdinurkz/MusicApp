import Foundation

struct GetShortAlbumResponse {
    let album: [AlbumShortResponse]
    init(json: JSON) throws {
        guard let albums = json["album"] as? [JSON] else { throw NetworkingError.badNetworkingStuff }
        let album = albums.map{ AlbumShortResponse(json: $0) }.compactMap{ $0 }
        self.album = album
    }
}
