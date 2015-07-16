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

### Example #1  
Claim: if T(n) = akn^k + ... + a1n + a0 then T(n) = O(n^k)  
meaning: big O really suppresses constants factors and lower-order terms  
Proof: Choose n0 = 1 and c = |ak| + |ak|.... TODO: (2:10 mark) / check typed notes  

### Example #2
Claim: for every k >= 1, n^k is **not** O(n^(k-1))  
Proof: by contradiction. Suppose n^k = O(n^(k-1))  TODO: (6:45 mark) / check typed notes  

## Big Omega and Theta

Omega: T(n) = Ω(f(n)) if and only if ?? constants .... TODO: (1:00 mark) / check typed notes

Theta: T(n) = Θ(f(n)) if and onyl if T(n) = O(f(n)) **and** T(n) = Ω(f(n))  
Equivalent: TODO: (2:25 mark) / check typed notes

## Additional Examples

TODO: view lecture - practice


