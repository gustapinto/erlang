-module(errors).
-export([error/0, throws/0, ends/0, catching/1, catching/2]).

% Erlang lida com erros na forma de exceções, com a capacidade de parar ou não o
% processamento
error() ->
    % error/1 dispara uma exceção com a intenção de parar um programa, usado quando
    % não temos a intenção, ou não devemos lidar com ela
    error(shift_happens).

ends() ->
    % exit/1 é usado para indicar que um processo deve ser parado
    exit(stop_this_thing).

throws() ->
    % throw/1 dispara uma exceção com a intenção de lidarmos com ela, se uma exceção
    % não passa por uma try-catch ela é tratada como error/1
    throw(permission_denied).

catching(Fn) ->
    % Lidando com erros usando um bloco try-catch
    try Fn() of
        Res -> {ok, Res} % Branch sem erro, usando o resultado da função
    catch
        % Usando pattern matching no formato "<atom|Var>:<Var>" para lidar com
        % a exceção
        throw:T -> {is_a_throw, T};     % Capturando throw/1
        error:Err -> {is_a_error, Err}; % Capturando error/1
        exit:Ex -> {is_a_exit, Ex}      % Capturando exit/1
    end.

catching(Fn, Msg) ->
    % Também é possível lidar com várias chamadas dentro do try-catch, tratando-o
    % como um corpo de função normal, com ou sem o retorno usando "of"
    try
        Fn(),

        Message = "Catched " ++ Msg ++ "!",

        io:format("~p~n", [Message])
    catch
        _:E -> {failed, E}
    end.