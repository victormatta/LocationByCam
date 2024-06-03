# great_places

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# Condo4U

Condo4U é uma API destinada à administração de pagamentos, documentos e comunicados no sistema Condo4U. Esta API oferece funcionalidades CRUD para o banco de dados e uma série de endpoints para gerenciar essas operações.

## Tecnologias Utilizadas

### Linguagem de Programação
- [PHP] - PHP: Utilizado para a lógica de backend e desenvolvimento das APIs.

### Frameworks e Bibliotecas
- [Laravel] - Principal framework PHP utilizado para estruturar o projeto, fornecer roteamento, middleware, controle de eventos, gerenciamento de filas e mais.
- [Composer] - Gerenciador de dependências para PHP.
- [Sanctum] - Utilizado para autenticação via token.
- [Spatie Media Library] - Biblioteca para gerenciamento e manipulação de arquivos de mídia.
- [Firebase] - Utilizado para notificações push e outras funcionalidades em tempo real.

### Banco de Dados
- [MySQL] - Utilizado para armazenamento dos dados. Arquivos de migração estão localizados em database/migrations.

## Ferramentas de Desenvolvimento
- [Artisan] - Ferramenta de linha de comando fornecida pelo Laravel para várias tarefas de desenvolvimento.
- [Factory] - Utilizado para gerar dados de teste, localizado em database/factories.

## Integrações e APIs
- [FirebaseAPI] - Utilizado para funcionalidades como autenticação e notificações push.
- [MailAPI] - Configuração de envio de e-mails, utilizando serviços como o Mailgun, configurados em config/mail.php.

## Como Executar o Projeto

### Passos para Execução

1. **Clone o repositório**

   ```sh
   git clone https://github.com/AN-Tecnologia/Styles-condo.git
   cd condo4u-api

2. **Configurar as variáveis de ambiente**

   ```sh
   cp .env.example .env

3. **Instalar as depências do Composer**

   ```sh
   composer install

4. **Gerar a chave da aplicação**

   ```sh
   php artisan key:generate

5. **Configurar o banco de dados**
- No arquivo .env, configure as variáveis de ambiente DB_DATABASE, DB_USERNAME e DB_PASSWORD conforme o seu ambiente de desenvolvimento.

6. **Executar as migrações e seeders**

   ```sh
   php artisan migrate --seed

7. **Iniciar o servidor de desenvolvimento**

   ```sh
   php artisan serve

7. **Acessar a aplicação**
- Abra o navegador e acesse http://servidor:configurado.

## Arquitetura do Projeto

### MVC(Model-View-Controller): Estrutura utilizada para organizar o código.

- [Models] - Representações dos dados, localizadas em app/Models.
- [Views] - Recursos e respostas de dados, localizadas em app/Http/Resources.
- [Controllers] - Lógica de controle das requisições, localizados em app/Http/Controllers.
- [Middleware] - Camadas intermediárias para tratar requisições HTTP, localizadas em app/Http/Middleware.

## Pagamentos

### Criar Pagamento
**Endpoint:** `/charges/saveCharge`

**Dados:** `admin_id(int)`, `user_id(int)`, `value(float)`, `issued_at(date)`, `expire_at(date)`

*As datas devem estar no formato `yyyy-mm-dd`.*

### Retornar Pagamentos por Usuário-Status
**Endpoint:** `/charges/user/{id}/{status}`

**Descrição:** Retorna pagamentos de um usuário específico com um status específico.

**Exemplo:** `/charges/user/4/3` - Retorna todos os pagamentos cancelados do usuário 3.

### Atualizar Pagamentos

#### Status
**Endpoint:** `/charges/updateChargeStatus`

**Dados:** `admin_id(int)`, `charge_id(int)`, `status_id(int)`

#### Vencimento
**Endpoint:** `/charges/updateChargeExpiracy`

**Dados:** `admin_id(int)`, `charge_id(int)`, `expire_at(date)`

#### Valor
**Endpoint:** `/charges/updateChargeValue`

**Dados:** `admin_id(int)`, `charge_id(int)`, `value(float(6,2))`

## Documentos

### Salvar
**Endpoint:** `/documents/save`

**Dados:** `admin_id(int)`, `document(input[file])`, `folder(string)`

### Atualizar
**Endpoint:** `/documents/update`

**Dados:** `admin_id(int)`, `document(input[file])`, `folder(string)`

### Deletar
**Endpoint:** `/documents/delete`

**Dados:** `admin_id(int)`, `document_id(int)`

### Listar
**Endpoint:** `/documents/list/{folder}`

### Visualização
**Endpoint:** `/documents/view/{user_id}/{document_id}`

**Descrição:** Registra a visualização do documento pelo usuário.

## Comunicados

### Salvar
**Endpoint:** `/statement/save`

**Dados:** `text(string)`, `administrator(0/1)`, `staff(0/1)`, `resident(0/1)`, `fixed(0/1)`, `urgent(0/1)`, `expire(0/1)`, `expire_at(date)`, `title(string)`, `user_id(int)`

### Atualizar
**Endpoint:** `/statement/update`

**Dados:** `text(string)`, `administrator(0/1)`, `staff(0/1)`, `resident(0/1)`, `fixed(0/1)`, `urgent(0/1)`, `expire(0/1)`, `title(string)`, `user_id(int)`, `statement_id(int)`

### Listar
**Endpoint:** `/statement/list/`

### Deletar
**Endpoint:** `/statement/delete/`

**Dados:** `statement_id(int)`, `user_id(int)`

## Banco de Dados

### Pagamentos
Duas tabelas:
- **charge_status:** Descrição dos status de pagamento e seus IDs.
- **charges:** Dados referentes aos pagamentos como vencimento, ID de usuário, valor e status.

### Documentos
Duas tabelas:
- **documents:** Informações referentes aos documentos como nome, pasta e ID do usuário.
- **documents_visualization:** Informações sobre ID do documento e ID do usuário, registrando qual usuário visualizou qual documento e quando.

### Comunicados
- **statements:** Informações referentes aos comunicados.
