# Documentação do Sistema de Controle de Permissões

Este documento apresenta a documentação para um sistema de controle de permissões desenvolvido em Delphi. O sistema é composto por três formulários principais: `uacesso`, `uusuarios`, e `utela`.

## 1. Formulário de Acesso (`uacesso`)

### Tecnologias Utilizadas:

- **Banco de Dados:** Firebird 4.0 Embedded
- **Framework de Acesso a Dados:** Firedac
- **IDE:** Delphi 11 Alexandria

### Estrutura do Banco de Dados:

Tabela `USUARIOS`:

```sql
CREATE TABLE USUARIOS (
  CODUSO INTEGER PRIMARY KEY,
  CADUSU DATE,
  NOMUSO VARCHAR(255),
  SENUSO VARCHAR(255),
  MENU1 VARCHAR(255),
  MENU2 VARCHAR(255),
  MENU3 VARCHAR(255),
  MENU4 VARCHAR(255),
  NIVEL VARCHAR(255)
);
```
Formulário de Acesso (uacesso):
Este formulário é responsável pela autenticação dos usuários no sistema.

Componentes Principais:

Label1, Label2: Rótulos para os campos de usuário e senha.
Edit1, Edit2: Campos para inserção de senha e usuário.
BitBtn: Botão para realizar o login.
Outros componentes relacionados ao Firedac para conexão e manipulação de dados.
Eventos Principais:

btlogarClick: Manipula o clique no botão de login, realizando a autenticação e exibindo a tela principal se bem-sucedido.
2. Formulário de Usuários (uusuarios)
Formulário de Usuários (uusuarios):
Este formulário é responsável pela gestão dos usuários do sistema, permitindo a inclusão, edição, exclusão e busca de registros na tabela USUARIOS.

Componentes Principais:

DBCheckBox: Checkboxes para seleção de permissões de menus.
DBEdit, DBComboBox: Campos para inserção e seleção de informações do usuário.
DBGrid: Grid para exibir os usuários cadastrados.
Botões de ação como btgravar, btnovo, btcancelar, btsair, btlimpar, entre outros.
Eventos Principais:

btgravarClick: Realiza a gravação ou atualização do registro do usuário no banco de dados.
btnovoClick: Prepara o formulário para a inclusão de um novo usuário.
btbuscarClick: Realiza a busca de usuários com base no nome inserido no campo Edit1.
BitBtn1Click: Permite a edição de um usuário existente.
BitBtn2Click: Realiza a exclusão de um usuário, solicitando confirmação antes da exclusão.
3. Tela Principal (utela)
Tela Principal (utela):
Este formulário representa a tela principal do sistema após a autenticação.

Componentes Principais:

MainMenu: Barra de menus com opções como CADASTROS, CONSULTAS, SAIR, etc.
StatusBar: Barra de status exibindo informações como data e hora.
Timer: Timer para atualizar a exibição da hora na barra de status.
SpeedButton: Botão para acessar o formulário de cadastro de usuários.
Eventos Principais:

CADUSUARIOS1Click: Abre o formulário de usuários (uusuarios).
FormActivate: Ativação do formulário, verificando as permissões do usuário e exibindo informações na barra de status.
SAIR1Click: Encerra o aplicativo.
Timer1Timer: Atualiza a exibição da hora na barra de status.
Considerações Finais:
Este é um sistema básico que pode ser expandido para atender a requisitos específicos. Certifique-se de incluir informações adicionais no GitHub, como requisitos de sistema, instruções de instalação e outras dependências.
