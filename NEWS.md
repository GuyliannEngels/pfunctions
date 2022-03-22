# pfunctions 0.0.1

## 0.0.2

* Add new funtions : `strb_*`

`strb_subset()`, `strb_extract()`, `strb_replace()` are functions that use the simple syntax of {stringr}. These functions are less efficient (execution speed and memory allocation) than str_* from {stringr}. 
The {stringr} package depends on more than 50 packages while strb_* uses only R base. When writing a package, it is important to look at all the dependencies of the package. If our function does not require the use of stringr's str_* functions, it would be interesting to use their lightweight version strb_*

## 0.0.1

* Add new function : `is_complete_yaml()` checks if the YAML in the Rmd is complete
* Added a `NEWS.md` file to track changes to the package.

### 0.0.0.9000

* first function : `render_all_project()` find and compile all rmd in a project
* package initiation
