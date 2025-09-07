-module(functional).
-export([add/0, add/2]).

one() -> 1.
two() -> 2.

% Declarando uma função que espera duas funções como argumentos
add(A, B) ->
    A() + B().

add() ->
    % Passando as funções para uma funções de ordem maior (high order function),
    % ou HOF, usando a sintaxe "fun <nome função>/<aridade função>"
    ResultWithDeclaredFunctions = add(fun one/0, fun two/0),

    % Usando funções anonimas com a sintaxe "func(<params> -> <result> end", em
    % Erlang essas funções se comportam como nas demais linguagems com capacidades
    % funcionais, podendo ser atribuídas a variáveis, passadas como argumento, etc...
    ResultWithAnonFunctions = add(fun() -> 2 end, fun() -> 3 end),

    io:format("Add(one(), two()) = ~p~n", [ResultWithDeclaredFunctions]),
    io:format("Add(?, ?) = ~p~n", [ResultWithAnonFunctions]).
