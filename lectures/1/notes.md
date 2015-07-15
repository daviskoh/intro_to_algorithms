# Introduction

================================================

## Integer Multiplication

Input: 2 n-digit nums x and y
Output: product x * y

Primitive Operation - add or multiply 2 single-digit nums

Grade School Algorithm

```
     5678
   x 1234
-----------
    22712
   170340
  1135600
  5678000
-----------
  7006652
```

Pseudocode (needs verification)

```
// pseudocode
n1 = 5678
n2 = 1234

map (digit, i) in n2
    return tempNum = n1 * (digit += (i * 0))
reduce (sum, n) in aboveResult
    return sum += n
```
Upshot: # of operations overall <= constant n^2

Big O - ignore constants & measure how algos *scale* as input size *grows*

## Merge Sort: Motivation & Example

Why study merge sort:

- good intro to Divide & Conquer

Sorting Problem

Input: array of n nums, unsorted

Output: same nums, sorted in increasing order

NOTE: all nums in this ex will be unique (though not requirement for actual prob)

## Merge Sort: Pseudocode

Pseudocode TODO: implement merge sort

```
func merge(array1, array2, resultLen) -> array
    c = []
    i, j = 0

    for k 0..resultLen-1
        if array1[i] < array2[j]
            c[k] = array1[i]
            i++
        else if array2[j] < array1[i]
            c[k] = array2[j]
            j++

    return c

func sort(array) -> array
    if array.length == 0 then return

    sortedLeft = sort(array / 2)
    sortedRight = sort(array / 2)

    return merge(sortedLeft, sortedRight)

```

Running Time

Key Question: Running time of merge sort on array of **n** numbers?

Merge Operations

- 2 operations for i, j init
- 4 operations per iteration (comparison, assignment, incr i/j, incr k)

array of *m* nums

Upshot <= 4m + 2  
*turns into*  
**Upshot** <= 6m (since m >= 1)

## Merge Sort: Analysis

**Claim**: merge sort requires <= **6nlog2n + 6n** operations to sort n nums

NOTE: log2n = # of times you divide by 2 until you get down to 1

Proof of Claim (assuming n = power of 2)

Binary Tree for recursion levels  
- has log2n levels of recursive calls because input size decreases by factor of 2 w/ each recursion until rounds out at 1 (base case)

Proof:  
At each level j = 0, 1, 2, .., log2n: there are 2^j subproblems each size of n/(2^j)  
Total # of operations at level j <= 2^j + 6(n / (2^j))  
NOTE: 6 comes from the fact that this when given array of size n, will execute **at most** 6n   

## Guiding Principles for Analysis of Algorithms

1) Worst Case Analysis - over running time bound holds for *every* input of length n

2) Ignore Constant Factors, Lower-Order Terms  
Justifications:   
- mathematically easier  
- constants depend on programming architecture / compiler / programmer   
- lose very little predictive power   

3) Asymptotic Analysis - focus on running time for *large* input sizes n  

**fast algorithm** ≈ worst-case running time grows slowly w/ input size   
holy grail - linear running time (or close to it)
