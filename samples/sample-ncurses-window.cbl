       IDENTIFICATION DIVISION.
       PROGRAM-ID. sample-ncurses-window.
       AUTHOR. Luis Machado Reis.
       DATE-WRITTEN. 2025-03-14.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WINDOW-WIDTH     PIC 9(3) VALUE 40.
       01 WINDOW-HEIGHT    PIC 9(3) VALUE 10.
       01 WINDOW-X         PIC 9(3) VALUE 5.
       01 WINDOW-Y         PIC 9(3) VALUE 5.
       01 SHADOW-ENABLED   PIC X    VALUE 'Y'. 

       PROCEDURE DIVISION.
           CALL 'NCURSES-UTIL' USING 'INITIALIZE-NCURSES'.

           CALL 'NCURSES-WINDOW' USING WINDOW-WIDTH, 
                                        WINDOW-HEIGHT, 
                                        WINDOW-X, 
                                        WINDOW-Y, 
                                        SHADOW-ENABLED.

           CALL 'NCURSES-UTIL' USING 'UNLOAD-NCURSES'.
           STOP RUN.
