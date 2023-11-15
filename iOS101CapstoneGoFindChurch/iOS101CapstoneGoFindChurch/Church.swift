//
//  Church.swift
//  iOS101CapstoneGoFindChurch
//
//  Created by Shinyoung Lee on 11/14/23.
//

import Foundation

struct Churches: Decodable
{
    let results:[Church]
}

struct Church: Decodable
{
    let name: String
    let denomination: String
    let location: String
    let hours: [String]
}
