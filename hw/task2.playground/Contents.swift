import UIKit
// Протокол для книг, доступных для выдачи
public protocol Loanable {
    var isAvailable: Bool { get set }
    func loan()
    func returnBook()
}

// Протокол для электронных ресурсов
public protocol ElectronicResource {
    func accessOnline()
}

// Перечисление жанров книг
public enum Genre {
    case fiction
    case nonfiction
    case biography
}

// Перечисление типов электронных ресурсов
public enum ResourceType {
    case ebook
    case audiobook
    case video
}

// Класс, представляющий книгу
class Book: Loanable {
    func loan() {
        <#code#>
    }
    
    func returnBook() {
        <#code#>
    }
    
    var title: String
    var author: String
    var genre: Genre
    var isAvailable: Bool
    
    init(title: String, author: String, genre: Genre) {
        self.title = title
        self.author = author
        self.genre = genre
        self.isAvailable = true
    }
    
    
    // Класс, представляющий журнал
    class Magazine: Loanable {
        func loan() {
            <#code#>
        }
        
        func returnBook() {
            <#code#>
        }
        
        var title: String
        var issue: Int
        var isAvailable: Bool
        
        init(title: String, issue: Int) {
            self.title = title
            self.issue = issue
            self.isAvailable = true
        }
        
        // Структура, представляющая ресурс в электронном формате
        struct ElectronicResourceItem: ElectronicResource {
            func accessOnline() {
                <#code#>
            }
            
            var name: String
            var type: ResourceType
            
            // Структура, представляющая секцию в библиотеке
            struct Section {
                var name: String
                var books: [Book]
                var magazines: [Magazine]
            }
            
            // Класс, представляющий библиотеку
            class Library {
                var name: String
                var sections: [Section]
                
                init(name: String, sections: [Section]) {
                    self.name = name
                    self.sections = sections
                }
            }
        }
    }
}
