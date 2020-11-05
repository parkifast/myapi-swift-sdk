//
//  AddressDetails.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 23/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Complex address structure representing full address.
 */
public struct AddressDetails: Codable {
    
    /**
     House number. Aliases for this are: street number.
     */
    var houseNumber: String?
    
    /**
     Street number (alias for house number).
     */
    var streetNumber: String?
    
    /**
     House
     */
    var house: String?
    
    /**
     Building (alias for house).
     */
    var building: String?
    
    /**
     Public Building (alias for house).
     */
    var publicBuilding: String?
    
    /**
     Road. Aliases for this are: footway, street, street_name, residential, path, pedestrian, road_reference, road_reference_intl, square, place.
     */
    var road: String?
    
    /**
     Footway (alias for road).
     */
    var footway: String?
    
    /**
     Street (alias for road).
     */
    var street: String?
    
    /**
     Street name (alias for road).
     */
    var streetName: String?
    
    /**
     Residential (alias for road).
     */
    var residential: String?
    
    /**
     Path (alias for road).
     */
    var path: String?
    
    /**
     Pedestrian (alias for road).
     */
    var pedestrian: String?
    
    /**
     Road reference (alias for road).
     */
    var roadReference: String?
    
    /**
     Road reference international (alias for road).
     */
    var roadReferenceIntl: String?
    
    /**
     Square (alias for road).
     */
    var square: String?
    
    /**
     Place (alias for road).
     */
    var place: String?
    
    /**
     Village. Aliases for this are: Hamlet, locality, croft.
     */
    var village: String?
    
    /**
     Hamlet (alias for village).
     */
    var hamlet: String?
    
    /**
     Locality (alias for village).
     */
    var locality: String?
    
    /**
     Croft (alias for village).
     */
    var croft: String?
    
    /**
     Neighbourhood. Aliases for this are: suburb, city_district, district, quarter, commercial, industrial, houses, subdivision.
     */
    var neighbourhood: String?
    
    /**
     Suburb (alias for neighbourhood).
     */
    var suburb: String?
    
    /**
     City district (alias for neighbourhood).
     */
    var cityDistrict: String?
    
    /**
     District (alias for neighbourhood).
     */
    var district: String?
    
    /**
     Quarter (alias for neighbourhood).
     */
    var quarter: String?
    
    /**
     Commercial (alias for neighbourhood).
     */
    var commercial: String?
    
    /**
     Industrial (alias for neighbourhood).
     */
    var industrial: String?
    
    /**
     Houses (alias for neighbourhood).
     */
    var houses: String?
    
    /**
     Subdivision (alias for neighbourhood).
     */
    var subdivision: String?
    
    /**
     City. Aliases for this are: town, municipality.
     */
    var city: String?
    
    /**
     Town (alias for city).
     */
    var town: String?
    
    /**
     Municipality (alias for city).
     */
    var municipality: String?
    
    /**
     County. Aliases for this are: local_administrative_area, county_code.
     */
    var county: String?
    
    /**
     Local administrative area (alias for county).
     */
    var localAdminArea: String?
    
    /**
     County code (alias for county).
     */
    var countyCode: String?
    
    /**
     State district.
     */
    var stateDistrict: String?
    
    /**
     Postal code.
     */
    var postCode: String?
    
    /**
     State. Aliases for this are: province, state_code.
     */
    var state: String?
    
    /**
     Province (alias for state).
     */
    var province: String?
    
    /**
     State code (alias for state).
     */
    var stateCode: String?
    
    /**
     Region.
     */
    var region: String?
    
    /**
     Country. Aliases for this are: country_name.
     */
    var country: String?
    
    /**
     Country name (alias for country).
     */
    var countryName: String?
    
    /**
     Country code (NOT an alias for country).
     */
    var countryCode: String?
    
    /**
     Continent.
     */
    var continent: String?
    
    /**
     Dictionary containing all address components, since they evolve rapidly and we cannot characterize them all.
     */
    var components: [String: String]?
    
    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case houseNumber = "house_number"
        case streetNumber = "street_number"
        case house
        case building
        case publicBuilding = "public_building"
        case road
        case footway
        case street
        case streetName = "street_name"
        case residential
        case path
        case pedestrian
        case roadReference = "road_reference"
        case roadReferenceIntl = "road_reference_intl"
        case square
        case place
        case village
        case hamlet
        case locality
        case croft
        case neighbourhood
        case suburb
        case cityDistrict = "city_district"
        case district
        case quarter
        case commercial
        case industrial
        case houses
        case subdivision
        case city
        case town
        case municipality
        case county
        case localAdminArea = "local_administrative_area"
        case countyCode = "county_code"
        case stateDistrict = "state_district"
        case postCode = "postcode"
        case state
        case province
        case stateCode = "state_code"
        case region
        case country
        case countryName = "country_name"
        case countryCode = "country_code"
        case continent
        case components = "address"
    }
    
    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let addressDetails = try decoder.container(keyedBy: AddressDetails.CodingKeys.self)
        houseNumber = try addressDetails.decodeIfPresent(String.self, forKey: .houseNumber)
        streetNumber = try addressDetails.decodeIfPresent(String.self, forKey: .streetNumber)
        house = try addressDetails.decodeIfPresent(String.self, forKey: .house)
        building = try addressDetails.decodeIfPresent(String.self, forKey: .building)
        publicBuilding = try addressDetails.decodeIfPresent(String.self, forKey: .publicBuilding)
        road = try addressDetails.decodeIfPresent(String.self, forKey: .road)
        footway = try addressDetails.decodeIfPresent(String.self, forKey: .footway)
        street = try addressDetails.decodeIfPresent(String.self, forKey: .street)
        streetName = try addressDetails.decodeIfPresent(String.self, forKey: .streetName)
        residential = try addressDetails.decodeIfPresent(String.self, forKey: .residential)
        path = try addressDetails.decodeIfPresent(String.self, forKey: .path)
        pedestrian = try addressDetails.decodeIfPresent(String.self, forKey: .pedestrian)
        roadReference = try addressDetails.decodeIfPresent(String.self, forKey: .roadReference)
        roadReferenceIntl = try addressDetails.decodeIfPresent(String.self, forKey: .roadReferenceIntl)
        square = try addressDetails.decodeIfPresent(String.self, forKey: .square)
        place = try addressDetails.decodeIfPresent(String.self, forKey: .place)
        village = try addressDetails.decodeIfPresent(String.self, forKey: .village)
        hamlet = try addressDetails.decodeIfPresent(String.self, forKey: .hamlet)
        locality = try addressDetails.decodeIfPresent(String.self, forKey: .locality)
        croft = try addressDetails.decodeIfPresent(String.self, forKey: .croft)
        neighbourhood = try addressDetails.decodeIfPresent(String.self, forKey: .neighbourhood)
        suburb = try addressDetails.decodeIfPresent(String.self, forKey: .suburb)
        cityDistrict = try addressDetails.decodeIfPresent(String.self, forKey: .cityDistrict)
        district = try addressDetails.decodeIfPresent(String.self, forKey: .district)
        quarter = try addressDetails.decodeIfPresent(String.self, forKey: .quarter)
        commercial = try addressDetails.decodeIfPresent(String.self, forKey: .commercial)
        industrial = try addressDetails.decodeIfPresent(String.self, forKey: .industrial)
        houses = try addressDetails.decodeIfPresent(String.self, forKey: .houses)
        subdivision = try addressDetails.decodeIfPresent(String.self, forKey: .subdivision)
        city = try addressDetails.decodeIfPresent(String.self, forKey: .city)
        town = try addressDetails.decodeIfPresent(String.self, forKey: .town)
        municipality = try addressDetails.decodeIfPresent(String.self, forKey: .municipality)
        county = try addressDetails.decodeIfPresent(String.self, forKey: .county)
        localAdminArea = try addressDetails.decodeIfPresent(String.self, forKey: .localAdminArea)
        countyCode = try addressDetails.decodeIfPresent(String.self, forKey: .countyCode)
        stateDistrict = try addressDetails.decodeIfPresent(String.self, forKey: .stateDistrict)
        postCode = try addressDetails.decodeIfPresent(String.self, forKey: .postCode)
        state = try addressDetails.decodeIfPresent(String.self, forKey: .state)
        province = try addressDetails.decodeIfPresent(String.self, forKey: .province)
        stateCode = try addressDetails.decodeIfPresent(String.self, forKey: .stateCode)
        region = try addressDetails.decodeIfPresent(String.self, forKey: .region)
        country = try addressDetails.decodeIfPresent(String.self, forKey: .country)
        countryName = try addressDetails.decodeIfPresent(String.self, forKey: .countryName)
        countryCode = try addressDetails.decodeIfPresent(String.self, forKey: .countryCode)
        continent = try addressDetails.decodeIfPresent(String.self, forKey: .continent)
        components = [:]
        for key in addressDetails.allKeys {
            components![key.stringValue] = try addressDetails.decode(String.self, forKey: key)
        }
    }
}
