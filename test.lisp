(defun h-defact (x y)
(if
(=  x y)
x
(h-defact (/ x  y) (+ y 1))))

(defun defact (x)
(h-defact x 1))


(defun sumtorial (n)
  (if
(> n -1)
      (sumtorial (- n 1)))
(5))

(sumtorial 5)


qdefun oddp (x)
  (if
      (equal (mod 2 2) 0)
      t))

(oddp 2)
(defun make-even (x)
   (if (oddp x)
       (+ 1 x)
     (x)))(make-even 7)

(defun further (x)
  (if
      (< x 0)
      (- x 1)
    (+ x 1))) 
(further 0)

(defun my-not (x)
  (if x nil t))

      
(my-not ())
(my-not)

(ahoj)
(defun ordered (x y)
  (if (< x y)  (list x y) (list y x)))
(ordered 5 4)

(defun my-abs (x)
  (cond ((>= x 0) x)
	(t (- x))))
   

(my-abs 3)



(cond ((symbolp 5) 'symbol)
      (t 'not-a-symbol))

(cond ((symbolp x) ’symbol)
      (t ’not-a-symbol))

'('a)

(cond ((symbolp 'a) ('symbol))
      (t 'not-a-symbol))

(defun zvyr (x)
  (cond ((equal (car x) 'dobry) (cons 'skvely (cdr x)))
	((equal (car x) 'spatny) (cons 'hrozny (cdr x)))
	(t (cons 'kabrnak x))))
(zvyr '(vojak svejk))

(defun testo (x)
  (equal (car x) 'dobry)
(cons 'skvely (cdr x)))

(testo '(dobry vojak svejk))

(defun constrain (x min max)
  (cond ((< x min) min)
	((> x max) max)
	(t x)))

(constrain -100 -50 50)
   
(defun constrain (x min max)
  (if (< x min) min 
    (if (> x max) max x)))

(defun firstzero (x)
  (cond ((equal (car x) 0) 'first)
	((equal (car (cdr x)) 0) 'second)
	((equal (car (reverse x)) 0) 'third)
	(t '(not a list of zero))))
  


(firstzero '(30 3 4 ))


(defun cycle (x)
  (if (> x 98) 1 (+ x 1)))




(cycle 99)

(defun geq (x y)
  (cond ((> x y) t)
	((equal x y) t)
	(t nil)))
  


(geq 4 4)

(defun knp (prvni druhy)
  (cond ((and (equal prvni 'kamen) (equal druhy 'nuzky)) 'prvni)
	((and (equal prvni 'nuzky) (equal druhy 'papir)) 'prvni)
  	((and (equal prvni 'papir) (equal druhy 'kamen)) 'prvni)
	((and (equal prvni 'papir) (equal druhy 'nuzky)) 'druhy)
	((and (equal prvni 'nuzky) (equal druhy 'kamen)) 'druhy)
	((and (equal prvni 'kamen) (equal druhy 'papir)) 'druhy)
	((equal prvni druhy) 'nerozh)))
	
  
  


  
  (cond (equal (and (equal prvni 'kamen) (equal druhy 'nuzky)) 'nuzky) 'prvni))

(setq prvni 'kamen)
(setq druhy 'nuzky)

(knp 'kamen 'kamen)


(equal (and 'kamen 'nuzky) 'nuzky)

(cond ())

(step 5)

(defun logical-and (x y)
  (if (equal x nil) nil (if (equal y nil) nil t))) 


      
      (if y t nil)))

(logical-and 1 nil)
(setf a b)
a
      
(defun fair-coin ()
  "go and fuck yourself"
(let ((toss (random 101)))
(cond ((< toss 50) 'heads)
((> toss 50) 'tails)
(t 'edge))))

(fair-coin)
(documentation 'fair-coin)


(defun dice ()
  (+ 1 (random 6)))

(dice)

(defun two-dice ()
  (let ((x (+ 1 (random 6)))
	(y (+ 1 (random 6))))
    (list x y)))


(two-dice)

(defun snake-eyesp (x)
  (and (equal (car x) 1) (equal (car (cdr x)) 1)))

(snake-eyesp (two-dice))

(defun instant-win-p (x)
  (equal (+ (car x) (car (cdr x))) (or 7 11)))

(instant-win-p (two-dice))

(defun say-throw (x)
  (if
      (and (equal (car x) 1) (equal (car (cdr x)) 1))
      'say-throw
    (if (and (equal (car x) 6) (equal (car (cdr x)) 6)) 'boxcars (+ (car x) (car (cdr x))))))

(say-throw (two-dice))

(last '(A B C . D))

(last '(a b c))

(defun last-element (x)
  (cdr (last x)))

(cdr (last '(A B C. D)))

(defun next-to-last (x)
  (car (cdr (reverse x))))

(next-to-last '(a b c d))


     





(first '(a b c))




(defun next-to-last (x)
  (nth (- (length x) 2) x))



(next-to-last '(a b c d))
(nth (length '(a b c d)) 1)  '(a b c d))

(defun my_but_last (x)
  (remove (car (reverse x)) x))

(my_but_last '(a b c d))
     
  (remove (nth (- (length '(1 2 3 4)) 1) '(1 2 3 4)) '(1 2 3 4))

(defun mystery (x) (car (last (reverse x))))

(add_palind '(Ty a Ja))Ahoj na tom svete))č a a č))

(defun palindr (x)
  (equal x (reverse x)))

(defun add_palind (x)
  (append x (reverse x)))

(intersection nil nil)

(defun articlep (x)
  (if (or (member 'the x) (member 'a x) (member 'an x)) t))


(defun articlep (x)
  (intersection 'the x))f (or (member 'the x) (member 'a x) (member 'an x)) t))

(articlep '(the example))



(first '(a b c))



(msubsetp '(3) '(1 2 3))
(defun msubsetp (x y)
  (if (not (set-difference x y)) t))




(setq a '(soap water))
(union a '(no soap radio))

(intersection a (reverse a))


(set-difference a a)'(stop for water))

(member 'soap a)

(member 'water a)

(member 'washcloth a)

(defun set-equal (x y)
  (and (subsetp x y) (subsetp y x)))

(setq b '(water soap))
a

(set-equal b '(ahoj bedo))




(setq a '(large red shiny cube -vs- small shiny red four-sided pyramid))

(defun right-side (x)
  (cdr (member '-vs- x)))

(right-side a)

(defun left-side (x)
  (reverse (cdr (member '-vs- (reverse x)))))

(left-side a)
a

(defun common-members (x)
  (intersection (left-side x) (right-side x)))
(common-members a)


(defun count-common (x)
  (length (common-members x)))

(count-common a)

(defun compare (x)
  (list  (count-common x) 'common 'feautures))

(compare a)



(compare '(small red metal cube -vs- red plastic small cube))

(setq quality-table
      '((large . size)
	(small . size)
	(red . color)))

(defun quality (x)
  (cdr (assoc x quality-table)))

(quality 'large)

(defun description (x)
(rest (assoc x things)))

(defun quality-difference (x y)
  (quality (first (differences x y))))

(defun differences (x y)
(set-exclusive-or (description x)
		  (description y)))

(differences 'object2 'object3)

(setq books
      '((Babicka Nemcova)
	(Valka-s-mloky Capek)
	(Bila-velryba Paral)
	(Tlusty-muz Formanek)
	(Chladnou-zemi Topol)))

(defun who-wrote (x)
  (cdr (assoc x rbooks)))
(who-wrote 'Babicka)

(SETF rbooks (REVERSE books))


(rassoc 'Nemcova books)

(setq cities '((pennsylvania pittsburgh johnstown)
	      (new-jersey newark princeton trenton)
	      (ohio columbus)))


(setq mesta '((morava olomouc brno)
	      (cechy praha pardubice)))

(assoc 'morava mesta)


setq nerd-states
      '((sleeping eating)
	(eating waiting-for-a-computer)
	(waiting-for-a-computer programming)
	(programming debuggin)
	(debuggin sleeping)))

(assoc 'debuggin nerd-states)
	 
(defun nerdus (state)
  (cdr (assoc state nerd-states)))

(nerdus 'sleeping)

(defun sleepless-nerd (state)
  (if
   (equal state 'debuggin)
   '(eating)
   (cdr (assoc state nerd-states))))
   

(sleepless-nerd 'debuggin)

(defun nerd-on-caffeine (state)
  (cdr (assoc (car (cdr (assoc state nerd-states))) nerd-states)))

(nerd-on-caffeine 'debuggin)

(nerdus 'ajlahoj)
   
(cdr (assoc (car (cdr (assoc 'eating nerd-states))) nerd-states))



(setf words
'((one un)
(two deux)
(three trois)
(four quatre)
(five cinq)))

(assoc 'five words)

(setq jmena '(andrea petra martina jana ivana bara))

(defun swap-f-l (x)
  (setq f (car x))
  (setq l (car (reverse x)))
  (setq cutf (cdr x))
  (setq cutfl (reverse (cdr (reverse cutf))))
  (setq prvni (cons l cutfl))
  (setq druhy (reverse (cons f (reverse prvni))))
druhy
  )

(swap-f-l jmena)


(defun rotate-left (x)
  (cons (car (reverse x)) (remove (car (reverse x)) x)))

(rotate-left jmena)

(defun rotate-right (x)
  (reverse (cons (car x) (reverse (remove (car x) x)))))

(rotate-right jmena)

(setq zjmena jmena)

(set-difference zjmena jmena)

(setq list '(a b c d))
(setq alist '((a b c d)
	      (b c d)
	      (c d)
	      (d)))
(member 'a list)
(assoc 'd alist)



(setf rooms
'((living-room
(north front-stairs)
(south dining-room)
(east kitchen))
(upstairs-bedroom (west library)
(south front-stairs))
(dining-room (north living-room)
(east pantry)
(west downstairs-bedroom))
(kitchen (west living-room)
(south pantry))
(pantry (north kitchen)
(west dining-room))
(downstairs-bedroom (north back-stairs)
(east dining-room))
(back-stairs (south downstairs-bedroom)
(north library))
(front-stairs (north upstairs-bedroom)
(south living-room))
(library (east upstairs-bedroom)
 (south back-stairs))))

(set-robbie-location 'pantry)
(move 'north)

(defun choices (room)
  (cdr (assoc room rooms)))

(choices 'living-room)

(defun look (side room)
  (car (cdr (assoc side (choices room)))))

(look 'east 'living-room)
dining-room

(defun set-robbie-location (place)
"Moves Robbie to PLACE by setting
the variable LOC."
(setf loc place))

(setf loc 'upstairs-bedroom)

(defun how-many-choices (room)
  (length (cdr (assoc room rooms))))

(how-many-choices 'front-stairs)

(defun upstairsp (loc)
  (cond
    ((equal  'library loc) t)
    ((equal  'upstairs-bedroom loc) t)
    (t nil)))


(upstairsp loc)

(defun onstairsp (loc)
  (cond
   ((equal loc 'front-stairs) t)
   ((equal loc 'back-stairs) t)
    (t nil)))

(onstairsp loc)

(defun where ()
    (cond
      ((upstairsp loc) (list 'robbie 'is 'upstairs 'in 'the loc))
      ((onstairsp loc) (list 'robbie 'is 'on loc))
      (t (list 'robbie 'is 'downstairs 'in 'the loc))))

(where)

(defun move (side)
  (cond
    ((look side loc) (set-robbie-location (look side loc)) (where))
    (t '(Ouch! Robbie hit a wall.))))

  
(where)  

(move 'east)
  
(set-robbie-location 'pantry)
loc
     
  (set-robbie-location (car (look 'north loc)))

(car (look 'west loc))


  loc

where(set-robbie-location (look 'west loc))

(defun roayal-we (x)
  (sublis '((I . WE)) x))

(roayal-we '(If I learn lisp I will be pleased))
(= 3 3)

(type-of fn)
(funcall fn 'a nil)

(defun simple ()
  (random 10))

(simple)
(defun addsim (x)
  (+ x 1))

(addsim pi)

(define a)q


(defun fact (x)
""" faktoriál"""
(setf fact 1)
(while (> x 1)
(setf fact (* fact x))
(setf x (- x 1)))
fact)

(fact 3)

(defun add1 (x) (+ x 1))

(setf li '(1 3 5 7 9))

(mapcar  #'add1 li)

(setf daily-planet '((olsen jimmy 123-76-4535 cub-reporter)
(kent clark
 089-52-6787 reporter)
(lane lois 951-26-1438
 reporter)
(white perry 355-16-7439 editor)))

(mapcar #'third daily-planet)

(setf zer '(2 0 3 4 0 -5 -6))

(mapcar #'fivemore zer)
(mapcar  #'(lambda (n) (* n n)) zer)

(mapcar #'(lambda (n) ( + n 1)) zer)


(defun fivemore (x) (< 5 x))
(fivemore 6)

(car (member t (mapcar #'numberp st)))

(setf st '(Z o o y 32 18 30 45))

(mapcar #'(lambda (x)(k) (if (numberp x)) (if (< (- x k) 10) x)) st)

(setf k 5)
(setf x 6)

(mapcar #'(lambda (x k)(if (numberp x) (if (< (- x k) 10) x))) st)

(mapcar #'numberp  st)







------------------------------------------------------------
(defun first-in-range (x list)
  """ finds first in range +- 10 from X from LIST """
(find-if #'(lambda (y)  (< (abs (- x y)) 11)) list))

(first-in-range 5 a)

(setf x 3)
------------------------------------------------------------
(defun find-nested (list)
  """ returns the first element of a LIST that is itself a non-NIL list """
  (find-if #'(lambda (x) (and (listp x) (not (equal x nil)))) list))

(find-nested '(() (2 3 4) 3 4 5 6))
------------------------------------------------------------
(setf note-table '((c 1)
		   (c-sharp 2)
		   (d 3)
		   (d-shrap 4)
		   (e 5)
		   (f 6)
		   (f-sharp 7)
		   (g 8)
		   (g-sharp 9)
		   (a 10)
		   (a-sharp 11)
		   (b 12)))
(assoc 'c note-table )

(defun numbers (list-of-notes)
  """ makes a list of notes as input and returns the  corresponding list of number """
 (mapcar #'(lambda (x) (second (assoc x note-table))) list-of-notes))

(numbers '(c d))

------------------------------------------------------------
(defun notes (x)
  """ makes a list of notes as input and returns the  corresponding list of number """
 (mapcar #'(lambda (x) (second (assoc x (mapcar #'reverse note-table)))) x))

(notes '(5 3 1))
(mapcar #'reverse note-table)

(notes (notes '(5 3 1)))

------------------------------------------------------------

(defun raise (number list-of-numbers)
  """ raises LIST-OF-NUMBERS by NUMBER"""
  (mapcar #'(lambda (x) (+ x number)) list-of-numbers))

(raise 5 '(5 3 1 3 5 5 5))
------------------------------------------------------------

(defun normalize (list-of-numbers)
  """ adds of substract 12 if a number from list is less than 1 or more than 12"""
  (mapcar #'(lambda (x) (cond
			  ((< x 1) (+ x 12))
			  ((> x 12) (- x 12))
			  (t x))) list-of-numbers))

(normalize '(6 10 13))

------------------------------------------------------------

(defun transpose (n list-of-notes)
  """ transposes a LIST-OF-NOTES by N """
  (notes (raise n (normalize (numbers list-of-notes)))))


(transpose 5 '(e d c d e e e))

------------------------------------------------------------

(defun in-range (list)
""" picks out those numbers in a list that are greater than one and less than five """
(remove-if-not #'(lambda (x) (cond ((and (< 1 x) (> 5 x)) t) (t nil))) list))

(in-range '(1 2 3 4 7 18))

------------------------------------------------------------

(defun how-many-the (list)
""" Write a function that counts how many times the word ‘‘the’’ appears
in a sentence."""
(length (remove-if-not #'(lambda (x) (equal 'the x)) list)))

(how-many-the '(the least probable monk among the poor))

------------------------------------------------------------

(defun two-from-list (list)
  """ picks from a list of lists those of exactly length two"""
  (remove-if-not #'(lambda (x) (and (listp x) (equal 2 (length x)))) list))

(two-from-list '((1 2) 2 3 (3 4 5)))

------------------------------------------------------------
------------------------------------------------------------
------------------------------------------------------------

(setf my-hands '((3 hearts)(5 clubs) (2 diamonds)(4 diamonds)(ace spades)))

------------------------------------------------------------

(defun rank (x)
  (car x))

(rank '(2 clubs))

(defun suit (x)
  (car (cdr x)))

(suit '(2 clubs))

------------------------------------------------------------

(defun count-suit (suit deck)

(length  (remove-if-not #'(lambda (x) (equal (car (cdr x)) suit)) deck)))

(count-suit 'spades my-hands)

------------------------------------------------------------

(setf colors
      '((clubs black)
(diamonds red)
(hearts red)
(spades black)))

------------------------------------------------------------

(defun color-of (card)
  (car (cdr (car (remove-if-not #'(lambda (x) (equal (car  x) (car (cdr card)))) colors)))))

(color-of '(6 hearts))

------------------------------------------------------------

(defun first-red (deck)
(car  (remove-if-not #'(lambda (x) (equal (color-of  x) 'red))  deck)))

(first-red my-hands)

------------------------------------------------------------
(defun black-cards (deck)
  (remove-if-not #'(lambda (x) (equal (color-of  x) 'black))  deck))

(black-cards my-hands)
------------------------------------------------------------
(defun what-ranks (suit deck)
(mapcar #'(lambda (x) (car x)) (remove-if-not #'(lambda (x) (equal (car (cdr  x)) suit))  deck)))

(what-ranks 'spades my-hands)
------------------------------------------------------------
(setq all-ranks '(2 3 4 5 6 7 8 9 10 jack queen king ace))
------------------------------------------------------------
(defun higher-rank-p (prv druh)
(cond 
  ((member druh (member prv all-ranks)) druh)
  (t prv)))
   
(higher-rank-p 'ace 3)
------------------------------------------------------------
------------------------------------------------------------
 (reduce  #'union '((A B C)
		    (C D A) (F B D) (G)))
------------------------------------------------------------

(reduce #'+ (mapcar  #'length  '((A B C)
				 (C D A) (F B D) (G)))) ;;; gives length of all lists in a list

(reduce #'* '(0))

(remove-if #'(lambda (x) (not (oddp x))) '(2 3 4 5))

------------------------------------------------------------
(defun all-odd (list)
  (every #'oddp list))

(all-odd '(3 7 11 13))
------------------------------------------------------------
(defun none-odd (list)
  (every #'(lambda (x) (not (oddp x))) list))

(none-odd '( 2 4 6 8 10 ))
------------------------------------------------------------
(defun not-all-odd (list)
  (not (every #'(lambda (x) (oddp x)) list)))

(not-all-odd '(7 13 16 13 ))
------------------------------------------------------------
(defun my-find-if (pred list)
  (remove-if-not #'(lambda (x) (reverse (cons 'x (cons pred ())))) list))
(find-if  'oddp '(2 3 4 5))
(my-find-if 'oddp '(2 3 4 5))

(defun try (z)
  (reverse (cons 'x (cons  z ()))))
(defun oddo (x)
  (try 'oddp))

(defun dda (x)
  (oddo 3))
(dda 3)



(defun my-find-if (pred list)
  (remove-if-not #'(lambda (x) (reverse (cons 'x (cons  #'pred ())))) list))
(trace (my-find-if 'oddp '(3 4 5)))

(trace remove-if)
(remove-if #'oddp '(2 3 4))
;;; not working
------------------------------------------------------------
(defun my-every (pred list)
  (remove-if #'(lambda (x) (pred x)) list))
	(t nil)))

(every #'oddp '(3 7 9))
(my-every 'oddp '(3 7 9))
;;; not working
------------------------------------------------------------

  
(setf database
'((b1 shape brick)
(b1 color green)
(b1 size small)
(b1 supported-by b2)
(b1 supported-by b3)
(b2 shape brick)
(b2 color red)
(b2 size small)
(b2 supports b1)
(b2 left-of b3)
(b3 shape brick)
(b3 color red)
(b3 size small)
(b3 supports b1)
(b3 right-of b2)
(b4 shape pyramid)
(b4 color blue)
(b4 size large)
(b4 supported-by b5)
(b5 shape cube)
(b5 color green)
(b5 size large)
(b5 supports b4)
(b6 shape brick)
(b6 color purple)
(b6 size large)))


------------------------------------------------------------
(defun match-element (a b)
  (cond ((equal a b) t)
	((equal b '?) t)
	(t nil)))
(match-element 'red 'hwa)
------------------------------------------------------------
Write a function MATCH-TRIPLE that takes an assertion and a pattern as input, and returns T if the assertion matches the pattern. Both inputs  will be three-element lists.
(MATCH-TRIPLE ’(B2 COLOR RED)  ’(B2 COLOR ?))  should return T. (
								 MATCH-TRIPLE ’(B2 COLOR  RED) ’(B1 COLOR GREEN)) should return nil. Hint: Use -MATCH-ELEMENT  as a building block.

(defun match-triple (alist blist)
  (every #'(lambda (x y) (match-element x y)) alist blist))

(match-triple '(b2 color red) '(b2 color ?))
(match-triple '(b2 color red) '(b1 color green))
------------------------------------------------------------
;;;Write the function FETCH that takes a pattern as input and returns all assertions in the database that match the pattern. Remember that DATABASE is a global variable.  (FETCH ’(B2 COLOR ?)) should return (B2 COLOR RED)), and (FETCH ’(?  SUPPORTS ((B2 SUPPORTS B1) (B3 SUPPORTS B1)).

(defun fetch (pattern)
  (remove-if-not #'(lambda (x) (match-triple x pattern)) database))

(fetch '(b2 color ?))((B2 COLOR RED))
(fetch '(?  supports b1))
------------------------------------------------------------						 ;;;Use FETCH with patterns you construct yourself to answer the following questions.  What shape is block B4?  Which  blocks are bricks? What  relation is block B2 to block B3?  List the color of every block.  What facts are known about block B4?

(fetch '(b4 shape ?))
pyramid
(fetch '(? ? brick))((B1 SHAPE BRICK) (B2 SHAPE BRICK) (B3 SHAPE BRICK) (B6 SHAPE BRICK))
(fetch '(b2 ? b3))((B2 LEFT-OF B3))
(fetch '(? color ?))((B1 COLOR GREEN) (B2 COLOR RED) (B3 COLOR RED) (B4 COLOR BLUE)
		     (B5 COLOR GREEN) (B6 COLOR PURPLE))
(fetch '(b4 ? ?))((B4 SHAPE PYRAMID) (B4 COLOR BLUE) (B4 SIZE LARGE) (B4 SUPPORTED-BY B5))
------------------------------------------------------------
;;;Write a function that takes a block name as input and returns a pattern asking the color of the block. For  example, given the input B3, your function should return the list (B3 COLOR ?).
(defun block-color (block)
(list block 'color '?))
(block-color 'b3)
------------------------------------------------------------
Write a function
 SUPPORTERS that takes one input, a block, and
returns a list of the
 blocks that support it.  (SUPPORTERS ’B1)
should return the list (B2
 B3).  Your function should work by
constructing a pattern containing the block’s name, using
 that
pattern as input to
 FETCH, and then extracting the block names
from the resulting list of assertions.

(defun supporters (block)
  (fetch (list '? 'supports  block)))
(supporters 'b1)
((B2 SUPPORTS B1) (B3 SUPPORTS B1))
------------------------------------------------------------
Write a predicate
 SUPP-CUBE that takes a block as input and
returns true
 if that block is supported by a cube.  (SUPP-CUBE ’B4)
should return a true
 value; (SUPP-CUBE ’B1) should not because
B1 is supported by bricks but not cubes.
Hint:
Use the result
 of the
SUPPORTERS function as a starting point.

(defun supp-cube (block)
  (equal (mapcar #'first (fetch '(? ? cube)))(mapcar #'first (supporters block))))
(supp-cube 'b1)
------------------------------------------------------------
We are going to write  a DESCRIPTION function that returns the description of a block.  (DESCRIPTION  ’B2)  will return (SHAPE BRICK COLOR RED SIZE  SMALL SUPPORTS B1 LEFT-OF B3). We  will do this in steps.  First, write a function DESC1  that takes a block  as input and returns all assertions dealing with that block. (DESC1  ’B6) should return ((B6 SHAPE BRICK) (B6 COLOR PURPLE) (B6 SIZE LARGE)).

(defun desc1 (block)
  (fetch (list block '? '?)))
(desc1 'b6)

(mapcar #'(lambda (x) (remove 'b6 x)) '((B6 SHAPE BRICK) (B6 COLOR PURPLE) (B6 SIZE LARGE)

			       
------------------------------------------------------------
(defun desc2 (block)
  (mapcar #'(lambda (x) (remove block x)) (fetch (list block '? '?))))

(desc2 'b6)
------------------------------------------------------------
(defun description (block)
  (reduce #'append (desc2 block)))

(description 'b6)
(description 'b1)
(SHAPE BRICK COLOR GREEN SIZE SMALL SUPPORTED-BY B2 SUPPORTED-BY B3)
------------------------------------------------------------
(setf database (cons '(b2 material plastic) database)
------------------------------------------------------------

(mapcar #'oddp '(12 34 46 78 39))

(defun my-odd (list)
  (oddp (car list)))

(defun anyoddp (x)
(cond ((null x) nil)
((oddp (first x)) t)
(t (anyoddp (rest x)))))

(trace oddp)
(anyoddp '(2 6 8 12 7))

(defun anyoddp (x)
  (if
   (null x)
   nil
   (if
    (oddp (first x))
    t
    (anyoddp (rest x)))))

(anyoddp '(2 6 8 12 7))

(trace anyoddp)

(defun my-fact (num)
  (cond
    ((null num) nil)
    ((equal num 0) 1)
    (t (* num (my-fact (- num 1))))))
(my-fact 8)
------------------------------------------------------------
(defun laugh (n)
  (cond
    ((null n) nil)
    ((equal n 1) 'ha)
     (t (reverse (cons (laugh 1)(laugh (- n 1)))))))

(laugh 0)
(HA HA HA HA HA HA)
(HA HA HA HA HA)

------------------------------------------------------------
(add-up '(1 2 3 4 5 6 7 8))
(add-up '(1))
(add-up (+ 1 2 3 4 5 6 7 8))
(Defun add-up (list)
  (cond ((null list) nil)
	((= (length list) 1) (first list))
	(t (+ (first list)(add-up (cdr list))))))
------------------------------------------------------------
(defun alloddp (list)
  (cond
    ((= (length list) 1) (oddp (first list)))
    (t (alloddp (cdr list)))))



(length '(1))
oddp (first list)) t)
------------------------------------------------------------
(member 11 '(1 3  11 13 16))
(11 13 16)
(defun rec-member (symbol list)
  (cond
((null list) nil)
    ((= (first list) symbol) list)
    (t (rec-member symbol (rest list)))))
(rec-member 27 '(13 18 89 988))
------------------------------------------------------------
(setf pozdravy '((ahoj hi) (nazdar bye) (sbohem farewell)))
(assoc 'ahoj pozdravy)
(AHOJ HI)
(defun rec-assoc (symbol slist)
  (cond
    ((null slist) nil)
    ((equal (car (car slist)) symbol) (car slist))
    (t (rec-assoc symbol (cdr slist)))))

(rec-assoc 'sbohem pozdravy)
------------------------------------------------------------

(nth 0 '(a))

(defun rec-nth (num list)
  (cond
    ((null list) nil)
    ((= num 0) (car list))
    (t (rec-nth (- num 1) (cdr list))))) 

(rec-nth 3 '(a b c d))
(nth 3 '(a b c d))

(rec-nth 10000005 '(a b c))

------------------------------------------------------------

(defun add1 (x)
  (+ x 1))

(defun sub1 (x)
  (  - x 1))

(defun rec-plus (x y)
  (cond
    ((zerop y) x)
    ((zerop x) y)
    (t (rec-plus (add1 x) (sub1 y)))))


(rec-plus 3 4)

------------------------------------------------------------

(defun fib (n)
  (cond
    ((= n 0) 1)
    ((= n 1) 1)
    (t (+ (fib (- n 1)) (fib (- n 2))))))

(Fib 5)
     
------------------------------------------------------------

(defun any-7-p (x)
  (cond ((equal (first x) 7) t)
	((/= (car (last x)) 7) nil) 
(t (any-7-p (rest x)))))

(any-7-p '(3 6 7))
(last '(3 6 6))

------------------------------------------------------------

(defun short ()
  (short))

(short)

------------------------------------------------------------

(defun find-first-odd (list)
  (cond
    ((null list) nil)
    ((oddp (first list)) (first list))
    (t (find-first-odd (cdr list)))))

(find-first-odd '(2 2 3 4 5 6))


------------------------------------------------------------

(defun last-element (list)
  (cond
      ((= 1 (length list)) (car list))
    (t (last-element (cdr list)))))

(last-element '(1 2 3 4 5 6))
    
------------------------------------------------------------

(defun add-nums (n)
  (cond
    ((= n 1) n)
    (t (+ n (add-nums (- n 1))))))

(add-nums 5)

------------------------------------------------------------

(defun all-equal (list)
  (cond
    ((< (length list) 2) t)
    ((not (equal (car list) (car (cdr list)))) nil) 
    (t (all-equal (cdr list)))))


(all-equal '(1 1 1 1))
(all-equal '(1 1 1 2))

------------------------------------------------------------

(defun count-down (n)
  (cond
  ((= n 0) nil)
  (t (cons n (count-down (- n 1))))))

(reduce #'* (count-down 4)) ;;; applicative version of fact

------------------------------------------------------------
;;; with zero

(defun count-down (n)
  (cond
  ((< n 0) nil)
  (t (cons n (count-down (- n 1))))))

(count-down 5)

------------------------------------------------------------

(defun square-list (list)
  (cond
    ((null list) nil)
    (t (cons (* (car list) (car list)) (square-list (cdr list))))))

(defun app-square-list (list)
  (mapcar #'(lambda (x) (* x x)) list))

(square-list '(1 2 3 4 5 6))
(app-square-list '(1 2 3 4 5 6))

------------------------------------------------------------
(setf a '((prvni Vaclav-H) (druhy Vaclav-K) (treti Milos-Z)))

(assoc 'druhy a)
(equal 'druhy (car (car (cdr a)))) (car (cdr a))
(cdr a)




(defun my-assoc (key list)
  (cond
    ((null list) nil)
    ((equal key (car (car list))) (car list))
    (t (my-assoc key (cdr list)))))

(my-assoc 'treti a)
------------------------------------------------------------

(defun compare-lengths (x y)
  (cond
    ((and (null x) (null y)) '(oba jsou stejne dlouhe))
    ((null x) '(prvni je kratsi))
    ((null y) '(druhy je kratsi))
    (t (compare-lengths (cdr x) (cdr y)))))

(compare-lengths '(1 2 3 4 5) '(1 2 4 5 6))

------------------------------------------------------------

(defun sum-num-el (x)
  (cond
    ((null x) nil)
    ((numberp (car x)) (cons (car x) (sum-num-el (cdr x))))
    (t (sum-num-el (cdr x)))))

(defun sums (x)
(reduce #'+ (sum-num-el x)))

(sums '(1 2 a 3 b))
(sum-num-rec '(1 2 a 3 b))
(sum '(1 2 3 4))

(defun sum (x)
  (cond
    ((null x) nil)
    ((= (length x) 1) (car x))
    (t (+ (car x) (sum (cdr x))))))

(+ 1 nil)

(defun sum-num-rec (x)
  (cond
    ((null x) 0)
        ((numberp (first x)) (+ (first x) (sum-num-rec (cdr x))))
    (t (sum-num-rec (cdr x)))))
------------------------------------------------------------

(remove 'b '(a b b))
(my-remove 'b '(a b b a c))

(defun my-remove (el list)
  (cond
    ((null list) nil)
    ((equal (car list) el) (my-remove el (cdr list)))
    (t (cons (car list) (my-remove el (cdr list))))))
------------------------------------------------------------
(intersection '(a a c d) '(a e f))(A A)
(my-intersection '(a a c d) '(a e f))

(intersection '(a nil) '(b nil))

(defun my-intersection (x y)
  (cond
    ((null x) nil)
    ((equal (car x) (car y))
     (cons (car x) (my-intersection (cdr x)  (cdr y))))
    (t (my-intersection (cdr x)  y))))

(my-intersection '(a a df) '(a a))

(defun my-intersection (x y)
  (cond
    ((null x) nil)
    ((equal (car x) (car (cdr x))) (my-intersection (cdr x) y))
    ((equal (car x) (car y))(cons (car x) (my-intersection (cdr x)  (cdr y))))
    (t (my-intersection (cdr x)  y))))

(defun my-reduce (x)
  """ unikatni elelmenty"""
  (cond
    ((null x) nil)
    ((equal (car x) (car (cdr x))) (cons (car x) (my-reduce (cdr (cdr x)))))
    ((not (equal (car x) (car (cdr x)))) (cons (car x) (my-reduce (cdr x))))
     (t (my-reduce (cdr x)))))

(my-reduce '(a a b b c c d e))
------------------------------------------------------------
(set-difference '(a b c d) '(c d f g))(B A)
(set-difference  '(c d f g) nil )(C D F G)
(my-set-difference  '(c d f g) nil )(C D F G)
(set-difference  '(a a b) '(d a e))(B)

(defun  my-set-difference (x y)
  (cond
    ((null x) nil)
    ((null y) x)
    ((equal (car x) (car (cdr x))) (my-set-difference (cdr x) y))
    ((equal (car x) (car y)) (my-set-difference  (cdr x) (cdr y)))
    ((equal (car x) (car (cdr y))) (my-set-difference (cdr x) (cdr (cdr y))))
    (t (cons (car x) (my-set-difference (cdr x) y)))))

(my-set-difference '(a b c d) '(c d f g))(A B)
(my-set-difference  '(a a b) '(d a e))(B)
(set-difference  '(a a b) '(d a e))
------------------------------------------------------------
(count-odd '(4 5 6 7 8))

(defun count-odd (x)
  """ number of odd elems"""
  (cond
   ((null x) 0)
    ((oddp (car x)) (+ 1 (count-odd (cdr x))))
    (t (count-odd (cdr x)))))
------------------------------------------------------------
(defun combine (x y)
  (+ x y))

(defun fib (n)
  (cond
    ((= n 0) 1)
    ((= n 1) 1)
    (t (+ (fib (- n 1)) (fib (- n 2))))))

(defun fib (n)
  (cond
    ((= n 0) 1)
    ((= n 1) 1)
    (t (combine (fib (- n 1)) (fib (- n 2))))))

(fib 8)
------------------------------------------------------------
(defun atoms-to-q (x)
  (cond
    ;;;((null x) nil)
((atom x) 'q)
(t (cons (atoms-to-q (car x))
	 (atoms-to-q (cdr x))))))
(atoms-to-q '(((a b) c) d))
(atom '((ab)))

------------------------------------------------------------
(defun count-atoms (x)
  (cond
    ((atom x) 1)
       (t (+ (count-atoms (car x)) (count-atoms (cdr x))))))
(car (car '(((a b)))))
			      
(count-atoms '(a (b) c))

'(a (b) c)
   
------------------------------------------------------------
(defun count-cons (x)
  (cond
    ((atom x) 0)
    (t (+ 1 (count-cons (car x)) (count-cons (cdr x))))))

(count-cons 'fred)
(count-cons '(FOO BAR))
(COUNT-CONS '((FOO)))
------------------------------------------------------------
Write a function SUM-TREE that returns the sum of all the numbers
appearing in a tree. Nonnumbers should be ignored. (SUM-TREE ’((3
BEARS) (3 BOWLS) (1 GIRL))) should return seven.

(defun sum-tree (x)
  (cond
    ((atom x) (list x))
    (t (append (sum-tree (car x)) (sum-tree (cdr x))))))


(defun sum-tree (x)
  (cond
    ((atom x) (list x))
    ((numberp (car x)) (append (sum-tree (car x)) (sum-tree (cdr x))))
  (t  (append (sum-tree (car (cdr (car x)))) (sum-tree (cdr x))))))


(defun sum-tree (x)
  (cond
    ((atom x) (list x))
    ((numberp (car x)) (append (car x) (sum-tree (cdr x))))
  (t  (append (sum-tree (car x)) (sum-tree (cdr x))))))


(defun num-tree (x)
  (cond
    ((listp x) (num-tree (car x)))
    ((numberp x) (list x))
    (t (list (num-tree (car x)) (num-tree (cdr x))))))

(nUM-TREE '((3 BEARS) (3 BOWLS) (1 GIRL)))

(defun sum-tree (x)
  (cond
    ((numberp x) x )
((atom x) 0)
(t (+ (sum-tree (car x))
(sum-tree (cdr x))))))

(SUM-TREE '((3 BEARS) (3 BOWLS) (1 GIRL)))

(reduce #'+ (remove-if-not #'numberp (reduce #'append '((3 BEARS) (3 BOWLS) (1 GIRL)))))

(sum-tree '(3 4 5))



n

------------------------------------------------------------
### challenge: write a function that returns all numerical values of a set of lists.

(defun num-all (x)
  (remove-if-not #'numberp (flatten x)))

(num-all '((3 BEARS) (3 BOWLS) (1 GIRL)))


(defun num-tree (x)
  (cond
    ((listp x) (num-tree (car x)))
    ((numberp x) (list x))
    (t (list (num-tree (car x)) (num-tree (cdr x))))))

(nUM-TREE '((3 BEARS) (3 BOWLS) (1 GIRL)))
------------------------------------------------------------


(defun flatten (x)
  (cond
     ((atom x) (list x))
     (t  (append (flatten (car x)) (flatten (cdr x))))))




(flatten '(a (b c) d))
(flatten '(a (c d (f g (h i)))))
(cdr '(a s))
(car '((C D (F G (H I)))))
(cons (car (car '((C D (F G (H I)))))) (cdr '(a (c d (f g (h i))))))
					
(cdr '((a b) b))
(atom 'fred)
(flatten '((ahoj)))
(flatten '(a ((a)) (b)))

(car (car (car '((((a)) b)))))
(flatten '(a ((a)) (b)))
(cdr '((c) ((a)) (b)))

(cdr '(a (a b)))

  (flatten '(a (b) ((c))))

------------------------------------------------------------
paren-depth

(defun paren-depth (tree)
  (cond
    ((null tree) 0)
    ((atom (car tree)) (paren-depth (cdr tree)))
    (t (+ 1 (paren-depth (car tree)) (paren-depth (cdr tree))))))

(defun paren-depth (tree)
  (cond
    ((atom tree) 1)
    ((atom (car tree)) (paren-depth (cdr tree)))
  (t (+ (paren-depth (car tree)) (paren-depth (cdr tree))))))
(paren-depth '(a (a (a))))
(paren-depth '(A B X Z ((C) D) E))

(max 2 3)

(defun paren-depth (list)
(cond ((atom list) 0)
(t (max (+ 1 (paren-depth (first list)))(paren-depth (rest list))))))


------------------------------------------------------------
(defun count-up (x)
  (cond
    ((= x 0)  (list 0))
    (t (append  (count-up (- x 1)) (list x)))))
(count-up 5)

------------------------------------------------------------
(defun make-loaf (x)
  (cond
    ((= x 0) nil)
    (t (append (list 'X) (make-loaf (- x 1))))))


(defun make-loaf (x)
  (if
   (= x 0)
   nil
   (append (list 'X) (make-loaf (- x 1)))))

(make-loaf 4)
------------------------------------------------------------
Write a recursive function BURY that buries an item under n levels of
parentheses. (BURY ’FRED 2) should return ((FRED)), while (BURY
’FRED 5) should return (((((FRED))))). Which recursion template did
you use?

(defun bury (x num)
  (cond
    ((= num 0) x)
    (t (bury (list x) (- num 1)))))
       
    (t (bury x (- num 1)))))

(bury 'fred 2)



------------------------------------------------------------
Write PAIRINGS, a function that pairs the elements of two lists.
(PAIRINGS ’(A B C) ’(1 2 3)) should return ((A 1) (B 2) (C 3)). You
may assume that the two lists will be of equal length.

(defun pairing (a b)
  (cond
    ((null a) nil)
    (t (cons (list (car a) (car b)) (pairing (cdr a) (cdr b))))))

(pairing '(a b c) '(1 2 3))


------------------------------------------------------------
;;;Write SUBLISTS, a function that returns the successive sublists of a list. (SUBLISTS ’(FEE FIE FOE)) should return ((FEE FIE FOE) (FIE  FOE) (FOE)).

(defun sublists (x)
  (cond
    ((null x) nil)
    (t (cons x (sublists (cdr x))))))

(SUBLISTS '(FEE FIE FOE))

------------------------------------------------------------
The simplest way to write MY-REVERSE, a recursive version of
REVERSE, is with a helping function plus a recursive function of two
inputs. Write this version of MY-REVERSE.

(defun my-reverse (x)
  (r-dd x (length x)))


  (defun r-dd (x n)
  (cond
    ((= n 0) nil)
    (t (append (r-dd (cdr x) (- n 1)) (list (car x))))))
      

(my-reverse '(3 2 1))

------------------------------------------------------------
Write MY-UNION, a recursive version of UNION.

(union '(1 2 3 4 5 5) '(4 5 6 6 7 8))
(3 2 1 4 5 6 6 7 8)
(3 2 1 4 5 6 6 7 8)
(3 2 1 4 5 6 6 7 8)
(3 2 1 4 5 6 6 7 8)

(4 5 1 2 3 5 6 6 7 8)
(append (append '(4 5) '(1 2 3 5)) '(6 6 7 8))




(3 2 1 4 5 6 6 7 8)
(union nil '(1 2))
(1 2)

(defun my-union (x y)
  (cond
   ((null x) nil)
   ((null y) nil)
   ((equal (car x) (car y)) (cons (car x) (my-union (cdr x) (cdr y))))
   ((equal (car x) (car (cdr y))) (cons (car x) (my-union (cdr x) (cdr y))))
   (t (cons (list (car x) (car y)) (my-union (cdr x) (cdr y))))))

((equal (car x) (car (cdr y))) (cons (car x) (my-union (cdr x) y)))
(my-union '(8 5 3) '(8 4 5))
8+
53 45
55 5+
3 5
35+

8535


(my-union '(a s d f g) '(v w s r a))
((A V) S (D W) (F S) (G R))
(A S D F G V W R)
8+
53 45
5 5 5+
3 45
3 4 +
8 5 3 4

8 5 3 4



8
53 45
5 3 5

   ((t (cons (cons (car x) (list (car y))) (my-union (cdr x) (cdr y))))))


(max 4 5)

55384

((4 3) (5 8) (5 4) (3 5))
4
(union '(4 5 5 3) '(3 8 4 5 5 5))
(3 8 4 5 5 5)

(cons 3 4 ())

------------------------------------------------------------
Write LARGEST-EVEN, a recursive function that returns the largest
even number in a list of nonnegative integers. (LARGEST-EVEN ’(5 2
4 3)) should return four. (LARGEST-EVEN NIL) should return zero.
Use the built-in MAX function, which returns the largest of its inputs.

(defun largest-even (x)
  (cond
    ((null x) 0)
    ((oddp (car x)) (largest-even (cdr x)))
    (t (max (car x) (largest-even (cdr x))))))
       
(largest-even '(5 2 4 10008 3))
(largest-even nil)

------------------------------------------------------------
Write a recursive function HUGE that raises a number to its own
power. (HUGE 2) should return 2 2 , (HUGE 3) should return 3 3 = 27,
(HUGE 4) should return 4 4 = 256, and so on. Do not use REDUCE.

(defun huge (x)
(help x x))
  (defun help (x y)
    (cond
      ((= y 0) 1)
      (t (* x (help x (- y 1))))))

(huge 5)
3125


------------------------------------------------------------
Write EVERY-OTHER, a recursive function that returns every other
element of a list—the first, third, fifth, and so on. (EVERY-OTHER
’(A B C D E F G)) should return (A C E G). (EVERY-OTHER ’(I  CAME I SAW I CONQUERED)) should return (I I I).

(defun odd-rec (list)
(cond ((null list) nil)
      (t (cons (car list) (odd-rec (rest (rest list)))))))

(odd-rec '(1 3 1 3 1 3 1))
(odd-rec '(I  CAME I SAW I CONQUERED))

------------------------------------------------------------
Write LEFT-HALF, a recursive function in two parts that returns the
first n/2 elements of a list of length n. Write your function so that the
list does not have to be of even length. (LEFT-HALF ’(A B C D E))
should return (A B C). (LEFT-HALF ’(1 2 3 4 5 6 7 8)) should return
(1 2 3 4). You may use LENGTH but not REVERSE in your
definition.

(defun left-half (x)
  (left-help x (left-length x)))

(left-half '(1 2 3 4 5 6 7 8 9))

(defun left-length (x)
  (cond
    ((oddp (length x)) (+ (floor (/ (length x) 2)) 1))
    (t (/ (length x) 2))))
(defun left-help (x y)
  (cond
    ((= 0 y) nil)
    ((null x) nil)
    (t (cons (car x) (left-help (cdr x) (- y 1))))))

------------------------------------------------------------
Write MERGE-LISTS, a function that takes two lists of numbers, each
in increasing order, as input. The function should return a list that is a
merger of the elements in its inputs, in order. (MERGE-LISTS ’(1 2 6  8 10 12) ’(2 3 5 9 13)) should return (1 2 2 3 5 6 8 9 10 12 13).

(defun merge-lists (x y)
  (cond
    ((null x) y)
    ((null y) x)
    ((< (car x) (car y)) (cons (car x) (merge-lists (cdr x) y)))
    (t (cons (car y) (merge-lists x (cdr y))))))

(MERGE-LISTS '(1 2 6  8 10 12) '(2 3 5 9 13))
(1 2 2 3 5 6 8 9 10 12 13)
(1 2 2 3 5 6 8 9 10 12 13)

------------------------------------------------------------
(defun sp-fact (x)
  (cond
    ((= x 0) 1)
    (t (/ (sp-fact (+ x 1)) (+ x 1)))))

(sp-fact 0)

------------------------------------------------------------
(setf family
'((colin nil nil)
(deirdre nil nil)
(arthur nil nil)
(kate nil nil)
(frank nil nil)
(linda nil nil)
(suzanne colin deirdre)
(bruce arthur kate)
(charles arthur kate)
(david arthur kate)
(ellen arthur kate)
(george frank linda)
(hillary frank linda)
(andre nil nil)
(tamara bruce suzanne)
(vincent bruce suzanne)
(wanda nil nil)
(ivan george ellen)
(julie george ellen)
(marie george ellen)
(nigel andre hillary)
(frederick nil tamara)
(zelda vincent wanda)
(joshua ivan wanda)
(quentin nil nil)
(robert quentin julie)
(olivia nigel marie)
(peter nigel marie)
(erica nil nil)
(yvette robert zelda)
(diane peter erica)))
-----------------------------------------------------------
(defun father (x)
  (h-father x family))
(defun h-father (x family)
  (cond
    ((null x) nil)
    ((equal x (car (car family))) (car (cdr (car family))))
    (t (h-father x (cdr family)))))

(defun a-father (y)
  """applicative fahter"""
  (cond
    ((null y) nil)
    (t   (second (car (remove-if-not #'(lambda (x) (equal y (car x))) family))))))

(a-father nil)
(father 'peter)
------------------------------------------------------------
(defun mother (x)
  (h-mother x family))

(defun h-mother (x family)
  (cond
    ((null x) nil)
    ((equal x (car (car family))) (car (cdr (cdr (car family)))))
    (t (h-mother x (cdr family)))))

(mother 'diane)

------------------------------------------------------------
(defun parents (x)
 (single-parent x family))

(defun single-parent (x family)
  (cond
    ((null x) nil)
        ((car (h-parents x family)) (h-parents x family))
    (t (cdr (h-parents x family)))))

(single-parent 'colin family)
(parents 'colins)
(parents 'colin)

(defun h-parents (x family)
  (cond
((null family) nil)
    ((null x) nil)
        ((equal x (car (car family))) (list (car (cdr (car family))) (car (cdr (cdr (car family))))))
    (t (h-parents x (cdr family)))))

(h-parents 'colin family)

(parents 'diane)
(parents 'frederick)

(if (car (cdr (car (cdr family))))
    '(1)
    '(2))

------------------------------------------------------------
(defun children (x)
  (help-children x family))
(defun help-children (x family)
  (cond
    ((null x) nil)
    ((null family) nil)
    ((equal x (second (car family))) (cons (first (car family)) (help-children x (cdr family))))
        ((equal x (third (car family))) (cons (first (car family)) (help-children x (cdr family))))
    (t (help-children x (cdr family)))))

(children 'quentin)


------------------------------------------------------------
(defun siblings (x)
  (remove x (union (car (mapcar #'children  (parents x))) (second (mapcar #'children  (parents x))))))

(siblings 'bruce)(CHARLES DAVID ELLEN)
(siblings 'colin)NIL
(siblings 'zelda)(JOSHUA)




------------------------------------------------------------

							     
(defun siblings (x family)
  (cond
  ((null family) nil)
  ((null x) nil)
     ((null (car (parents x))) nil)
;;;((equal (car (car family)) x) (siblings x (cdr family)))
     ((equal (parents x)  (first-parents family)) (cons (car (car family)) (siblings x (cdr family))))
  (t (siblings x (cdr family)))))

(siblings 'colins family)

(parents 'colins)
(parents 'colins)

(defun def-siblings (z)
  (remove z (siblings z family)))


(def-siblings 'bruce)

  
(defun first-parents (family)
  (parents (car (car family))))

(second (first-parents (cdr (cdr (cdr (cdr (cdr (cdr (cdr family)))))))))

(setf x 'zelda)
(defun half-siblings (x family)
  (cond
  ((null family) nil)
  ((null x) nil)
  ((null (car (parents x))) nil)
  ((and (first (parents x)) (second (parents x))) nil)
;;;((equal (car (car family)) x) (siblings x (cdr family)))
((equal (second (parents x))  (second (first-parents family))) (cons (first (car family)) (half-siblings x (cdr family))))
((equal (car (parents x))  (car (first-parents family))) (cons (car (car family)) (half-siblings x (cdr family))))
  (t (half-siblings x (cdr family)))))

(half-siblings 'julie family)

(defun def-half-siblings (x)
  (remove x (half-siblings x family)))



(def-half-siblings 'zelda)
(def-half-siblings 'joshua)
(def-siblings 'zelda)
(def-siblings 'julie)
(def-siblings 'quentin)
(siblings 'quentin family)
(def-half-siblings 'quentin)
(siblings 'zelda family)
(siblings 'julie family)
(def-half-siblings 'julie)
(def-siblings 'hillary)
(def-siblings 'george)

(defun def-siblings (x)
  ''' final function '''
  (cond
    ((and (siblings x family) (def-half-siblings x)) (cons (siblings x family) (def-half-siblings x)))
    ((null (siblings x family)) (def-half-siblings x))
    ((null (def-half-siblings x))(siblings x family))
    (t nil)))

(def-siblings 'joshua)
(def-siblings 'colin)
(def-siblings 'nesmysl)
(def-siblings 'zelda)
(def-siblings 'julie)
(def-siblings 'hillary)

------------------------------------------------------------

(defun mapunion (fun list)
  (mapcar #'(lambda (x) (fun x)) list))

(mapunion rest '(a b c))

------------------------------------------------------------
(defun grandparents (x)
(reduce #'append  (mapcar #'parents (parents x))))

(grandparents 'vincent)(ARTHUR KATE COLIN DEIRDRE)
    
------------------------------------------------------------
(defun cousins (x)
  (reduce #'append (remove nil (mapcar #'children  (set-difference  (reduce #'union (mapcar #'children (grandparents x))) (parents x))))))

(cousins 'julie)
  

------------------------------------------------------------
(defun descended-from (a b)
  (cond
    ((null a) nil)
    ((null b) nil)
    ((equal (h-pair b) (parents a)) t)
    (t (descended-from a (car (children b))))))
(descended-from 'tamara 'colin)

(h-pair 'colin)(COLIN DEIRDRE)
(parents 'tamara)(BRUCE SUZANNE)
(children 'colin)(SUZANNE)
(descended-from 'tamara 'suzanne)
(h-pair 'suzanne)(BRUCE SUZANNE)
(parents 'tamara)(BRUCE SUZANNE)



(equal (h-pair 'suzanne) (parents 'tamara))

(cond ((member 'colin (parents 'suzanne)) t))

(defun h-pair (x)
  (pair x family))
(defun pair (x m-family)
  (cond
    ((null x) nil)
    ((null m-family) nil)
    ((member x (list (second (car m-family)) (third (car m-family)))) (list (second (car m-family)) (third (car m-family))))
    (t (pair x (cdr m-family)))))

(pair 'dthur family)

(setf m-family '(
(tamara bruce suzanne)
(vincent bruce suzanne)
(wanda nil nil)
(ivan george ellen)
(julie george ellen)
(marie george ellen)
(nigel andre hillary)
(frederick nil tamara)
(zelda vincent wanda)
(joshua ivan wanda)
(quentin nil nil)
(robert quentin julie)
(olivia nigel marie)
(peter nigel marie)
(erica nil nil)
(yvette robert zelda)
(diane peter erica)))


(descended-from 'tamara (first (children 'colin)))
(member 'tamara (parents 'zelda))

(defun h-parents (x family)
  (cond
((null family) nil)
    ((null x) nil)
        ((equal x (car (car family))) (list (car (cdr (car family))) (car (cdr (cdr (car family))))))
    (t (h-parents x (cdr family)))))

(defun parents (x)
 (single-parent x family))

(defun single-parent (x family)
  (cond
    ((null x) nil)
        ((car (h-parents x family)) (h-parents x family))
    (t (cdr (h-parents x family)))))

(descended-from 'zelda 'vincent)
(descended-from 'zelda 'suzanne)

(parents 'zelda)

(parents (first '(VINCENT WANDA)))
(parents 'vincent)


------------------------------------------------------------
(format t "hi")


(format t "Hi, ~%~%mom!")
(format t "Z ~S do ~S za ~S minut" 'Prahy 'Pacova 150)
------------------------------------------------------------
(format t "There are old pilots ~&there are bold pilots ~&but there are no old bold pilots")
------------------------------------------------------------
(defun draw-line (n)
  (cond
    ((= n 0) (format t "~&"))
    ((not (numberp n)) nil)
    (t (format t "*") (draw-line (- n 1)))))

(draw-line 0)

(cons (format t "*") (format t "*"))
------------------------------------------------------------
(defun draw-box (a b)
(cond
  ((= a 0) nil)
  ((= b 0) nil)
  (t (draw-line a) (draw-box a (- b 1)))))

(draw-box 10 5)
------------------------------------------------------------
(defun ninety-nine (x)
  (cond
    ((= x 0) (format t "~&no beer left"))
    (t   (format t "~&~S bottles of beer on the wall,
~S bottles of beer!
Take one down,
Pass it around,
~S bottles of beer on the wall." x x (- x 1)) (ninety-nine (- x 1)))))

(ninety-nine 98)
------------------------------------------------------------
Part of any tic-tac-toe playing program is a function to display the
board. Write a function PRINT-BOARD that takes a list of nine
elements as input. Each element will be an X, an O, or NIL. PRINT-
BOARD should display the corresponding board. For example,
(PRINT-BOARD ’(X O O NIL X NIL O NIL X)) should print:

(defun print-board (x)
  (cond
    ((null x)  nil)
        ((and (= (length x) 4) (equal (car x) 'X)) (format t "~S~&------
" 'X) (print-board (cdr x)))
     ((and (= (length x) 4) (equal (car x) '0)) (format t "~S~&------
" '0) (print-board (cdr x)))
          ((and (= (length x) 4) (equal (car x) nil)) (format t " ~&-------
" ) (print-board (cdr x)))

        ((and (= (length x) 7) (equal (car x) 'X)) (format t "~S|~&--------
" 'X) (print-board (cdr x)))
     ((and (= (length x) 7) (equal (car x) '0)) (format t "~S|~&--------
" '0) (print-board (cdr x)))
          ((and (= (length x) 7) (equal (car x) nil)) (format t " |~&---------
" nil) (print-board (cdr x)))

	  
    ((equal (car x) 'X) (format t "~S|" 'X) (print-board (cdr x)))
    
    ((equal (car x) 'O) (format t "~S|" 'O) (print-board (cdr x)))
	(t (format t " |") (print-board (cdr x)))))

(print-board '(X O O nil X NIL O nil X))
(mapcar #'tryi '(X O O nil X NIL O nil X))
(print-board '(X O O))

(defun tryi (x)
  (cond
    ((equal x 'X) (format t "X"))
    ((equal x 'O) (format t "O"))
    ((equal x nil) (format t " "))))
(tryi 'O)

(mapcar #'tryi '(X O nil))



(print-board 'x 0 0 nil 'x nil 0 nil 'x) 




(sublis '((ndl . d ) '(ndl are red)))
(sublis '((roses . violets) '(roses are red))


(defun print-board (x)
  (cond
    ((null x)  (format t "~&"))
    ((and (= (length x) 1) (null (car x))) (format t "  ") (print-board (cdr x)))
((= (length x) 1) (format t "~S" (car x)) (print-board (cdr x)))
    ((and (= (length x) 4) (null (car x))) (format t "~&----------~&" (car x)) (print-board (cdr x)))
((= (length x) 4) (format t "~S~&----------~&" (car x)) (print-board (cdr x)))

    ((and (= (length x) 7) (null (car x))) (format t "~&----------~&" (car x)) (print-board (cdr x)))
((= (length x) 7) (format t " ~S ~&-----------~&" (car x)) (print-board (cdr x)))

    ((equal (car x) 'X) (format t "~S | " 'X) (print-board (cdr x)))
    
    ((equal (car x) 'O) (format t "~S | " 'O) (print-board (cdr x)))

    (t (format t "  | ") (print-board (cdr x)))))


(print-board '(X O nil nil X O X O X))

(setf a '(1 2 3 4))
(setf a (nth 3 a) 4)





(defun print-board (b)
(let ((b2 (sublis '((x
. "X")
(o
. "O")
(nil . " "))
b)))
(format t "~&")
(print-line b2)
(format t "-----------~%")
(print-line (nthcdr 3 b2))
(format t "-----------~%")
(print-line (nthcdr 6 b2))))

(defun print-line (line)
(format t " ~A | ~A | ~A~%"
(first line)
(second line)
(third line)))
------------------------------------------------------------
. Write a function to compute an hourly worker’s gross pay given an
hourly wage in dollars and the number of hours he or she worked.
Your function should prompt for each input it needs by printing a
message in English. It should display its answer in English as well.

(defun pay ()
  (format t "Jaka je vase hodinova mzda? ")
  (let ((x (read)))
  (format t "Jaky je pocet odpracovanych hodin? ")
  (let ((y (read)))
    (format t "hruba mzda cini ~S Kc~%" (* x y)))))

(pay)

------------------------------------------------------------

(defun cookie-monster ()
  (format t "Dej mi susenku!!!~%Susenka? ")
  (let ((x (read)))
    (cond
      ((equalp x 'susenka) (format t "MMM. Ta je dobra..."))
      (t  (format t "Nikdo nechce ~S~%" x) (cookie-monster)))))

(equal 'SUSENKA "Susenka")
(cookie-monster)
(ahoj nejvetsi)

------------------------------------------------------------
(defun space-over (x)
  (cond
((< x 0) (format t "Error!"))
    ((= 0 x) nil)
    (t (format t " ") (space-over (- x 1)))))

(space-over 3)

(defun test (n)
(format t "~%>>>")
(space-over n)
(format t "<<<"))

(test 5)

------------------------------------------------------------
(defun plot-one-point (y-val plotting-string)
  (space-over y-val)
  (format t "~A~%" plotting-string))

(plot-one-point 3 "ahoj")
------------------------------------------------------------
(defun plot-points (str lst)
  (mapcar #'(lambda (x) (plot-one-point x str)) lst))


(defun plot-points (str lst)
  (cond
    ((null lst) nil)
    (t (plot-one-point (car lst) str) (plot-points str (cdr lst)))))
   

(plot-one-point 0 "<>")

(plot-points "<>" '(4 6 8))

(PLOT-POINTS "< >" '(4 6 8 10 8 6 4))
------------------------------------------------------------
Write a function GENERATE that takes two numbers M and N as
input and returns a list of the integers from M to N. (GENERATE -3
								3) should return (-3 -2 -1 0 1 2 3).


(defun generate (m n)
  (cond
    ((= m n) nil)
    (t (cons n (generate  m  (- n 1))))))

(generate -4 10)
------------------------------------------------------------
(defun make-graph ()
  (format t "func:")
  (let ((x (read)))
    (format  t "start:")
    (let ((y (read)))
      (format t "end:")
      (let ((z (read)))
	 (format t "plotting-string:")
            (let ((a (read)))
(plot-points a (mapcar #'x (generate y z))))))))

(make-graph)

(defun square (x)
  (* x x))


(format t "end: ~%")








  
 ;;; (let ((y (read)))  
;;					      (let ((z (read))) (let ((a (read)))
(format t "~S ~S ~S ~S" x)));;; y)))); z a)
  

(defun small-read ()
  (format t "co se ma vytisknout? ")

(let ((x (read))) (format t "~S" x)))
(small-read)


------------------------------------------------------------
(setf *friends* nil)
(setf a 0)
(defun meet (person)

  (cond
    ((equal person (first *friends*)) 'we-just-met)
((member person *friends*) (incf a) 'we-know-each-other)
(t (push person *friends*)   'pleased-to-meet-you)))

(meet 'bořivoj)
(meet 'clara)
a
*friends*
------------------------------------------------------------



Write a function FORGET that removes a person from the *FRIENDS*
list. If the person wasn’t on the list in the first place, the function
should complain.
(setf x 'bořivoj)
(defun forget (x)
  (cond
    ((member x *friends*) (setf *friends* (remove x *friends*)))
    (t 'never-been-friends)))
*friends*
(forget 'radek)
------------------------------------------------------------

(defun ugly (x y)
(when (> x y)
(setf temp y)
(setf y x)
(setf x temp))
(setf avg (/ (+ x y) 2.0))
(setf pct (* 100 (/ avg y)))
(list 'average avg 'is
      pct 'percent 'of 'max y))

(ugly 3 4)


(defun ugly (x y)
  (when (> x y)
    (let* ((temp y) (y x) (x temp) 
(setf avg (/ (+ x y) 2.0))
(setf pct (* 100 (/ avg y)))
(list 'average avg 'is
      pct 'percent 'of 'max y))


(let ((last-name nil)
(first-name nil)
(middle-name nil)
(title nil))

(* 37 135)4995

------------------------------------------------------------
(defun it-member (a b)
  (dolist (e b nil)
;;;    (format t "~&~S" e)
(if (equal a e) (return t))))
   (it-member 'bracda '(bracha segra))
------------------------------------------------------------
(defun it-assoc (a list)
  (dolist (el list nil)
    (cond
      ((equal a (car el)) (return el)))))

(setf list '((syn dcera) (tata mama) (deda babicka)))

(assoc 'tata list)
(TATA MAMA)

(it-assoc 'tdata list)
(TATA MAMA)
------------------------------------------------------------
(defun check-all-odd (list)
  (cond
    ((null list) t)
    ((oddp (car list)) (format t "~&Checking ~S" (car list)) (check-all-odd (cdr list)))
    (t (format t "~&Checking ~S" (car list)) nil)))

(check-all-odd '(1 8 5 7))


------------------------------------------------------------
(defun it-length (list)
  (let ((len 0))
    (dolist (elem list len)
      (setf len (+ len 1)))))
  

(it-length '())


(defun it-fact (n)
(let ((prod 1))
(dotimes (i n prod)
  (setf prod (* prod (+ i 1))))))



------------------------------------------------------------
(defun it-nth (num list)
(let (a (car list))
  (dotimes (i num a)
    (push (car list) a))))

(it-nth 3 '(1 2 3 4))
    
(defun it-nth (num list)
(let ((a -1))
  (dolist (e list)
    (incf a)
    (if (equal a num) (return e)))))
(it-nth 2 '(7 8 9 104))
(nth 2 '(7 8 9 104))
    
(nth 3 '(1 2 3 4))4

  
------------------------------------------------------------


(defun it-reverse (list)
(let ((a nil))
  (dolist (e list a)
    (push e a))))
  
(it-reverse '(1 2 3 4 5))



------------------------------------------------------------



;;;Write a function that combines two lists by alternatingly taking elements, e. g. [a,b,c], [1,2,3]  [a,1,b,2,c,3].

(defun combine (one two)
(reduce #'append (mapcar #'(lambda (x y) (reverse (cons y (cons x ()))))  one two)))

		  
(combine '(1 2 3) '(a b c))
------------------------------------------------------------
   

;;;Write a function that returns the elements on odd positions in a list.


(defun odd-rec (list)
(cond ((null list) nil)
      (t (cons (car list) (odd-rec (rest (rest list)))))))

(odd-rec '(1 3 1 3 1 3 1))
------------------------------------------------------------
write a functions that computes a list of 100 fibonacci numbers

(defun fib (n);;; fib
  (cond
    ((= n 0) 1)
    ((= n 1) 1)
    (t (+ (fib (- n 1)) (fib (- n 2))))))

(fib 8)

(defun list-fib (n) ;;; list fib
  (cond
    ((= n 0) (list n))
    ((= n 1) (list n))
    (t (cons (fib n) (list-fib (- n 1))))))

(list-fib 100)


(121393 75025 46368 28657 17711 10946 6765 4181 2584 1597 987 610 377 233 144
 89 55 34 21 13 8 5 3 2 1)


(defun count-do
    wn (x)
  (cond
    ((= x 0) (list 0))
    (t (cons x (count-down (- x 1))))))

(reverse (count-down 5))

  
------------------------------------------------------------

;;; Write a function that takes a number and returns a list of its digits.

(defun list-of-digits (n)
  (reverse (list-num n) ))

(defun list-num (n)
    (cond
    ((< n 10) (list n))
    (t (cons (mod (floor  n) 10) (list-num (min-ord n))))))

(defun last-digit (n)
  (mod (floor  n) 10))

(defun min-ord (n)
  (/ (- n (last-digit n)) 10))



(list-of-digits 7654)
(list-num 7654)
(last-digit 537)
(min-ord 537)


------------------------------------------------------------
(defun r-sum (x)
  (cond
    ((null x) 0)
    ((= (length x) 1) (car x))
    (t (* (car x) (r-sum (cdr x))))))

(r-sum '(1 2 3 4 5))
(r-sum '(2))

------------------------------------------------------------
Write a function that rotates a list by k elements. For example [1,2,3,4,5,6] rotated by two becomes [3,4,5,6,1,2]. Try solving this without creating a copy of the list. How many swap or move operations do you need?

------------------------------------------------------------
From arabic to roman

(setf rom '((0 0)
    (1 I)
    (2 II)
    (3 III)
    (5 V)
    (10 X)
    (50 L)
    (100 C)
    (500 D)
	    (1000 M)))

(car (cdr (assoc 1 rom)))


(defun arab-roman (x)
  (cond
    ((= x 0) nil)
    ((< x 4)(car (cdr (assoc x rom))))
        ((< x 5) (list (arab-roman (- x (- x 1))) (arab-roman (+ x 1))))
	((= x 5) (car (cdr (assoc x rom))))
((< x 9) (list (arab-roman 5) (arab-roman (- x 5))))
((< x 10) (list (arab-roman 1) (car (cdr (assoc 10 rom)))))
((= x 10) (car (cdr (assoc x rom))))
((< x 14) (list (arab-roman 10) (arab-roman (- x  10))))
((= x 15) (car (cdr (assoc x rom))))))

(arab-roman 13)

    ((= x 3) III)
    ((= x 5) V)
    ((= x 10) X)
    ((= x 50) L)
    ((= x 100) C)
    ((= x 500) D)
    ((= x 1000) M)

  (setf *ds-glasses* 0)

(defun sell (n)
"Ye Olde Lemonade Stand: Sales by the Glass."
(incf *ds-glasses*  n)
(format t
"~&That makes ~S glasses so far today."
*ds-glasses*))

(sell 3)
(sell 5)

(setf *ds-glasses* 3)


(defun it-fact (x)
(let ((a 1))
  (dotimes (i x a)
(setf a (* a (+ i 1))))))


(defun all-primes (x)
    (dotimes (i x)
    (format t "~&~S....~S" i (is-prime i))))

(all-primes 1000)

(/ 200.0 33.0)

(defun is-prime (x)
  (cond
    ((oddp x)
  (dotimes (i (floor (/ x 2)) t)
;;;    (format t "~&~S" i)))
;;; (format t "~&~S" (+ 2 i))))
    (if (= (mod x (+ 2 i)) 0) (return nil))))
    (t nil))))



(time (iss-prime 1434445))


(defun launch (n)
  (do ((cnt n (- cnt 1)))
 ((zerop cnt) (format t "Blast off!"))
    (format t "~S..." cnt)))

(launch 5)

(defun launch2 (n)
(let ((a n))
  (dotimes (i n (format t "Blast-off"))
    (format t "~S..." (+ i a))
(setf a (- a 2)))))

(launch2 8)


------------------------------------------------------------

(defun check-all-odd (x)
  (do ((cnt (length x) (- cnt 1)))
      ((= cnt 0) (return t))
    (if
     (not (oddp (nth (- cnt 1) x)))
     (return nil))))
(check-all-odd '(5 7 9 15 14))

------------------------------------------------------------

(defun find-largest (x)
(let ((a (car x)))
  (dolist (i (cdr x) a)
    (if
     (> i a)
     (setf a i)))))

(defun find-largest (x)
  (do*
   ((i (car x) (cdr x))
    
   (z    (if
     (> i a)
     (setf a i)))))


(find-largest '(400 -10 2 3 40 18))

(defun find-largest (list-of-numbers)
(let ((largest (first list-of-numbers)))
(dolist (element (rest list-of-numbers)
largest)
(when (> element largest)
  (setf largest element)))))

(defun find-largest (list-of-numbers)
  (do* ((largest (car list-of-numbers))
	(z  (cdr list-of-numbers) (cdr z))
	(element (first z) (first z)))
(       (null z) largest)
(when (> element largest)
  (setf largest element))))

(find-largest '(1 2 3))

------------------------------------------------------------
11.12. Rewrite the following function to use DO instead of DOTIMES.
(defun power-of-2 (n) ;2 to the Nth power.
(let ((result 1))
(dotimes (i n result)
  (incf result result))))

(power-of-2 3)

(defun power-of-two (n)
  (do
   ((z 0 (+ 1 z)))
    (equal n z) 


    (   format t "~&Ahoj")))
(power-of-two 5)
    
(defun count-slices (loaf)
(do ((cnt 0 (+ cnt 1))
(z loaf (rest z)))
((null z) cnt)))




------------------------------------------------------------
(defun first-non-integer (x)
"Return the first non-integer element of X."
(do* ((z x (rest z))
(z1 (first z) (first z)))
((null z) ’none)
(unless (integerp z1)
  (return z1))))

(defun first-non-int (x)
    (let (z (car x))
     (dolist (f x z)
       (unless 
	   (integerp f) (setf z f)))))


(first-non-int '(1 2 3 4 4.5))
(* 24 27)

------------------------------------------------------------

(unless (= 1 2) 5)

(defun ffo-with-do (x)
(do ((z x (rest z))
(e (first x) (first z)))
((null z) nil)
(if (oddp e) (return e))))

(ffo-with-do '(2 4 6 7 8))


(defun read-a-number ()
(do ((answer nil))
(nil)
(format t "~&Please type a number: ")
(setf answer (read))
(if (numberp answer)
(return answer))
(format t
"~&Sorry, ~S is not a number. Try again."
answer)))

(read-a-number)

(- 15 7)

(- 40 8)

(dotimes (i 5 i)
  (format t "~&I = ~S" i))

Rewrite the DOTIMES expression in the preceding problem using DO.
Does this help explain the value DOTIMES returns?


  (do
   ((a 1 (+ a 1)))
   ((= 5 a) (return 5))
    (format t "~&I = ~S" a))


------------------------------------------------------------
(defun fib (x)
  (let ((a 0) (b 1) (c 0))
    (dotimes (i x c)
      (setf c (+ a b))
(setf b a)
(setf a c))))

(fib 9)

(defun fib-do (x)
  (do*
   ((a 0 (+ a 1))
    (b 1 c)
    (c 1 d)
        (d (+ c b) (+ c b)))
           ((= a x ) (return d))))


(fib-do 5)
------------------------------------------------------------
(defun complement-base (base)
  (cond
    (    (equal base 'A) 'T)
  (    (equal base 'T) 'A)
(    (equal base 'G) 'C)
(    (equal base 'C) 'G)))


(complement-base 'C)
------------------------------------------------------------
(defun complement-strand (strand)
  (mapcar #'complement-base strand))
(complement-strand '(A G G T))

(defun complement-strand (strand)

  (dolist (i strand a)
    (setf a (list (complement-base i) a))))




    (setf a (list a (complement-base i) ))))


(append a T)
(complement-strand '(A G G T))
  

(T C C A)
------------------------------------------------------------
(defun make-double (num)
  (list num  (complement-base num)))

(defun make-ii (strand)
  (mapcar #'make-double strand))

(make-double 'A)
(make-ii '(G G A C T))

  

  
  
(defun ^ (a) (b)
       (* a a
      
    
   
(defun expo (x)
  (^ 10 x))

(expo 2)
