Dado("que eu tenha um payload padrão e válido para busca de recursos") do
end

Quando("é enviada uma requisição para busca de recursos GET") do
  @response_body = busca_recursos.retorna_get
end

Então("os dados do busca de recursos GET serão exibidos no response com sucesso") do
  expect(@response_body['typeOfEstablishment']).not_to be_nil
  puts "Um exemplo de tipo de estabelecimento: \n #{@response_body['typeOfEstablishment'][0]}"
end


E("o código de resposta deve ser {int} no serviço") do |status_code|
  expect(@response_body.code).to eql status_code
end

Dado('a string de entrada {string}') do |texto|
  @texto_teste =  texto

end

Quando('os marcadores') do |tabela|
  valores = Array.new
  valores = tabela.raw.flatten
  @retorno_texto = busca_recursos.retorna_texto_cortado(@texto_teste, valores).to_s.strip
  puts "A resposta é #{@retorno_texto}"
end

Então('a saída esperada é: {string}') do |resposta|
  expect(resposta.to_s).to include(@retorno_texto)
end