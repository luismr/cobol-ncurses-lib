       IDENTIFICATION DIVISION.
       PROGRAM-ID. NCURSES-UTIL.
       AUTHOR. Luis Machado Reis.
       DATE-WRITTEN. 2025-03-14.

       ENVIRONMENT DIVISION.

       DATA DIVISION.

       PROCEDURE DIVISION.

       INITIALIZE-NCURSES SECTION.
           CALL 'initscr'.
           CALL 'cbreak'.
           CALL 'noecho'.
           CALL 'keypad' USING 0, 1.
           CALL 'curs_set' USING 0.
           EXIT SECTION.

       UNLOAD-NCURSES SECTION.
           CALL 'endwin'.
           EXIT SECTION.

       END PROGRAM NCURSES-UTIL.
