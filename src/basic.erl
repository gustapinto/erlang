% Definindo um módulo, por padrão é o nome do arquivo
-module(basic).

% Definindo as funções exportadas (aka. públicas)
-export([hello/0, hello/1]).

% Defininindo a função "hello" com duas aridades hello/0 e hello/1
hello() ->
    hello("World").

% Pattern matching usando a expressão "when (boolean)". É uma das formas de controle
% condicional, principalmente usada quando conhecemos as inputs de uma função
%
% A ordem de declaração das funções importa! Elas devem ser declaradas de mais específicas
% para menos específicas
hello(Subject) when Subject == "Mars" ->
    % io:format -> print to stdout
    io:format("You not Mars!~n");

hello(Subject) ->
    io:format("Hello, " ++ Subject ++ "!~n").
