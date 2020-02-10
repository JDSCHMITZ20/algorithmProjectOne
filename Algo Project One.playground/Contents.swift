import UIKit

// Defines all arrays used, n is arrayA's size
var arrayA = [-2, 1, -3, 4, -1, 2, 1, -5, 4] // 8 elements per array
var arrayB = [Int]()
var arrayC = [Int]()
var arrayD = [Int]()
var arrayE = [Int]()
var n = arrayA.count


// Fills arrayB through arrayE, used to get random values for those arrays and fill them to match arrayA's size(sample array)
func fillArray() {
    for _ in 0...n-1{
        let numberB = Int.random(in: -10 ..< 10)
        arrayB.append(numberB)
        let numberC = Int.random(in: -10 ..< 10)
        arrayC.append(numberC)
        let numberD = Int.random(in: -10 ..< 10)
        arrayD.append(numberD)
        let numberE = Int.random(in: -10 ..< 10)
        arrayE.append(numberE)
    }
}


// Brute force method provided by Dr. Eloe
func bruteForce(_ A:[Int]) -> Int{
    var maxsum = A[0]
    for i in 0...n-1{
        for j in i...n-1{                                                               // only start at i; the max could be a single value
            var total = 0
            for k in i...j{
                total += A[k]
                if maxsum < total {
                    maxsum = total
                }
                
            }
        }
    }
    return maxsum
}


// Kadane's Algorithm for solving the problem
func kadane(_ A:[Int]) -> Int{
    //Find a contiguous subarray with the largest sum.
    var best_sum = 0  // or: float('-inf')
    var current_sum = 0
    for x in A{
        current_sum = max(0, current_sum + x)
        best_sum = max(best_sum, current_sum)
    }
    return best_sum
}


fillArray()                                                                                 // Calls fillArray function to fill empty arrays
let startBrute = DispatchTime.now()                                                         // Start timer for brute force method
print("Brute Force:",bruteForce(arrayA),bruteForce(arrayB),bruteForce(arrayC),              // Use brute force find solution and prints out
      bruteForce(arrayD),bruteForce(arrayE))
let endBrute = DispatchTime.now()                                                           // End timer for brute force method
var nanoTime = endBrute.uptimeNanoseconds - startBrute.uptimeNanoseconds                    // Difference in nano seconds
var timeInterval = Double(nanoTime) / 1_000_000_000                                         // Difference in seconds, useful if longer test

// prints times for the brute force method
print("Time in nano seconds:",nanoTime)
print("Time in seconds:",timeInterval,"\n")


let startKadane = DispatchTime.now()                                                        // Start timer for Kadane method
print("Kadane:",kadane(arrayA),kadane(arrayB),kadane(arrayC),kadane(arrayD),kadane(arrayE)) // uses Kadane algorithm to find solution
let endKadane = DispatchTime.now()                                                          // End timer for Kadane method
var nanoTimeK = endKadane.uptimeNanoseconds - startKadane.uptimeNanoseconds                 // Difference in nano seconds
var timeIntervalK = Double(nanoTimeK) / 1_000_000_000                                       // Difference in seconds

// print times for the Kadane method
print("Time in nano seconds:",nanoTimeK)
print("Time in seconds:",timeIntervalK)
