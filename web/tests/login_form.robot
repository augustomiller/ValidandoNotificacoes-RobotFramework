*** Settings ***
Resource        base.robot

Test Setup      Nova sessão
Test Teardown   Encerra sessão

*** Test Case ***
CN-1 Login realizado com sucesso
    Go To           ${url}/login
    Input text      css:input[name=username]        stark
    Input text      css:input[name=password]        jarvis!
    Click Element   class:btn-login

    Page Should Contain     Olá, Tony Stark. Você acessou a área logada!

CN-2 Senha inválida
    Go To           ${url}/login
    Input text      css:input[name=username]        stark
    Input text      css:input[name=password]        12355
    Click Element   class:btn-login

    ${message}=     Get WebElement      id:flash
    Should Contain  ${message.text}     Senha é invalida!

CN-3 Usuário não existe
    [tags]          login_user404
    Go To           ${url}/login
    Input text      css:input[name=username]        what!
    Input text      css:input[name=password]        jarvis!
    Click Element   class:btn-login

    ${message}=     Get WebElement      id:flash
    Should Contain  ${message.text}     O usuário informado não está cadastrado!