#🤖 Introdução
Repositório criado para inclusão de um desafio de Robot Framework e Gherkin

#🤖Primeiro Desafio
1. Escolha um site (sim, qualquer um);
2. Escolha uma funcionalidade desse site;
3. Escreva um caso de teste, em Gherkin, considerando um caminho infeliz e automatize-o utilizando Robot Framework
(https://robotframework.org/)
Esse é um case que, além do seu conhecimento técnico, queremos que você use sua criatividade e curiosidade.

#🤖Segundo desafio
1. Considere a documentação da seguinte RESTful API https://www.petfinder.com/developers/v2/docs/#introduction
2. Escolha um Endpoint documentado;
3. Escreva dois casos de teste, em Gherkin, considerando um caminho feliz e um infeliz.

#🤖Primeiros Passos
1. Faça o clone do projeto
2. Instale a última versão do Python, sempre lembrando de adicioná-lo às variáveis de ambiente do windows.
3. Assim que estiver com o projeto clonado, execute o comando "pip install -U requirements.txt" para instalar as dependências ddo projeto (Libraries e frameworks).

#🤖Executando a automação
1. Basta acessar a aba Testing do seu Visual Studio Code e navegar para o teste desejado. 

#🤖Entendendo o projeto 
O projeto está dividido em pastas cujo propósitos são definidos: 
- <b>Tests</b>: Contém os cenários de teste de automação, separados por camada(API e Web)
- <b>Controller</b>: Contém os arquivos de script utilizados na automação; 
- <b>Config</b>: Possui arquivos de uso geral para todos os escopos do teste. 

#🤖Boas Práticas
1. Sempre criar uma nova branch para implementar novas funcionalidades;
2. Executar o comando "git status" para verificar o que está sendo alterado;
3. Sempre executar o comando git pull antes de iniciar as alterações; 
4. Cada arquivo de teste deve ter seu próprio controller; 

