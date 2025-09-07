-module(guard).
-export([is_adult/1]).

% Guards são uma forma de fluxo de controle, aplicadas usando a expressão "when"
is_adult(Age) when Age >= 18 ->
    true;

is_adult(Age) when Age =< 0 ->
    % Disparando uma exceção usando [error/1]
    error("Invalid Age, must be at least >= 1");

is_adult(_) ->
    false.
