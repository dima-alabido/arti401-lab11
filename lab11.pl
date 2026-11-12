:- dynamic letter/1.

letter(a).
letter(b).
letter(c).

start :-
    write('Hi, This is the "Name Game".'), nl,
    write('You will be given a set of English letters in which you will add, delete or move to create your name.'), nl,
    menu.

menu :-
    nl,
    write('Choose from the following:'), nl,
    write('1- Display the current set of letters'), nl,
    write('2- Add a letter'), nl,
    write('3- Add a letter at the top'), nl,
    write('4- Add a letter at the bottom'), nl,
    write('5- Delete a letter'), nl,
    write('6- Delete all letters'), nl,
    write('7- Exit'), nl,
    write('Enter your choice....'), nl,
    read(X),
    option(X).

display_letters :- letter(X), write(X), tab(1), fail.
display_letters :- nl.

option(1) :-
    write('The current set of letters: '),
    display_letters,
    menu.
option(2) :-
    write('Enter the letter: '), read(X),
    assert(letter(X)),
    write('The letter has been added'), nl,
    menu.
option(3) :-
    write('Enter the letter: '), read(X),
    asserta(letter(X)),
    write('The letter has been added at the top'), nl,
    menu.
option(4) :-
    write('Enter the letter: '), read(X),
    assertz(letter(X)),
    write('The letter has been added at the bottom'), nl,
    menu.
option(5) :-
    write('Enter the letter: '), read(X),
    delete_letter(X),
    menu.
option(6) :-
    retractall(letter(_)),
    write('All letters have been deleted'), nl,
    menu.
option(7) :-
    write('Goodbye!'), nl.
option(_) :-
    write('Wrong choice, try again'), nl,
    menu.

delete_letter(X) :-
    retract(letter(X)),
    write('The letter has been deleted'), nl.
delete_letter(_) :-
    write('This letter is not in the set'), nl.
