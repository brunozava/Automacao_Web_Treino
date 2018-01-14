class Menu < SitePrism::Page
    element :botao_pim, '#menu_pim_viewPimModule'
    element :add_funcionario, '#menu_pim_addEmployee'
    element :busca_funcionario, '#menu_pim_viewEmployeeList'
    element :id_funcionario, '#personal_txtEmployeeId'


    class TelaFuncionario < SitePrism::Section
        element :nome, '#firstName'
        element :nomemeio, '#middleName'
        element :nomeultimo, '#lastName'
        element :foto, '#photofile'
        element :btn_salvar, '#btnSave'
        

        def criar_funcionario
            nome.set Faker::Name.first_name
            nomemeio.set Faker::Name.last_name
            nomeultimo.set Faker::Name.last_name
            btn_salvar.click
        end
    end
    class TelaBusca < SitePrism::Section
        element :funcionario_id, "#empsearch_id"
        element :btn_busca, '#searchBtn'

        def busca_funcionario id
            funcionario_id.set id
            btn_busca.click
        end

    end

    class Resultado < SitePrism::Section
        elements :resultados, 'td.left'
    
    end
section :resultado, Resultado, '#search-results'
section :tabelabusca, TelaBusca, '#employee-information'
section :tabelafuncionario, TelaFuncionario, '#addEmployeeTbl'

end