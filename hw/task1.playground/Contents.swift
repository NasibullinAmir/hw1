protocol HomeworkService {
    // Функция деления с остатком, должна вернуть в первой части результат деления, во второй части остаток.
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int)

    // Функция должна вернуть числа фибоначчи.
    func fibonacci(n: Int) -> [Int]

    // Функция должна выполнить сортировку пузырьком.
    func sort(rawArray: [Int]) -> [Int]

    // Функция должна преобразовать массив строк в массив первых символов строки.
    func firstLetter(strings: [String]) -> [Character]

    // Функция должна отфильтровать массив по условию, которое приходит в параметре condition. (Нельзя юзать filter у `Array`)
    func filter(array: [Int], condition: ((Int) -> Bool)) -> [Int]
}
struct HomeworkServiceImpl: HomeworkService {
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int) {
        let quotient = x / y
        let remainder = x % y
        return (quotient, remainder)
    }
    
    func fibonacci(n: Int) -> [Int] {
        var sequence = [0, 1]
        
        guard n > 2 else {
            return Array(sequence.prefix(n))
        }
        
        for _ in 2..<n {
            let nextNumber = sequence[sequence.count - 1] + sequence[sequence.count - 2]
            sequence.append(nextNumber)
        }
        
        return sequence
    }
    
    func sort(rawArray: [Int]) -> [Int] {
        var sortedArray = rawArray
        
        for i in 0..<sortedArray.count {
            for j in 0..<sortedArray.count - 1 - i {
                if sortedArray[j] > sortedArray[j+1] {
                    sortedArray.swapAt(j, j+1)
                }
            }
        }
        
        return sortedArray
    }
    
    func firstLetter(strings: [String]) -> [Character] {
        return strings.compactMap { $0.first }
    }
    
    func filter(array: [Int], condition: ((Int) -> Bool)) -> [Int] {
        var filteredArray = [Int]()
        
        for element in array {
            if condition(element) {
                filteredArray.append(element)
            }
        }
        
        return filteredArray
    }
}
//Пример использования функций
let homeworkService = HomeworkServiceImpl()

let divisionResult = homeworkService.divideWithRemainder(10, by: 3)
print("Резултьат деления: \(divisionResult.0), Остаток: \(divisionResult.1)")

let fibonacciSequence = homeworkService.fibonacci(n: 5)
print("Числа Фиьоначчи: \(fibonacciSequence)")

let unsortedArray = [228, 1337, 0, 7, 10, 1, 5]
let sortedArray = homeworkService.sort(rawArray: unsortedArray)
print("Отсортированный массив: \(sortedArray)")

let strings = ["Hello", "bro", "wyd"]
let firstLetters = homeworkService.firstLetter(strings: strings)
print("Первые символы строк: \(firstLetters)")

let numbers = [1, 2, 3, 4, 5]
let filteredArray = homeworkService.filter(array: numbers) { $0 % 2 == 0 }
print("Отфильтрованный массив: \(filteredArray)")

