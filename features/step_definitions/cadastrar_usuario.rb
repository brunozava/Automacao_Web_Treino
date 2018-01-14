Dado("que acesse a homepage") do
    @home = Home.new
    @menu = Menu.new
    @home.load
end
  
Quando("realizar o Login") do |table|
    login = table.rows_hash['usuario']
    senha = table.rows_hash['senha'] 
    @home.realizar_login(login, senha)
end
  
Dado("que acesse o menu novo funcionario") do
    @menu.wait_for_botao_pim
    @menu.botao_pim.click
    @menu.wait_for_add_funcionario
    @menu.add_funcionario.click
end
  
Quando("preencher as informacoes do Usuario") do
  @menu.tabelafuncionario.criar_funcionario
  @id = @menu.id_funcionario.value
end
  
Entao("o usuario deve ser cadastrado com sucesso") do
  @menu.busca_funcionario.click
  @menu.tabelabusca.busca_funcionario @id
    
  aggregate_failures do
    expect(@menu.resultado.resultados[0].text).to eql @id
    expect(@menu.resultado.resultados).not_to be_empty
  end 
end