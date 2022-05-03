//
//  Auteur.swift
//  SelfSizingTableViewCells
//
//  Created by Alexander Kurbatov on 03.04.2022.
//

import UIKit

struct Auteurs: Codable {
  let auteurs: [Auteur]
}

struct Auteur: Codable {
  let name: String
  let bio: String
  let source: String
  let image: String
  var films: [Film]

  // Decode JSON
  static func auteursFromBundle() -> [Auteur] {
    var auteurs: [Auteur] = []
    guard let url = Bundle.main.url(forResource: "auteurs", withExtension: "json") else {
      return []
    }

    do {
      let data = try Data(contentsOf: url)
      let json = try JSONDecoder().decode(Auteurs.self, from: data)
      auteurs = json.auteurs
    } catch {
      print("Error occured during parsing", error)
    }

    return auteurs
  }
}
