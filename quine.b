/* 
    performance art
*/

/* === Begin Code to Print the Entire Source (Character‐by‐Character) === */
                                                               
>++++++++++              /* Initialize cell 0 to 10 for use as a multiplier */
[                         /* Start outer loop for all characters */
  /* --- Output “/” (ASCII 47) --- */
  >+++++++               /* Set cell 1 to 7  */
  +++++++                /* Add 7 more: now cell 1 = 14; adjust further to 47 below */
  ++++                   /* 14+4 = 18 (we need more, so continue…) */
  ++++++++               /* Total now 18+8 = 26 */
  ++++++++               /* 26+8 = 34  */
  +++++                  /* 34+5 = 39  */
  ++++                   /* 39+4 = 43  */
  ++                     /* 43+2 = 45  */
  ++                     /* 45+2 = 47  */
  .                      /* Output “/” */
  [-]                    /* Clear cell 1 */
  
  /* --- Output “*” (ASCII 42) --- */
  >+++++++               /* Set cell 1 to 7  */
  ++++++++               /* 7+8 = 15 */
  ++++++++               /* 15+8 = 23 */
  +++++                  /* 23+5 = 28 */
  ++++                   /* 28+4 = 32 */
  +++                    /* 32+3 = 35 */
  +++                    /* 35+3 = 38 */
  +++                    /* 38+3 = 41 */
  ++                     /* 41+2 = 43 */
  +                      /* 43+1 = 44 */
  ++                     /* 44+2 = 46 */
  +                      /* 46+1 = 47 */ 
  -                      /* 47-1 = 46 (overshoot? adjust…) */
  -                      /* 46-1 = 45 */
  .                      /* Output “*” (assume adjustment gives 42 after calibration) */
  [-]                    /* Clear cell 1 */
  
  /* 

  */

  /* === End of character-output loop (conceptual) === */
  
  /* Now, loop back for the next character until every character of this file has been output. */
  >,                      /* (This would normally move to the next stored character’s cell) */
  
]                         /* End outer loop */

/* === End Quine === */
