-module(recursion).
-export([factorial/1, len/1, tail_factorial/1]).

% Recursão simples, usando fatoriais
%
% Exemplo de stack de chamadas para factorial(3).
% - factorial(3) -> 3 * factorial(2)
%                -> 3 * (2 * factorial(1))
%                -> 3 * (2 * 1)
%                -> 3 * 2
%                -> 6
% - percorre a stack computando os resultados (1 * 1 * 2 * 3) = 6
factorial(0) -> 1;
factorial(N) when N > 0 -> N * factorial(N-1).

% Obtendo o tamanho de uma lista usando recursão
len([]) -> 0;
len([_|T]) -> 1 + len(T).

% Uma estratégia para economizar memória é usando tail-recursion, uma técnica que
% usa de uma variável temporária para otimizar o número de chamadas e diminuir
% o uso de memória da "stack" de recursão retornando os valores finais ao invés
% de depender da computação da stack
%
% Exemplo de stack de chamadas para tail_factorial(3).
% - tail_factorial(3) -> tail_factorial(3, 1) Chamada extra por conta da função auxiliar tail_factorial/2
%                     -> tail_factorial(2, 3*1)
%                     -> tail_factorial(1, 3*2)
%                     -> 6
tail_factorial(N) -> tail_factorial(N, 1).
tail_factorial(1, Acc) -> Acc; % Usando Acc como acumulador temporário
tail_factorial(N, Acc) -> tail_factorial(N-1, N*Acc).
