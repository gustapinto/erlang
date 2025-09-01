% Definindo um módulo, por padrão é o nome do arquivo sem a extensão
%
% Para importar um módulo no ERL REPL, depois de compilar o arquivo para .beam,
% basta usar o comando "l(<module_name>)."
-module(hello).

% Definindo as funções exportadas (aka. públicas)
-export([hello/0, hello/1]).

% Defininindo a função "hello" com duas aridades hello/0 e hello/1
hello() ->
    hello("World").

% Pattern matching usando a expressão "when (boolean)". É uma das formas de controle
% condicional, principalmente usada quando conhecemos as possíveis inputs de uma função
%
% A ordem de declaração das funções importa! Elas devem ser declaradas de mais específicas
% para menos específicas
hello(Subject) when Subject == "Mars" ->
    % io:format -> print to stdout
    io:format("You not Mars!~n");

hello(Subject) ->
    % Declarando uma variável, em Erlang todas as variáveis são "finais", ou seja
    % não podem ser reatribuídas depois de serem inicializadas
    %
    % Variáveis devem ser declaradas com letra maiúscula, letras minúsculas são
    % reservadas para "atoms"
    Message = "Hello, " ++ Subject ++ "!~n", % Usando ++ para concatenar strings

    io:format(Message).
