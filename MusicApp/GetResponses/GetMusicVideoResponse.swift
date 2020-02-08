import Foundation

struct GetMusicVideoResponse {
    let musicVideo: [MusicVideoResponse]
    init(json: JSON) throws {
        guard let videos = json["mvids"] as? [JSON] else { throw NetworkingError.badNetworkingStuff }
        let video = videos.map{ MusicVideoResponse(json: $0) }.compactMap{ $0 }
        self.musicVideo = video
    }
}
