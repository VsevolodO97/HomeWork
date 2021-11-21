import UIKit

/*
 1. Завершить текущую задачу с leetode + взять одну новую
 2. Почитать

 - https://www.andyibanez.com/posts/understanding-keypaths-swift/
 - https://www.swiftbysundell.com/articles/the-power-of-key-paths-in-swift/
 - https://medium.com/flawless-app-stories/the-story-of-my-experiments-with-swift-keypath-3a55809ffecf

 3. Реализовать функцию сортировки коллекции и привести примеры использования


 func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>) -> [Element] {

     }


 Например, playlist.songs.sorted(by: \.name)

 4. Привести примеры использования map, filter, reduce для коллекций, передавая в них keypathes.

 Обрати внимание, что на занятии в Playground я функцию map сам писал. Забыл, что в Swift 5.2 это в язык добавили https://www.donnywals.com/using-keypaths-as-functions-in-swift-5-2/
 */


/*
 3. Реализовать функцию сортировки коллекции и привести примеры использования


 func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>) -> [Element] {

     }


 Например, playlist.songs.sorted(by: \.name)
 */

extension Collection { // Вопрос: почему в примере был Sequence, а я использовал Collection
    func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>) -> [Element] {
        return sorted { a, b in
            return a[keyPath: keyPath] < b[keyPath: keyPath]
            
        }
    }
}

struct Song {
    let name: String
    let dateAdded: String
    let rating: Int
}

struct Playlist {
    var songs: [Song]
}

let cristmasSong = Song(name: "Merry Cristmas", dateAdded: "2010", rating: 10)
let someSong = Song(name: "SomeSong", dateAdded: "2001", rating: 8)
let anotherSong = Song(name: "AnotherSong", dateAdded: "2001", rating: 5)
var songs: Array<Song> = [cristmasSong, someSong, anotherSong]

let playList = Playlist(songs: songs)

playList.songs.sorted(by: \.name)
playList.songs.sorted(by: \.dateAdded)
playList.songs.sorted(by: \.rating)


// 4. Привести примеры использования map, filter, reduce для коллекций, передавая в них keypathes.
songs.map(\.name)
extension Song {
    var ratingIsGreaterrThanFive: Bool {
        return rating > 5
    }
}
songs.filter(\.ratingIsGreaterrThanFive)
let averageRating = songs.map(\.rating).reduce(0, { x ,y in
    (x + y) } ) / songs.map(\.rating).count // не к самому reduce получилось применение


/* 1. Завершить текущую задачу с leetode
 
 We are playing the Guess Game. The game is as follows:

 I pick a number from 1 to n. You have to guess which number I picked.

 Every time you guess wrong, I will tell you whether the number I picked is higher or lower than your guess.

 You call a pre-defined API int guess(int num), which returns 3 possible results:

 -1: The number I picked is lower than your guess (i.e. pick < num).
 1: The number I picked is higher than your guess (i.e. pick > num).
 0: The number I picked is equal to your guess (i.e. pick == num).
 Return the number that I picked.

  

 Example 1:
 Input: n = 10, pick = 6
 Output: 6
 
 Example 2:
 Input: n = 1, pick = 1
 Output: 1
 
 Example 3:
 Input: n = 2, pick = 1
 Output: 1
 
 Example 4:
 Input: n = 2, pick = 2
 Output: 2
 
 /**
  * Forward declaration of guess API.
  * @param  num -> your guess number
  * @return          -1 if the picked number is lower than your guess number
  *                  1 if the picked number is higher than your guess number
  *               otherwise return 0
  * func guess(_ num: Int) -> Int
  */

 class Solution : GuessGame {
     func guessNumber(_ n: Int) -> Int {
         
     }
 }
*/

Array(1...1)
var pickedNumber: Int = 0

func guessNumber(_ n: Int) -> Int {
    pickedNumber = Int.random(in: 1..<(n + 1))
    
    let sortedArray = Array(1...n)
    var startIndex: Int = 0
    var endIndex: Int = sortedArray.count - 1
    
    while startIndex <= endIndex {
        let middle: Int = (startIndex + endIndex) / 2
        if guess(middle) == 0 {
            return middle
        } else if guess(middle) == -1 {
            endIndex = middle - 1
        } else if guess(middle) == 1 {
            startIndex = middle + 1
        }
    }
    
    return 9
}


func guess(_ num: Int) -> Int {
    if pickedNumber < num {
        return -1
    } else if pickedNumber > num {
        return 1
    } else if pickedNumber == num {
        return 0
    }
    return 555
}

guessNumber(9)


/*
 Leetcode solution
 API (func guess) alredy exists
 
 func guessNumber(_ n: Int) -> Int {

     var startIndex: Int = 1
     var endIndex: Int = n

     while startIndex <= endIndex {
         let middle: Int = (startIndex + endIndex) / 2
         if guess(middle) == 0 {
             return middle
         } else if guess(middle) == -1 {
             endIndex = middle - 1
         } else if guess(middle) == 1 {
             startIndex = middle + 1
         }
     }

     return 9
 }
 */

/*
 1. Завершить текущую задачу с leetode + взять одну новую
 
 There is an integer array nums sorted in ascending order (with distinct values).

 Prior to being passed to your function, nums is possibly rotated at an unknown pivot index k (1 <= k < nums.length) such that the resulting array is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] (0-indexed). For example, [0,1,2,4,5,6,7] might be rotated at pivot index 3 and become [4,5,6,7,0,1,2].

 Given the array nums after the possible rotation and an integer target, return the index of target if it is in nums, or -1 if it is not in nums.

 You must write an algorithm with O(log n) runtime complexity.

  

 Example 1:
 Input: nums = [4,5,6,7,0,1,2], target = 0
 Output: 4
 
 Example 2:
 Input: nums = [4,5,6,7,0,1,2], target = 3
 Output: -1
 
 Example 3:
 Input: nums = [1], target = 0
 Output: -1
  
 */

func search(_ nums: [Int], _ target: Int) -> Int {
        
           guard let result = nums.firstIndex(of: target) else {
                 return -1
           }
       
       return result
    }

search([4,5,6,7,0,1,2], 0)
search([4,5,6,7,0,1,2], 3)
