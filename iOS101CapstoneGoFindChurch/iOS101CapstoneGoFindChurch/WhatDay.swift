//
//  WhatDay.swift
//  iOS101CapstoneGoFindChurch
//
//  Created by Shinyoung Lee on 11/13/23.
//

import Foundation

struct WhatDay: Decodable
{
    let date: String
    let season: String
    let celebrations: [Celebration]
    let weekday: String
}

struct Celebration: Decodable
{
    let title: String
    let colour: String
    let rank: String
}
