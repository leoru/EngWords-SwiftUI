//
//  UUIDIdentifiable.swift
//  EngWords
//
//  Created by Kirill Kunst on 04.11.2020.
//

import Foundation

protocol UUIDIdentifiable: Identifiable { var id: String { get } }
protocol Initializable { init() }
