-module(recursion).
-export([factorial/1, len/1, factorial_t/1]).

% Recursão simples, usando fatoriais
%
% Exemplo de stack de chamadas para factorial(3).
% - factorial(3) -> 3 * factorial(2)
% - factorial(2) -> 2 * factorial(1)
% - factorial(1) -> 1 * factorial(0)
% - factorial(0) -> 1
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
% Exemplo de stack de chamadas para factorial_t(3).
% - factorial_t(3) -> factorial_t(3, 1) % Nesse caso temos uma chamada extra por conta do "alias"
% - factorial_t(3, 1) -> factorial_t(2, 3)
% - factorial_t(2, 3) -> factorial_t(1, 6)
% - factorial_t(1, 6) -> factorial_t(0, 6)
% - factorial_t(0, 6) -> 6
factorial_t(N) -> factorial_t(N, 1).

factorial_t(0, Acc) -> Acc; % Usando Acc como acumulador temporário
factorial_t(N, Acc) when N > 0 -> factorial_t(N-1, N*Acc).
