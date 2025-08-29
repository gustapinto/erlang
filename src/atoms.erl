-module(atoms).
-export([atomic/1]).

% Atoms são uma forma de expressar valores "literais" ou constantes, porém
% devem ser usados com cuidado, por os mesmos são indexados na "atom-table" uma
% estrutura de dados interna da linguagem que não passa por Garbage Collection.
atomic(mouse) -> % Usando "mouse" como um Atom para pattern matching
    io:format("Beware of the Atomic Mouse fools!~n");

atomic(car) -> % Usando "car" como Atom
    io:format("Its just a prototype!~n");

atomic(_) -> % Fallback, ignoring the argument with the "_" syntax
    io:format("Its something strange!~n").