import Foundation

struct GetTrackResponse {
    let track: [TrackDetailResponse]
    init(json: JSON) throws {
        guard let tracks = json["track"] as? [JSON] else { throw NetworkingError.badNetworkingStuff }
        let track = tracks.map{ TrackDetailResponse(json: $0) }.compactMap{ $0 }
        self.track = track
    }
}
