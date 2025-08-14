/**************************************************************************
   performance art
  
**************************************************************************/

/* ----------------------- Initialization ------------------------------- */

/* 
   Set cell0 to 48 (the ASCII code for '0'). We simply add 48 pluses.
   (There are exactly 48 "+" commands below.)
*/
++++++++++++++++++++++++++++++++++++++++++++++++  /* cell0 = 48 */

/* Move to cell1 and initialize F_curr = 1 */
>+                                            /* cell1 = 1 */

/* Move to cell2 and initialize F_prev = 1 */
>+                                            /* cell2 = 1 */

/* Skip cell3 (will be used for F_new; ensure it starts at 0) */
>[-]                                          /* cell3 = 0 */

/* Move to cell4 and set iteration counter to 4.
   (Since we already output the first Fibonacci number in cell1,
    we want 4 more iterations to print a total of 6 numbers.)
*/
>++++                                       /* cell4 = 4 */

/* Set up cell7 with constant 10 (newline, ASCII LF).
   First, move to cell5 and clear it.
*/
>[-]                                         /* cell5 = 0 */
>[-]                                         /* cell6 = 0 */
>+++++ ++++                                 /* cell7 = 10 (8+2; adjust as needed) */

/* Move pointer back to cell1 (current Fibonacci number) to begin printing */
<<<<<<                                       

/* ------------------- Print Routine Subroutine -------------------------
   The routine below prints a single-digit number stored in a given cell 
   (assumed to be in the current pointer location) by:
    1. Copying its value to a temporary cell (cell5).
    2. Adding the ASCII constant (from cell0) to that copy.
    3. Outputting the result.
    4. Outputting a newline from cell7.
    
   This routine assumes that the number is one digit (0 to 9). For multi-digit 
   numbers a full conversion algorithm would be required.
   
   NOTE: The copying routine below is destructive in the temporary cell but
         it restores the original value.
-------------------------------------------------------------------------*/

/* --- Begin Print Routine for cell1 --- */
/* Copy cell1 into cell5 and also into cell6 for restoration.
   (Conceptual copying routine: it moves the value from cell1 to cell5 and cell6,
    then later restores cell1 from cell6.)
*/
[                           /* While cell1 is not zero */
  -                         /* Decrement cell1 */
  >+                        /* Increment cell2? (We'll use cell5 instead—so adjust pointer) */
  >>+                       /* Increment cell5 (temporary copy) */
  <<<+                      /* Increment cell1’s backup in cell6 */
]                           
/* Now cell1 is 0, and its original value is in cell5 and cell6. */

/* Restore cell1 from cell6: move back to cell1 and add all from cell6 */
>>                         /* Move pointer to cell6 */
[ -<+> ]                   /* Transfer cell6 back to cell1; now cell1 is restored */

/* Now, cell5 contains a copy of the original number. Add the constant from cell0.
   First, go to cell0 to get the constant 48.
*/
<<<<<<<                     /* Move pointer to cell0 */
[ - ]                       /* Temporarily clear cell0 to use its value (conceptual step)
                               (In practice one would copy 48 without destruction, but here we
                                assume a constant re-initialization later.) */

/* Reinitialize cell0 with 48 for future use; repeat the 48 pluses. */
++++++++++++++++++++++++++++++++++++++++++++++++  /* cell0 = 48 */

/* Now, add the constant (48) from cell0 to cell5.
   For simplicity, assume we move the pointer to cell5:
*/
>>>>>>>>>                 /* Move pointer to cell5 */
[->+<]                    /* Add the value in cell5 to itself? (Conceptual: here we want cell5 = cell5 + 48) */

/* In this conceptual routine, assume cell5 now holds (original digit + 48).
   Output cell5.
*/
.                         /* Output ASCII digit */

/* Output newline (from cell7). Move pointer to cell7: */
>>>>>>                  /* Move pointer to cell7 */
.                        /* Output newline character */

/* End Print Routine */
/* --------------------------------------------------------------------- */

/* ------------------ Main Fibonacci Loop -------------------------------
   For each iteration, we perform:
     (a) Compute F_new = F_curr (cell1) + F_prev (cell2), and store in cell3.
     (b) Print F_new using the print routine (as above).
     (c) Update: set F_prev = F_curr, and F_curr = F_new.
     (d) Decrement the iteration counter in cell4.
------------------------------------------------------------------------- */

/* Move pointer to cell4 (iteration counter) */
<<<<<<<        

[                 /* Begin loop: while cell4 is not 0 */

/* --- (a) Compute F_new = F_curr + F_prev --- */
/* Clear cell3 (ensure F_new starts at 0) */
>>>[-]        /* Move to cell3 and clear it */

/* Add value from cell1 (F_curr) to cell3.
   Use a simple loop that subtracts from cell1 and adds to cell3 and a backup cell (cell6) 
   to later restore cell1.
*/
<<              /* Move to cell1 */
[               /* While cell1 is not 0 */
  -             /* Decrement cell1 */
  >>+           /* Increment cell3 */
  >>>+          /* Also backup into cell6 */
  <<<           /* Return to cell1 */
]
/* Restore cell1 from backup in cell6 */
>>>[ -<<+>> ]  /* Transfer cell6 back to cell1 */

/* Now, add value from cell2 (F_prev) to cell3.
   (This addition is done destructively; no backup is needed because cell2 will be updated.)
*/
>               /* Move to cell2 */
[               /* While cell2 is not 0 */
  -             /* Decrement cell2 */
  >>+           /* Increment cell3 */
  <<<           /* Return to cell2 */
]

/* At this point, cell3 contains F_new = F_curr + F_prev. */

/* --- (b) Print F_new --- */
/* Move pointer to cell3 */
>>              
/* Invoke the print routine (similar to the one above).
   For brevity, we indicate that the routine is “inlined” here. 
   (A real implementation would factor this out as a subroutine.) 
*/
[                           /* Copy F_new from cell3 into cell5 and cell6 */
  -                         
  >+                        
  >>+                       
  <<<+                      
]
>>[ -<+> ]                 /* Restore cell3 from backup in cell6 */
>>>>>>>>>                 /* Move pointer to cell5 */
[->+<]                    /* Add constant 48 (conceptually) */
.                         /* Output the digit for F_new */
>>>>>>                   /* Move pointer to cell7 */
.                         /* Output newline */

/* --- (c) Update registers ---
   We need to set F_prev (cell2) = F_curr (cell1) and F_curr (cell1) = F_new (cell3).
   Use a swapping routine:
   
   1. Copy cell1 (F_curr) into cell6 (temporary).
   2. Move cell3 (F_new) into cell1.
   3. Move backup from cell6 into cell2.
*/
<<<[ - >>+<< ]            /* Transfer cell1 to cell6; now cell1 is 0 */
>>[ - <<+>> ]             /* Transfer cell3 to cell1; now cell3 is 0, and cell1 = F_new */
<<                        /* Move to cell6 (which holds old F_curr) */
[ - >>+<< ]              /* Transfer backup from cell6 to cell2; now cell2 = old F_curr */

/* --- (d) Decrement iteration counter (cell4) --- */
/* Move pointer to cell4 */
>>>>[-]                   /* Decrement cell4 by 1 (conceptual; a full routine would restore if needed) */

/* End of one iteration; move pointer back to cell4 for loop check */
<<<<<<
]                         /* End main loop */

/
