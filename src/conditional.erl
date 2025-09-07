-module(conditional).
-export([even/1, hello/1, says/1]).

% Em Erlang ifs são chamados de guard patterns, e atuam com uma sintaxe similar
% as guards, com uma cadeia de ifs sempre tendo que retornar um valor
even(N) ->
    if N rem 2 =:= 0 -> true;
        true -> false  % "else"
    end.

% Ifs podem conter várias expressões e podem ser usados como valores
hello(Animal) ->
    LowerCaseAnimal = string:lowercase(Animal), % Usando o módulo padrão "string"
    Message = if
        LowerCaseAnimal =:= "cat" -> "Meow";
        LowerCaseAnimal =:= "dog" -> "Oof";
        true -> "<strange sound>"
    end,

    io:format("It says ~p!~n", [Message]).

% Clausulas "case" também são uma forma de controle de fluxo, porém suportam
% pattern-matching de forma mais completa quando comparado com "ifs"
says(Subject) ->
    case Subject of
        {human, Message} when Message =:= "hi" -> "Hi Hi Human!";
        {human, Message} -> Message;
        {cat, _} -> "Meown!";
        {cat} -> "Meown!";
        {dog, _} -> "Bark!";
        {dog} -> "Bark!";
        _ -> "Some default, boring, stuff"
    end.
