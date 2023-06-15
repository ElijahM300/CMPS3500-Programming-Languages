; NAME: Elijah Morris
; ASGT: Final Exam
; ORGN: CSUB - CMPS 3500
; FILE: final.lisp
; DATE: 5/18/2022

; Function for getting just the numbers in an s-expression and returning a list 
(defun collect-numbers (s-exp) 
    ; Conditional statement to test if the s-exp is null or a number, else, use mapcan with recursion
    (cond 
        ; Tests if the s-exp is null
        ((null s-exp)
            nil)
        ; Tests if the s-exp is a number 
        ((and (numberp s-exp) (list s-exp))
            (list s-exp))
        (t
            ; Mapcan function with recursion to filter out an s-exp to have only numbers
            (mapcan #'collect-numbers (rest (list s-exp))))))

; Function for returning all of the permutations of a list  
(defun permlist (list)
    ; Conditional that tests if a list is null or has one element in it
    (cond 
        ; Tests if the list is null
        ((null list) 
            nil)
        ; Tests if the list has only one element 
        ((null (cdr list)) 
            (list list))
        (t 
            ; Use a loop and recursion to create a list that has each permutation in it
            (loop for element in list
            append (mapcar (lambda (x) (cons element x))(permlist (remove element list)))))))

; Function for finiding the longest sublist length 
(defun sublen (list1) 
    ; Matches the type 
    (typecase list1
        ; Use cons, a loop, and recursion to find the max length of a sublist
        (cons (max (length list1)
            (loop for sublist in list1
            maximize (sublen sublist))))
    ; If it's null, return nil
    (null nil)
    ; Else return 1
    (t 1)))

; Function for finding the intercalate of two lists 
(defun intercalate (list1 list2)
    ; Conditional to test if the lists are null or not equal, else, find the intercalate of the two lists 
    (cond
        ; Tests if either lists are null
        ((or (null list1) (null list2))
            nil)
        ; Tests if both lists are the same size
        ((/= (length list1) (length list2))
            "Lists must have the same length, please try again!")
        (t
            ; Loop through each list and append each element in the lists in a new list 
            (loop for i in list1 as j in list2
            append (list i j)))))


; Output testing the collect-numbers function
(print "Test collect-numbers")
(print "--------------------")
(print "Print (collect-numbers 1)")
(print (collect-numbers 1))
(terpri)
(print "Print (collect-numbers 'a)")
(print (collect-numbers 'a))
(terpri)
(print "Print (collect-numbers '(1 (b (2 c) ((3)))))")
(print (collect-numbers '(1 (b (2 c) ((3))))))
(terpri)

; Output testing the permlist function
(print "Test permlist")
(print "--------------------")
(print "Print (permlist '(1 2))")
(print (permlist '(1 2)))
(terpri)
(print "Print (permlist '(a b c))")
(print (permlist '(a b c)))
(terpri)

; Output testing the sublen function
(print "Test sublen")
(print "--------------------")
(print "Print (sublen '(1 2))")
(print (sublen '(1 2)))
(terpri)
(print "Print (sublen '(a (b c) c (a b c d)))")
(print (sublen '(a (b c) c (a b c d))))
(terpri)
(print "Print (sublen '(a (a b) (a b c) (a b c (d e) f)))")
(print (sublen '(a (a b) (a b c) (a b c (d e) f))))
(terpri)

; Output testing the intercalate function
(print "Test intercalate")
(print "--------------------")
(print "Print (intercalate '(1) '(3))")
(print (intercalate '(1) '(3)))
(terpri)
(print "Print (intercalate '(1 2) '(3 4))")
(print (intercalate '(1 2) '(3 4)))
(terpri)
(print "Print (intercalate '(1 3 5) '(2))")
(print (intercalate '(1 3 5) '(2)))
(terpri)
