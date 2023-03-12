[SPDX-FileCopyrightText: Brainfuck Enterprise Solutions
 SPDX-License-Identifier: WTFPL]
[bfed-min.bf -- the stripped-down version of bfed.

 It only supports Brainfuck chars as commands, i.e.
 + and , are changing the line (FIXME: should + be append instead?)
 - is deleting the line.
 . is printing the line.
 < is line back.
 > is line forward.

 Code starts here:]

>+ line number / exit flag
[ main loop
 >>>>,----- ----- [+++++ +++++>,----- -----] read a text until a newline
 <[<] to the command text start
 +> set the case flag and get back to the command text
 switch
 [ plus (43)
  ----- -----
  ----- -----
  ----- -----
  ----- -----
  ---
  [- comma (44)
   [- minus (45)
    [- dot (46)
     [ less than (60)
      ----- ----- ----
      [-- greater than (62)
       [ default
        <->[-] empty the flag
        error
        question mark
        +++++ +++++
        +++++ +++++
        +++++ +++++
        +++++ +++++
        +++++ +++++
        +++++ +++++ +++.[-]
        +++++ +++++.[-]
       ]
       <
       [ case greater than:
        [-]<<<+
        copy line number one line forward
        [>>>>> >>>>> >>>>> >>>>>
         >>>>> >>>>> >>>>> >>>>>
         >>>>> >>>>> >>>>> >>>>>
         >>>>> >>>>> >>>>> >>>>>
         >>>>> >>>>> >>>>> >>>>>
         >>>>> >>>>> >>>>> >>>>>
         >>>>> >>>>> >>>>> >>>>>
         >>>>> >>>>> >>>>> >>>>> >> +
         <<<<< <<<<< <<<<< <<<<<
         <<<<< <<<<< <<<<< <<<<<
         <<<<< <<<<< <<<<< <<<<<
         <<<<< <<<<< <<<<< <<<<<
         <<<<< <<<<< <<<<< <<<<<
         <<<<< <<<<< <<<<< <<<<<
         <<<<< <<<<< <<<<< <<<<<
         <<<<< <<<<< <<<<< <<<<< << -]
        move one line forward
        >>>>> >>>>> >>>>> >>>>>
        >>>>> >>>>> >>>>> >>>>>
        >>>>> >>>>> >>>>> >>>>>
        >>>>> >>>>> >>>>> >>>>>
        >>>>> >>>>> >>>>> >>>>>
        >>>>> >>>>> >>>>> >>>>>
        >>>>> >>>>> >>>>> >>>>>
        >>>>> >>>>> >>>>> >>>>> >>
        81: move to the line and print it
        >>>>> >>>>> >>>>> >>>>> >>>>> >>>>> >>>>> >>>>>
        >>>>> >>>>> >>>>> >>>>> >>>>> >>>>> >>>>> >>>>>
        >[.>]+++++ +++++.[-]
        80: back to empty command flag
        <[<]<<<<< <<<<< <<<<< <<<<< <<<<< <<<<< <<<<< <<<<<
        <<<<< <<<<< <<<<< <<<<< <<<<< <<<<< <<<<< <<[-]
       ]
       >
      ]
      <
      [ case less than:
       <<<- move to line number and decrease it
       [
        >>>[-]<<< kill command flag
        copy line number one line back
        [<<<<< <<<<< <<<<< <<<<<
         <<<<< <<<<< <<<<< <<<<<
         <<<<< <<<<< <<<<< <<<<<
         <<<<< <<<<< <<<<< <<<<<
         <<<<< <<<<< <<<<< <<<<<
         <<<<< <<<<< <<<<< <<<<<
         <<<<< <<<<< <<<<< <<<<<
         <<<<< <<<<< <<<<< <<<<< << +
         >>>>> >>>>> >>>>> >>>>>
         >>>>> >>>>> >>>>> >>>>>
         >>>>> >>>>> >>>>> >>>>>
         >>>>> >>>>> >>>>> >>>>>
         >>>>> >>>>> >>>>> >>>>>
         >>>>> >>>>> >>>>> >>>>>
         >>>>> >>>>> >>>>> >>>>>
         >>>>> >>>>> >>>>> >>>>> >> -]
        move one line back
        <<<<< <<<<< <<<<< <<<<<
        <<<<< <<<<< <<<<< <<<<<
        <<<<< <<<<< <<<<< <<<<<
        <<<<< <<<<< <<<<< <<<<<
        <<<<< <<<<< <<<<< <<<<<
        <<<<< <<<<< <<<<< <<<<<
        <<<<< <<<<< <<<<< <<<<<
        <<<<< <<<<< <<<<< <<<<< <<
        [<+>-] copy line number one cell to the right
        81: move to the line and print it
        >>>>> >>>>> >>>>> >>>>> >>>>> >>>>> >>>>> >>>>>
        >>>>> >>>>> >>>>> >>>>> >>>>> >>>>> >>>>> >>>>>
        >[.>]+++++ +++++.[-]
        80: back to empty line number and empty command flag
        <[<]<<<<< <<<<< <<<<< <<<<< <<<<< <<<<< <<<<< <<<<<
        <<<<< <<<<< <<<<< <<<<< <<<<< <<<<< <<<<< <<[-]<<<
       ]
       <[>+<-]> possibly restore line number
       >>>
       [ if command flag is there (no movement happened)
        <<<+>>> restore line number
        [-]
        question mark
        +++++ +++++
        +++++ +++++
        +++++ +++++
        +++++ +++++
        +++++ +++++
        +++++ +++++
        +++.[-]
        +++++ +++++.[-]
       ]
      ]
      >
     ]
     <
     [ case dot:
      [-] empty command flag
      78: to line start
      >>>>> >>>>> >>>>> >>>>> >>>>> >>>>> >>>>> >>>>>
      >>>>> >>>>> >>>>> >>>>> >>>>> >>>>> >>>>> >>>
      [.>] print the whole line
      +++++ +++++.[-] print newline
      <[<]
      77: back to empty command flag
      <<<<< <<<<< <<<<< <<<<< <<<<< <<<<< <<<<< <<<<<
      <<<<< <<<<< <<<<< <<<<< <<<<< <<<<< <<<<< <<
     ]
     >
    ]
    <
    [ case minus:
     - kill command flag
     78: move to the start of next line
     >>>>> >>>>> >>>>> >>>>> >>>>> >>>>> >>>>> >>>>>
     >>>>> >>>>> >>>>> >>>>> >>>>> >>>>> >>>>> >>>
     [>]< then to the end of it
     [[-]<]> erase everything and stop at the line start
     >>>>> >>>>> >>>>> >>>>>
     >>>>> >>>>> >>>>> >>>>>
     >>>>> >>>>> >>>>> >>>>>
     >>>>> >>>>> >>>>> >>>>>
     >>>>> >>>>> >>>>> >>>>>
     >>>>> >>>>> >>>>> >>>>>
     >>>>> >>>>> >>>>> >>>>>
     >>>>> >>>>> >>>>> >>>>> >> 162 to next line
     [
      [>]<
      copy the full line
      [[<<<<< <<<<< <<<<< <<<<<
        <<<<< <<<<< <<<<< <<<<<
        <<<<< <<<<< <<<<< <<<<<
        <<<<< <<<<< <<<<< <<<<<
        <<<<< <<<<< <<<<< <<<<<
        <<<<< <<<<< <<<<< <<<<<
        <<<<< <<<<< <<<<< <<<<<
        <<<<< <<<<< <<<<< <<<<< << +
        >>>>> >>>>> >>>>> >>>>>
        >>>>> >>>>> >>>>> >>>>>
        >>>>> >>>>> >>>>> >>>>>
        >>>>> >>>>> >>>>> >>>>>
        >>>>> >>>>> >>>>> >>>>>
        >>>>> >>>>> >>>>> >>>>>
        >>>>> >>>>> >>>>> >>>>>
        >>>>> >>>>> >>>>> >>>>> >> -
       ]<]
      163: compensate for the copy loop and move to next line
      >>>>> >>>>> >>>>> >>>>>
      >>>>> >>>>> >>>>> >>>>>
      >>>>> >>>>> >>>>> >>>>>
      >>>>> >>>>> >>>>> >>>>>
      >>>>> >>>>> >>>>> >>>>>
      >>>>> >>>>> >>>>> >>>>>
      >>>>> >>>>> >>>>> >>>>>
      >>>>> >>>>> >>>>> >>>>> >>>
     ]
     78: back to the command flag and set it
     <<<<< <<<<< <<<<< <<<<< <<<<< <<<<< <<<<< <<<<<
     <<<<< <<<<< <<<<< <<<<< <<<<< <<<<< <<<<< <<< +
     [
      -
      162: move to the previous command flag
      <<<<< <<<<< <<<<< <<<<<
      <<<<< <<<<< <<<<< <<<<<
      <<<<< <<<<< <<<<< <<<<<
      <<<<< <<<<< <<<<< <<<<<
      <<<<< <<<<< <<<<< <<<<<
      <<<<< <<<<< <<<<< <<<<<
      <<<<< <<<<< <<<<< <<<<<
      <<<<< <<<<< <<<<< <<<<< << + and set it
      <<< move to line number
      [ if line number
       >>>-<<< kill command flag
       [<+>-] copy line number and exit the loop
      ]
      <[>+<-]> restore (possibly) destroyed line number
      >>> back to command flag | exit if line number was there
     ]
    ]
    >
   ]
   <
   [ case comma:
    - erase the command flag
    78: beginning of the line sector
    >>>>> >>>>> >>>>> >>>>> >>>>> >>>>> >>>>> >>>>>
    >>>>> >>>>> >>>>> >>>>> >>>>> >>>>> >>>>> >>>
    ,----- ----- [+++++ +++++>,----- -----] read a text until a newline
    <[<] to the cell before start of line
    77: to command flag and exit
    <<<<< <<<<< <<<<< <<<<< <<<<< <<<<< <<<<< <<<<<
    <<<<< <<<<< <<<<< <<<<< <<<<< <<<<< <<<<< <<
   ]
   >
   ]
  <
  [ case plus:
   - erase the command flag
   78: beginning of the line sector
   >>>>> >>>>> >>>>> >>>>> >>>>> >>>>> >>>>> >>>>>
   >>>>> >>>>> >>>>> >>>>> >>>>> >>>>> >>>>> >>>
   ,----- ----- [>,----- -----] read a text until a newline
   <[+++++ +++++<] restore the original text
   77: to command flag and exit
   <<<<< <<<<< <<<<< <<<<< <<<<< <<<<< <<<<< <<<<<
   <<<<< <<<<< <<<<< <<<<< <<<<< <<<<< <<<<< <<
  ]
  >
 ]
 <
 [ case '\n':
  77: move to the beginning of line and set presence flag
  >>>>> >>>>> >>>>> >>>>> >>>>> >>>>> >>>>> >>>>>
  >>>>> >>>>> >>>>> >>>>> >>>>> >>>>> >>>>> >>+>
  [ if something on the line
   <-> kill presence flag
   [.>]+++++ +++++.[-] print the line
   loop and 80: move back to line number
   <[<]<<<<< <<<<< <<<<< <<<<< <<<<< <<<<< <<<<< <<<<<
   <<<<< <<<<< <<<<< <<<<< <<<<< <<<<< <<<<< <<<<<
   162: copy line number one sector forward
   [>>>>> >>>>> >>>>> >>>>>
    >>>>> >>>>> >>>>> >>>>>
    >>>>> >>>>> >>>>> >>>>>
    >>>>> >>>>> >>>>> >>>>>
    >>>>> >>>>> >>>>> >>>>>
    >>>>> >>>>> >>>>> >>>>>
    >>>>> >>>>> >>>>> >>>>>
    >>>>> >>>>> >>>>> >>>>> >> +
    <<<<< <<<<< <<<<< <<<<<
    <<<<< <<<<< <<<<< <<<<<
    <<<<< <<<<< <<<<< <<<<<
    <<<<< <<<<< <<<<< <<<<<
    <<<<< <<<<< <<<<< <<<<<
    <<<<< <<<<< <<<<< <<<<<
    <<<<< <<<<< <<<<< <<<<<
    <<<<< <<<<< <<<<< <<<<< << -]
   162: move to next line (increase line number)
   >>>>> >>>>> >>>>> >>>>>
   >>>>> >>>>> >>>>> >>>>>
   >>>>> >>>>> >>>>> >>>>>
   >>>>> >>>>> >>>>> >>>>>
   >>>>> >>>>> >>>>> >>>>>
   >>>>> >>>>> >>>>> >>>>>
   >>>>> >>>>> >>>>> >>>>>
   >>>>> >>>>> >>>>> >>>>> >> +
   81: move to line start
   >>>>> >>>>> >>>>> >>>>> >>>>> >>>>> >>>>> >>>>>
   >>>>> >>>>> >>>>> >>>>> >>>>> >>>>> >>>>> >>>>> >
   [<<+>>-] copy the first char if something on the line
  ]
  <<[>>+<<-] copy (possibly) saved first char
  > back to the presence flag
  [
   [-]
   question mark
   +++++ +++++
   +++++ +++++
   +++++ +++++
   +++++ +++++
   +++++ +++++
   +++++ +++++
   +++.[-]
   +++++ +++++.[-]
  ]
  77: back to the command flag and kill it
  <<<<< <<<<< <<<<< <<<<< <<<<< <<<<< <<<<< <<<<<
  <<<<< <<<<< <<<<< <<<<< <<<<< <<<<< <<<<< <<[-]
 ]
 <<< back to line number
] main loop ends
