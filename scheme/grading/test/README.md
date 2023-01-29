# Grader

## Single file
In a directory with the following structure:
```
./
|- grader
|- testcases.rkt
|- submission.rkt
|  ...
```
execute the command `./grader testcases.rkt submission.rkt` to check the test cases in `testcases.rkt` with submission file `submission.rkt`. A feedback file will be created in the current-directory directory with name `feedback-<testcases.rkt>`.

## Multiple files
In a directory with the following structure:
```
./
|- grader
|- testcases.rkt
|- submissions
|  |- student1.rkt
|  |- student2.rkt
|  |  ...
|  ...
```
execute the command `./grader testcases.rkt submissions [feedback]` and all submission files in the `submissions` directory will be graded and feedback files will be created in the `feedback` directory if no specified folder is indicated in the optional argument `[feedback]`. 
