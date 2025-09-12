-module(kv).
-compile(export_all).

% proplists são uma estrutura de dados chave-valor fracamente definidos, elas
% são declaradas usando uma lista de tuplas no formato [{Chave, Valor}]
proplist() ->
    % Declarando uma proplist
    List = [{foo, "Foo"}, {bar, "Bar"}, {foobar, "Foobar"}],

    % Usando a biblioteca padrão (https://www.erlang.org/docs/28/apps/stdlib/proplists.html)
    % para operar sobre proplists
    HasFoo = proplists:is_defined(foo, List),
    FooValue = proplists:lookup(foo, List),

    io:format("HasFoo: ~p~n", [HasFoo]),
    io:format("FooValue: ~p~n", [FooValue]).

% dicts são estruturas de dados chave-valor correspondentes a hash-maps
% https://www.erlang.org/docs/28/apps/stdlib/dict.html
dicts() ->
    % Declarando um dicionário vazio com [dict:new/0] e adicionando items
    Mapping = dict:append(foo, "Foo", dict:new()),
    Mapping2 = dict:append(bar, "Bar", Mapping),

    Keys = dict:fetch_keys(Mapping2),

    io:format("Mapping Keys: ~p~n", [Keys]),

    % Instanciando um dicionário a partir de uma proplist
    Map = dict:from_list([
        {foobar, "Foobar"},
        {barfoo, "Barfoo"}
    ]),

    io:format("Map Keys: ~p~n", [dict:fetch_keys(Map)]).
