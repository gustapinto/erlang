-module(bools).
-export([bool_algebra/0, equality/2]).

% Operadores lógicos são parecidos com python, porém eles não tem capacidade
% de "short-circuit", então todos os lados da comparação serão executados
bool_algebra() ->
    io:format("~p~n", [true and false]), % Usando [io:format/2]
    io:format("~p~n", [true and true]),
    io:format("~p~n", [true or false]),
    io:format("~p~n", [true xor false]).

% Porém os operadores de comparação são diferentes dos habituais
equality(First, Second) ->
    io:format("~p~n", [First =:= Second]), % Igual a
    io:format("~p~n", [First =/= Second]), % Diferente de
    io:format("~p~n", [First == Second]),  % Igual a, porém desconsiderando casas decimais
    io:format("~p~n", [First /= Second]),  % Diferente de, porém desconsiderando casas decimais
    io:format("~p~n", [First < Second]),   % Menor que
    io:format("~p~n", [First =< Second]),  % Menor ou igual a
    io:format("~p~n", [First > Second]),   % Maior que
    io:format("~p~n", [First >= Second]).  % Maior ou igual a
