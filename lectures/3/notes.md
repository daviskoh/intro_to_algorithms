# Divide & Conquer Algorithms

##General Notes##

**Steps**

1) Divide into smaller subproblems

2) Conquer via recursive calls

3) Combine solutions of subproblems into one for the original prob

## O(n log n ) Algorithm for Counting Inversions

Problem:

Input: array A containing nums 1, 2, 3, .. in some arbitrary order  
Output: number of inversions = number of pairs (i,j) of array indices with i < j and A[i] > A[j]

Example: [1,3,5,2,4,6]  
Inversions: (3,2), (5,2), (5,4)  
Motivation: numerical similarity measure bet 2 ranked lists  
- more inversions means lists are more diff  
- ex. collaborative filtering when getting product recommendations  

Q: What is largest possible num of inversion that a 6-element array can have?
A: (n * (n - 1)) / 2 = 15  

High-Level Approach  
Brute-force: O(n^2) time  

Do better using divide & conquer

**Types**  
Call an inversion (i,j) with i < j:  
left - if i,j <= n/2  
right - if i,j > n/2  
split - if i <= n/2 < j  


High-Level Algorithm

Pseudo

```
sortAndCount array A, length n
    if n == 1 return 0
    else
        // sorted array b
        (b,x) = sortAndCount 1st half of A, n/2
        // sorted array c
        (c,y) = sortAndCount 2nd half of A, n/2
        // d - sorted version of input array A
        (d,z) = mergeAndCountSplitInv (A,n)
    return x + y + z
```
Challenge of this problem: counting split inv (there may be as many as quadratic split invs)

Goal: implement countSplitInv in linear (O(n)) time  
then count will run in O(n log n) time  

## O(n log n) Algorithm for Counting Inversions 2

Key Idea #2: have recursive calls both count invs **and sort**  
i.e. piggy back on merge sort   

Motivation: merge subroutine naturall uncovers split inversions  

Q: Suppose input array A has no split inversions. What is relationship bet sorted subarrays B and C?  
A: All elements of B are less than all elements of C  
Why: Consider if 1 element in B > 1 element in C, that constitutes as inversion  


Example: Consider merging B [1,3,5] and C [2,4,6]  
Outut: D [1, 2]  
When 2 copied to output, discover the split inversions (3,2) and (5,2)  
When 4 copied to output, discover (5,4)  

**General Claim**  
Claim: split inversions involving element y of 2nd array C are precisely the numbers left in 1st array B when y is copied to output array D  
Remember: every split inversion by definition has to involve 1 element from 1st half and 2 element from 2nd half  
Proof: let x be an element of 1 array B   
1) if x copied to output D before y, then x < y
- no inversions involving x & y  
2) if y copied to ouput D before x, then y < x  
- x & y are split inversion  

**MergeAndCountSplitInv** High-Level    
1st half B, 2nd half C, output D  
- while merging 2 sorted subarrays, keep running total of number of split inversions  
- when element of 2nd array C gets copied to output D, incr total by number of elements remaining in 1st array B  
Run time of subroutine: O(n) + O(n) = O(n)  
SortAndCount runs in O( n log n) time (**just like merge sort**)  


## Strassen Subcubic Matrix Multiplication Algorithm

3 Matrices x - y = z  
(all n x n matrices)  

Strassens Algorithm  
Step 1: recursively compute only **7** (cleverly) chosen products  
Step 2: do necessary (clever) additions + subtractions (still Theta(n^2) time)  
Fact: better than cubic time (O(n^3))  

Details  
x = [[A, B], [C, D]] and y = [[E, F], [O, H]]  
7 Products:
P1 = A(F-H)  
P2 = (A + B)H  
P3 = (C+D)E  
P4 = D(G-E)  
P5 = (A+D)(E+H)  
P6 = (B-D)(G+H)  
P7 = (A-C)(E+F)   
Claim: x * y = [[AE + BG, AF + BH], [CE + DG, CF + DH]] = [[P5+P4-P2+P6, P1+P2], [P3+P4, P1+P5-P3-P7]]  
Proof: AE + AH + DE + DH + DG - DE - AH - BH + BG + BH - DG - DH = AE + BG  


