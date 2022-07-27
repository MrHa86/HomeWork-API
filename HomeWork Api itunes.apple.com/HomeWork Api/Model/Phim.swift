//
//  Phim.swift
//  HomeWork Api
//
//  Created by Vu Nam Ha on 26/07/2022.
//

//
import Foundation
import SwiftyJSON

struct Phim {

    let resultCount: Int?
    let results: [Results]?

    init(_ json: JSON) {
        resultCount = json["resultCount"].intValue
        results = json["results"].arrayValue.map { Results($0) }
    }

}

struct Results {

    let wrapperType: String?
    let kind: String?
    let collectionId: Int?
    let trackId: Int?
    let artistName: String?
    let collectionName: String?
    let trackName: String?
    let collectionCensoredName: String?
    let trackCensoredName: String?
    let collectionArtistId: Int?
    let collectionArtistViewUrl: String?
    let collectionViewUrl: String?
    let trackViewUrl: String?
    let previewUrl: String?
    let artworkUrl30: String?
    let artworkUrl60: String?
    let artworkUrl100: String?
    let collectionPrice: Double?
    let trackPrice: Double?
    let trackRentalPrice: Double?
    let collectionHdPrice: Double?
    let trackHdPrice: Double?
    let trackHdRentalPrice: Double?
    let releaseDate: String?
    let collectionExplicitness: String?
    let trackExplicitness: String?
    let discCount: Int?
    let discNumber: Int?
    let trackCount: Int?
    let trackNumber: Int?
    let trackTimeMillis: Int?
    let country: String?
    let currency: String?
    let primaryGenreName: String?
    let contentAdvisoryRating: String?
    let longDescription: String?
    let hasITunesExtras: Bool?

    init(_ json: JSON) {
        wrapperType = json["wrapperType"].stringValue
        kind = json["kind"].stringValue
        collectionId = json["collectionId"].intValue
        trackId = json["trackId"].intValue
        artistName = json["artistName"].stringValue
        collectionName = json["collectionName"].stringValue
        trackName = json["trackName"].stringValue
        collectionCensoredName = json["collectionCensoredName"].stringValue
        trackCensoredName = json["trackCensoredName"].stringValue
        collectionArtistId = json["collectionArtistId"].intValue
        collectionArtistViewUrl = json["collectionArtistViewUrl"].stringValue
        collectionViewUrl = json["collectionViewUrl"].stringValue
        trackViewUrl = json["trackViewUrl"].stringValue
        previewUrl = json["previewUrl"].stringValue
        artworkUrl30 = json["artworkUrl30"].stringValue
        artworkUrl60 = json["artworkUrl60"].stringValue
        artworkUrl100 = json["artworkUrl100"].stringValue
        collectionPrice = json["collectionPrice"].doubleValue
        trackPrice = json["trackPrice"].doubleValue
        trackRentalPrice = json["trackRentalPrice"].doubleValue
        collectionHdPrice = json["collectionHdPrice"].doubleValue
        trackHdPrice = json["trackHdPrice"].doubleValue
        trackHdRentalPrice = json["trackHdRentalPrice"].doubleValue
        releaseDate = json["releaseDate"].stringValue
        collectionExplicitness = json["collectionExplicitness"].stringValue
        trackExplicitness = json["trackExplicitness"].stringValue
        discCount = json["discCount"].intValue
        discNumber = json["discNumber"].intValue
        trackCount = json["trackCount"].intValue
        trackNumber = json["trackNumber"].intValue
        trackTimeMillis = json["trackTimeMillis"].intValue
        country = json["country"].stringValue
        currency = json["currency"].stringValue
        primaryGenreName = json["primaryGenreName"].stringValue
        contentAdvisoryRating = json["contentAdvisoryRating"].stringValue
        longDescription = json["longDescription"].stringValue
        hasITunesExtras = json["hasITunesExtras"].boolValue
    }
    
    init() {
        wrapperType = ""
        kind = ""
        collectionId = 0
        trackId = 0
        artistName = ""
        collectionName = ""
        trackName = ""
        collectionCensoredName = ""
        trackCensoredName = ""
        collectionArtistId = 0
        collectionArtistViewUrl = ""
        collectionViewUrl = ""
        trackViewUrl = ""
        previewUrl = ""
        artworkUrl30 = ""
        artworkUrl60 = ""
        artworkUrl100 = ""
        collectionPrice = 0.0
        trackPrice = 0.0
        trackRentalPrice = 0.0
        collectionHdPrice = 0.0
        trackHdPrice = 0.0
        trackHdRentalPrice = 0.0
        releaseDate = ""
        collectionExplicitness = ""
        trackExplicitness = ""
        discCount = 0
        discNumber = 0
        trackCount = 0
        trackNumber = 0
        trackTimeMillis = 0
        country = ""
        currency = ""
        primaryGenreName = ""
        contentAdvisoryRating = ""
        longDescription = ""
        hasITunesExtras = false
    }

}
