//
//  LivrosAPI.swift
//  LearningTask-9.2
//
//  Created by rafael.rollo on 22/07/2022.
//

import Foundation

class LivrosAPI {
    
    func carregaLivros(por autor: Autor) -> [Livro] {
        return [
            Livro(titulo: "Orientação a Objetos", imagemDeCapaURI: "https:s3.xpto.oo.jpeg", autor: autor),
            Livro(titulo: "ECMAScript 6", imagemDeCapaURI: "https:s3.xpto.ecmascript.jpeg", autor: autor),
            Livro(titulo: "React Native", imagemDeCapaURI: "https:s3.xpto.reactNative.jpeg", autor: autor),
            Livro(titulo: "Orientação a Objetos e SOLID para Ninjas",
                  imagemDeCapaURI: "https:s3.xpto.ooSolid.jpeg", autor: autor),
            Livro(titulo: "Play Framework", imagemDeCapaURI: "https:s3.xpto.play.jpeg", autor: autor),
            Livro(titulo: "Spring MVC", imagemDeCapaURI: "https:s3.xpto.spring.jpeg", autor: autor),
            Livro(titulo: "Kotlin com Android", imagemDeCapaURI: "https:s3.xpto.androidKotlin.jpeg",
                  autor: autor),
            Livro(titulo: "Entrega contínua em Android", imagemDeCapaURI: "https:s3.xpto.androidcd.jpeg",
                  autor: autor),
            Livro(titulo: "Flutter Framework", imagemDeCapaURI: "https:s3.xpto.flutter.jpeg", autor: autor),
        ]
    }
    
}

