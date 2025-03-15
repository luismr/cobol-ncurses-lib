       IDENTIFICATION DIVISION.
       PROGRAM-ID. NCURSES-WINDOW.
       AUTHOR. Luis Machado Reis.
       DATE-WRITTEN. 2025-03-14.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WIN-ID             USAGE POINTER.

       LINKAGE SECTION.
       01 WINDOW-WIDTH       PIC 9(3).
       01 WINDOW-HEIGHT      PIC 9(3).
       01 WINDOW-X           PIC 9(3).
       01 WINDOW-Y           PIC 9(3).
       01 SHADOW-ENABLED     PIC X.

       PROCEDURE DIVISION USING WINDOW-WIDTH, 
                                 WINDOW-HEIGHT, 
                                 WINDOW-X, 
                                 WINDOW-Y, 
                                 SHADOW-ENABLED.

       MAIN-PROCEDURE SECTION.
           CALL 'NCURSES-UTIL' USING 'INITIALIZE-NCURSES'.
           PERFORM CREATE-WINDOW.
           PERFORM WAIT-FOR-EXIT.
           STOP RUN.

       CREATE-WINDOW SECTION.
           CALL 'newwin' USING WINDOW-HEIGHT,
                                WINDOW-WIDTH,
                                WINDOW-Y,
                                WINDOW-X
                                RETURNING WIN-ID.
           IF SHADOW-ENABLED = 'Y' THEN
               CALL 'mvwprintw' USING WIN-ID, 
                   WINDOW-HEIGHT, 1, 
                   "Shadow enabled".
           CALL 'wrefresh' USING WIN-ID.

       DISPLAY-WINDOW SECTION.
           CALL 'wrefresh' USING WIN-ID.

       WAIT-FOR-EXIT SECTION.
           DISPLAY "Press any key to exit...".
           CALL 'getch' USING WIN-ID.
           CALL 'delwin' USING WIN-ID.
           CALL 'NCURSES-UTIL' USING 'UNLOAD-NCURSES'.
           EXIT SECTION.

       END PROGRAM NCURSES-WINDOW.
