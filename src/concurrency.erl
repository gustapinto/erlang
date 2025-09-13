-module(concurrency).
-export([spawner/0, listen/0, call/0, listen_and_answer/0]).

g(N) ->
    timer:sleep(100), % Waits <N> ms
    io:format("~p~n", [N]).

% O modelo de concorrência de Erlang é baseado em atores, processos e troca de
% mensagens, uma modelo oriunda da origem da linguagem em sistemas de telecom,
% usando processos leves (green-threads)
spawner() ->
    % Para disparar um processo usamos a função [spawn/1], que retorna o id
    % do processo dentro da VM BEAM
    Pid = spawn(fun() -> io:format("Spawned!~n") end),

    io:format("Spawned process with pid=~p~n", [Pid]),

    % Disparando multiplo processos usando [lists:seq/2] para retornar
    % uma sequência numérica
    [spawn(fun() -> g(X) end) || X <- lists:seq(1, 10)].

listen() ->
    % Esperando por mensagens
    receive
        alert ->
            io:format("Alert!~n");
        info ->
	    io:format("Yeay, just some dude~n");
	_ ->
	    % Fica esperando por novas mensagens até encontrar uma válida
            io:format("Dont stop calling!~n"),
	    listen() 
    end.

listen_and_answer() ->
    receive
	% Usando pattern matching para responder a mensagem, tratando "From"
	% como um processo
	%
	% No Shell essa mensagem pode ser passada seguindo o exemplo a seguir:
	% 1> P = spawn(concurrency, listen_and_answer, []).
	% 2> P ! {self(), alive}. % passa o processo atual (self()) junto da mensagem
	% 3> flush().             % Obtém as mensagens
	{From, alive} ->
	    From ! ok,
	    listen_and_answer();
	{From, _} ->
	    From ! nok,
	    listen_and_answer()
    end.

call() -> 
    % Usando o operador "!" para passar mensagens para um processo
    Process = spawn(fun() -> listen() end),
    Process ! "Xalanga!",
    Process ! info,
    
    timer:sleep(10).

