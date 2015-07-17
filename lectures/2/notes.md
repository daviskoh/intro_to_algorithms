# Asymptotic Analysis

## The Gist

importance: vocab for design & analysis of algos

High-Level Idea: suppress constant factors & lower-order terms

constant factors - too system-dependent  
lower-order terms - irrelevant for large inputs

ex: equate 6nlog2n + 6n w/ just nlogn
terminology: running time is O(nlogn) where n = input size

### Simple Examples###

Example: One Loop  
Problem: does array A contain integer t?
given A array of length n and t an integer

```
for i = 1 to n
    if A[i] == t then return true
return false
```

Running Time: O(n)

Example: Two Loops  
Problem: does A or B contain integer t? given A, B arrays of length n and t an integer

```
for i = 1 to n
    if A[i] == t return true
for i = 1 to n
    if B[i] == t return true
return false
```

Running Time: O(2n) -> O(n) because ignore constant factors

Example: Two Nested Loops  
Problem: do arrays A, B have a number in common? given arrays A, B of length n

```
for i = 1 to n
    for j = 1 to n
        if A[i] == B[j] return true
return false
```

Running Time: O(n^2)

Example: Two Nested Loops (2)  
Problem: does array A have duplicate entries? given array A of length n

```
for i = 1 to n
    for j = i + 1 to n
        if A[i] == A[j] return true
return false
```

Running Time: O((n^2)/2) -> O(n^2) because still have double for-loops and lower-order term (2) gets suppressed

## Big O Notation

let T(n) = func on n=1,2,3,...
usually the worst-case running time of an algo

Q: when is T(n) = O(f(n))?  
A: if eventually for all sufficiently large n, T(n) is bounded above by a constant multiple of f(n)

Formal Definition: T(n) = O(f(n)) if and only if there exist constants c, n0 > 0 such that T(n) <= c*f(n) for all n >= n0  
warning: c*n0 cannot depend on n

## Basic Examples

## Big Omega and Theta

## Additional Examples

**see lecture slides**
