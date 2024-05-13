#language:pt
@busca_recursos

Funcionalidade: AUT [BuscaRecursos] Serviço - busca de recursos de produtos e estabelecimentos
  Quero:  Testar todos os métodos de Busca de Recursos de Produtos e Estabelecimentos
  Para:  Garantir que todas as situações possiveis estejam funcionando
  Critérios de aceite:  Todos os métodos retornando 200 e verifique a presença de um tipo de estabelecimento

  @backend_1
  Cenario: Validação do retorno da API busca de recursos GET com sucesso
    Dado que eu tenha um payload padrão e válido para busca de recursos
    Quando é enviada uma requisição para busca de recursos GET
    Então os dados do busca de recursos GET serão exibidos no response com sucesso
    E o código de resposta deve ser 200 no serviço


  @backend_2
  Cenario: Validar presenca de caracteres em textos
    Dado a string de entrada 'bananas, tomates # e ventiladores'
    E os marcadores
    |#|!|
    Então a saída esperada é: 'bananas, tomates'

@backend_2
  Cenario: Validar presenca de caracteres em textos
    Dado a string de entrada 'o rato roeu a roupa $ do rei % de roma'
    E os marcadores
    |%|!|
    Então a saída esperada é: 'o rato roeu a roupa $ do rei'

@backend_2
  Cenario: Validar presenca de caracteres em textos
    Dado a string de entrada 'the quick brown fox & jumped over * the lazy dog'
    E os marcadores
    |&|*|%|!|
    Então a saída esperada é: 'the quick brown fox'