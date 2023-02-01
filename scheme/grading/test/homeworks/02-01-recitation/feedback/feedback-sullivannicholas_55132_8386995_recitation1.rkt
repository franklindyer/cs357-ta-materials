BEGINNING OF TESTING
---
Test case: '(subset? '(1 2 3) '(3 2 1 4))
TEST FAILED: incorrect value
Test case: '(subset? '() '())
TEST FAILED: incorrect value
Test case: '(subset? '(a b c d) '(a c e b f))
TEST PASSED!
Test case: '(subset? '(5 4 3) '())
TEST PASSED!
Test case: '(subset? '((1 2 3)) '((5 6 7) (1 2 3)))
TEST FAILED: incorrect value
Test case: '(set-equals? '(1 2 3 4) '(1 2 3 4))
TEST FAILED: evaluation resulted in error or took too long
Test case: '(set-equals? '() '())
TEST FAILED: evaluation resulted in error or took too long
Test case: '(set-equals? '(1 2 3) '(3 2 1))
TEST FAILED: evaluation resulted in error or took too long
Test case: '(set-equals? '(1 2 3 4 5 6 7) '(1 2 3 4 6 7))
TEST FAILED: evaluation resulted in error or took too long
Test case: '(set-equals? '() '(()))
TEST FAILED: evaluation resulted in error or took too long
6