-module(records).
-export([joca/0, print_pet/1]).

% Records são como structs em outras linguagens de programação, como C ou Go
%
% É importante ressaltar que em Erlang records suas operações só são definidos
% em tempo de compilação, em runtime eles são executados como Tuplas
-record(owner, {
    name,
    age
}).
-record(pet, {
    name,
    species,
    owner,
    vet_visits = [] % Definindo um valor padrão para o campo
}).

joca() ->
    % Instanciando um record aninhado
    #pet{
        name = "Joca",
        species = "Cat",
        owner = #owner{
            name = "Mr Foo",
            age = 27
        },
        vet_visits = [
            "Bath",
            "Vaccines",
            "More bath"
        ]
    }.

print_pet(Pet) ->
    % Acessando campos de um record usando a sintaxe "<Var>#<record>.<field>"
    Name = Pet#pet.name,
    Owner = (Pet#pet.owner)#owner.name,
    VetVisits = length(Pet#pet.vet_visits),

    io:format("Pet: ~s~nOwner: ~s~nVet visits: ~p~n", [Name, Owner, VetVisits]).
