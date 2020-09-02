//  ViewController.swift
//  HigherOrderFunctionsPractice
//  Created by Ranjeet Raushan on 31/08/20.
//  Copyright © 2020 Ranjeet Raushan. All rights reserved.

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filter()
        map()
        reduce()
        sorting()
        flatMap()
        compactMap()
        chaining() // ->  combination of more than 3 higher order functions
    }
    
    // Mark:- Filter
    func filter(){
        let filterArray = [1,2,3,4,5,6,7,8,9,10]
        let filteredArrayForEvenNumber = filterArray.filter{ $0 % 2 == 0 }
        print("The filtered array is : \(filteredArrayForEvenNumber)")
        // o/p - The filtered array is : [2, 4, 6, 8, 10]
         
        let filteredArrayForOddNumber = filterArray.filter{ $0 % 2 != 0 }
        print("The filtered array is : \(filteredArrayForOddNumber)")
        // o/p - The filtered array is : [1, 3, 5, 7, 9]
       
        // numbers less than 5
        let numbersLessThanFive = filterArray.filter{ $0 < 5}
         print("The filtered array is : \(numbersLessThanFive)")
         // o/p - The filtered array is : [1, 2, 3, 4]
    }
    // Mark:- Map
    func map(){
        let mapArray = [1,2,3,4,5,6,7,8,9,10]
          // 
        //Addition
        let mappedArrayForAddition = mapArray.map{$0 + $0}
        print(" The mapped Array is : \(mappedArrayForAddition)")
        // o/p - The mapped Array is : [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
        
        // Multiplication
        let mappedArrayForMultiplication = mapArray.map{$0 * 2}
        print("The mapped Array is : \(mappedArrayForMultiplication)")
        // o/p - The mapped Array is : [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
        
        //Division
        let mappedArrayForDivision = mapArray.map{$0 % 2 }
        print("The mapped array is \(mappedArrayForDivision)")
        // o/p - The mapped array is [1, 0, 1, 0, 1, 0, 1, 0, 1, 0]
        
        let mappedArrayForSquare = mapArray.map{ $0 * $0}
        print("The mapped array is \(mappedArrayForSquare)")
        // o/p - The mapped array is [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
        
        // convert Array<Int>()  to Array<String>()
        let mappedArrayConvertToStrings = mapArray.map{String ($0)}
        print("The mapped array is \(mappedArrayConvertToStrings)")
        // o/p - The mapped array is ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    }
    
    // Mark:- Reduce
    func reduce(){
        let reduceArray = [1,2,3,4,5,6,7,8,9,10]
        let reducedArrayMethod1 = reduceArray.reduce(0, {$0 + $1})
        print("The reduced Array is :\(reducedArrayMethod1)")
        // o/p - The reduced Array is :55
        let reducedArrayMethod2 = reduceArray.reduce(0 , +)
        print("The reduced Array is :\(reducedArrayMethod2)")
        // o/p -  The reduced Array is :55
        let reduceArrayForString = ["Delhi ", "is " , "the " , "capital ", "of ", "India"]
        let reducedArrayForString = reduceArrayForString.reduce("", +)  // here in case of string , put "" instead of zero
        print("The reduced Array for String is : \(reducedArrayForString)")
        // o/p - The reduced Array for String is : Delhi is the capital of India
        
       //  removing the comma and array box
        
        let reducedCommaAndArrayBox = reduceArray.reduce("") {String($0) + String($1)}
        // or, let reducedCommaAndArrayBox = reduceArray.reduce("") {$0 + String($1)}
         print("The reduced Array  After Removing Comma & Array Box is :\(reducedCommaAndArrayBox)")
        // o/p - The reduced Array  After Removing Comma & Array Box is :12345678910
    }
    
    
    // Mark:- Sorting
    func sorting(){
        let sortArray = [51,2,3,4,5,65656,1,6,7,8,9,10]
        let sortedArrayForDecreasingOrder = sortArray.sorted{$0 > $1} // Decreasing Order
        print("The Sorted Array is : \(sortedArrayForDecreasingOrder)")
        // o/p - [65656, 51, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
        let sortedArrayForIncreasingOrder = sortArray.sorted{$0 < $1} // Increasing Order
        print("The Sorted Array is : \(sortedArrayForIncreasingOrder)")
        // O/P - [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 51, 65656]
    }
    
    // Mark:- flatMap
    func flatMap(){
        let flatArray = [[43,65,34,93],[54,63,25,38],[787,8787,9898,4554],[6456,98797,5455,32254]]
        let flatedArray = flatArray.flatMap{$0}
        print("The flated Array is :\(flatedArray)")
        // o/p - The flated Array is :[43, 65, 34, 93, 54, 63, 25, 38, 787, 8787, 9898, 4554, 6456, 98797, 5455, 32254]
    }
    // Mark:- compactMap
    func compactMap(){
        let compactArrayForString = ["Ram", nil , "Shyam", nil, "Bangalore" , nil, "New Jersy" , nil ]
        let compactedArrayForString = compactArrayForString.compactMap{$0}
        print("The Compacted Array For String is : \(compactedArrayForString)")
        // o/p -  The Compacted Array For String is : ["Ram", "Shyam", "Bangalore", "New Jersy"]
    }
    // Mark:- Chaining
    func chaining(){
        let chainArray = [[127,6554,875756],[76746,65464,98978],[76736,97978,879797],[9676565,765788,45556]]
        let chainedArray = chainArray.flatMap{$0}.filter{$0 % 2 == 0}.map{$0 * $0} // using flatMap , Filter & map together
        print("The Chained Array is :\(chainedArray)")
        // o/p - The Chained Array is :[42954916, 766948571536, 5889948516, 4285535296, 9796644484, 5888413696, 9599688484, 586431260944, 2075349136]
        
        let chainedArray2  = chainArray.flatMap{$0}.filter{$0 % 2 == 0 }.reduce(0,{$0 + $1}) // using flatMap , Filter & reduce  together
        print("The Chained Array is :\(chainedArray2)")
         // o/p - The Chained Array is :2109556

    }
}

