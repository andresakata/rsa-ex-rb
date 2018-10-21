# RSA

Projeto implementado na disciplina de Projeto e Análise de Algoritmos no mestrado de Computação Aplicada da UDESC-CCT.

## Classes

Na classe `Utils` temos os algoritmos de:
- Teste de primalidade probabilistico: `Utils.prime?`
- Máximo divisor comum: `Utils.gcd`
- Algoritmo de Euclides estendido: `Utils.extended_gcd`

As classes `BruteForceDecryptor` e `PollardRhoDecryptor` fazem fatoração de inteiros para quebra da chave.

A classe `KeyGenerator` faz a geração de chaves públicas e privadas, e as classes `RsaDecryptor` e `RsaEncryptor` fazem a criptografia e descriptografia de mensagens.

## Testes

O script `rsa_script.rb` executa um teste criptografando e descriptografando o arquivo `file`.

Os testes no `rspec` verificam o funcionamento das classes e além disso são utilizados para verificar tempo de processamento das funções. Eles podem demorar mais de uma hora para terminarem.