# Testes automatizados com Robot Framework para API "TheMovieDb"
- Testes para validar a API The Movie DB, disponível em https://developers.themoviedb.org/3/getting-started/introduction
- Testando acesso à API como usuário convidado, para executar operações permitidas e não permitidas.
- API exige registro de um usuário e geração de uma <i>api_key</i> para a aplicação, de acordo com a documentação acima.
- A <i>api_key</i> será exigida em todas as requisições na API.

### 1. Estrutura de arquivos e diretórios
Os testes estão estruturados nos seguintes diretórios:
- **keywords**: diretório que contém arquivos <i>.robot</i> com a implementação das palavras-chaves (keywords).
- **test-suites**: diretório que contém arquivos <i>.robot</i> com as suítes de testes (cenários ou casos de testes).
- **requirements.txt**: arquivo que contém as chamadas para instalação das libraries do robot que são necessárias para executar os testes.</br>

### 2. Pré condições para os testes
- Obter a <i>api_key</i> registrando-se na API
- Clonar este projeto
- Python 2.7.15 ou superior
- Usar um editor ASCII de sua preferência (VSCode, Atom, RIDE, etc)</br>

### 3. Instalando libraries Python necessárias
Instale todas a libraries Python necessárias, digitando no terminal o comando:
```sh
Windows
$ pip install -r requirements.txt
```
```sh
Linux / Mac
$ sudo pip install -r requirements.txt
```
Este comando executará a instalação via <i>pip</i> do que é requerido pelo Robot Framework, especificado no arquivo <i>requirements.txt file</i>.</br>

### 4. Executando os testes
> O comando abaixo deve ser executado no terminal, no diretório raiz do projeto.
A variável <b>"your_api_key"</b> deve ser alterada para a chave de 32 caracteres fornecido pela API ao registrar sua aplicação.
```sh
$ python -m robot --variable VALID_API_KEY:your_api_key -d output ./test-suites/guest-session.robot
```
Para mais detalhes de como executar testes no Robot Framework veja mais em: http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#executing-test-cases

### 5. Gerando documentação

- O comando a seguir gera documentação das keywords do usuário no diretório output (ou outro de sua preferência):
```sh
$ python -m robot.libdoc keywords/guest-session.robot output/user-keywords-documentation.html
```
- O comando a seguir gera a documentação dos cenários no diretório output (ou outro de sua preferência):
```sh
$ python -m robot.testdoc test-suites/guest-session.robot output/test-suite-documentation.html
```

