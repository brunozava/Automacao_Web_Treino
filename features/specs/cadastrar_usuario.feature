#language: pt
#encoding: utf-8

Funcionalidade: Cadastrar Usuario
Eu como admin   
Quero acessar o site
Para que eu possa cadastrar um Usuario

Contexto: Login como Admin
Dado que acesse a homepage
Quando realizar o Login
    | usuario | admin |
    | senha   | admin |

Cenário: Cadastrar novo usuário
Dado que acesse o menu novo funcionario
Quando preencher as informacoes do Usuario
Entao o usuario deve ser cadastrado com sucesso 