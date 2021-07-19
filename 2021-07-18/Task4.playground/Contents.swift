import UIKit

/*
 4. Объявить три константы с именами rating1, rating2 и rating3 типа Double и присвоить каждой значение. Вычислить среднее из трех и сохранить результат в константе с именем averageRating
 */

let rating1: Double = 10
let rating2 = 20.0
let rating3 = 30.0

// Решение 1
let averageRating = (rating1 + rating2 + rating3) / 3

// Решение 2
let ratingArray = [rating1, rating2, rating3]

var anotherAverageRating = Double()

func countAverage (from array:[Double]) -> Double {
    var total = Double()
    for rating in array {
        total += rating
    }
    anotherAverageRating = total / Double(array.count)
    
    return anotherAverageRating
}

anotherAverageRating = countAverage(from: ratingArray )
