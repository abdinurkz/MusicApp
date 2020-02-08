import Foundation

struct GetAlbumResponse {
    let album: [AlbumDetailResponse]
    init(json: JSON) throws {
        guard let albums = json["album"] as? [JSON] else { throw NetworkingError.badNetworkingStuff }
        let album = albums.map{ AlbumDetailResponse(json: $0) }.compactMap{ $0 }
        self.album = album
    }
}
