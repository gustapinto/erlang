-module(collections).
-export([point/0, lists/0, list_comp/0]).

% Tuplas são uma estrutura de dados que permite o armazenamento de múltiplos valores
% de forma mais estruturada as listas
point() ->
    Point = {10, 5}, % Declarando uma tupla com a sintaxe {...}
    {X, Y} = Point,  % Acessando os dados da tupla "Point"

    io:format("X: ~p~n", [X]),
    io:format("Y: ~p~n", [Y]).

lists() ->
    Values = [1, 2, 3, 4, 5], % Inicializando uma lista
    [Head|Tail] = Values,     % Acesssando os valores de uma lista

    io:format("Head: ~p~n", [Head]),
    io:format("Tail: ~p~n", [Tail]),

    NewList = [Head | [0, 9, 8]],  % Concatenando listas usando o operador "constructor"
    NewListSize = length(NewList), % Obtendo o tamanho de uma lista

    io:format("NewList: ~p~n", [NewList]),
    io:format("NewListSize: ~p~n", [NewListSize]).

list_comp() ->
    Values = [1, 2, 3, 4, 5, 6, 7, 8, 9],

    % Transformando uma lista usando comprehensions
    % Sintaxe: [<expressão> || <generator expression (X <- [...])>]
    DoubleValues = [N * 2 || N <- Values],
    io:format("Double: ~p~n", [DoubleValues]),

    EvenValues = [N || N <- Values, N rem 2 =:= 0], % Filtrando uma lista usando comprehensions
    io:format("Even: ~p~n", [EvenValues]),

    % Usando mais de um gerador, note que a lista final terá tamanho do gerador 1 + gerador 2
    VeryNewValues = [X * Y || X <- [2, 3], Y <- [4, 5]],
    io:format("VeryNewValues: ~p~n", [VeryNewValues]),

    PatternValues = [
        {"Java", compiled},
        {"Python", interpreted},
        {"Go", compiled},
        {"Javascript", interpreted}
    ],
    CompiledValues = [X || {X, compiled} <- PatternValues], % Usando pattern matching para filtrar a lista

    io:format("CompiledValues: ~p~n", [CompiledValues]).
