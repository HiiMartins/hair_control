# HairControl
> :construction: Projeto em construção :construction:
<p>É uma api REST, construída em Elixir com o objetivo de auxliar na administração de um salão de cabeleiro</p>

Para iniciar seu server:

  * Instale as dependências com: `mix deps.get`
  * Crie e migre seu bando de dados com: `mix ecto.setup`
  * Inicie Phoenix endpoint com: `mix phx.server` ou inside IEx com: `iex -S mix phx.server`

Agora você pode visitar [`localhost:4000`](http://localhost:4000) do seu navegador.
<br><br>

# Chamadas para API

## Funcionáros
### Inserção de um funcinário
**[POST]** _api/employees_
```json
Exemplo da requisão
{
	"email": "EMPLOYEE@MAIL.COM",
	"password": "123456",
	"name": "NAME",
	"cpf": "12345678900"
}
```
```json
Exemplo da resposta
{
  "message": "Employee created!",
	"employee": {
		"cpf": "12345678912",
		"email": "EMAIL@MAIL.com",
		"id": "UUID",
		"inserted_at": "2022-07-04T20:35:16",
		"name": "NAME"
	}
}
```
### Realização de login do funcionário
**[POST]** _/api/employees/signin_
```json
Exemplo da requisição de login

{
	"email": "EMAIL",
	"password": "PASSWORD"
}
```
```json
Exemplo da resposta de sucesso no login

{
	"token": "TOKEN_JWT"
}
```

### Atualizar o Registro de um funcionário

**[PUT]** _/api/employees/:id_

``` json
Exemplo de requisão alterando o nome

{
	"name": "UPDATE_NAME"
}
```
```json
Exemplo da resposta
{
  "message": "Employee created!",
	"employee": {
		"cpf": "12345678912",
		"email": "EMAIL@MAIL.com",
		"id": "UUID",
		"inserted_at": "2022-07-04T20:35:16",
		"name": "UPDATE_NAME"
	}
}
```
### Buscar dados de um Funcionário
**[GET]** _/api/employees/:id_

### Listar todos os Funcinários
**[GET]** _/api/employees_

### Atualizar os dados de um Funcionário
**[PUT]** _/api/employees_

### Excluir funcionário da base de dados
**[DELETE]** _/api/employees/:id_

## Clientes
### Inserção de Clientes

**[POST]** _/api/clients_ 

```json
Exemplo de requisão

{
	"name": "NAME",
	"cpf": "12345678900",
	"rg": "123456780",
	"address": "RUA, N°",
	"district": "BAIRRO",
	"phone": "(xx) xxxxx-xxxx"
}
```
```json
Exemplo da resposta de Sucesso

{
  "message": "Client created!",
	"client": {
		"cpf": "12345678900",
		"id": "UUID",
		"inserted_at": "2022-07-03T04:05:31",
		"name": "NAME",
		"phone": "(xx) xxxxx-xxxx",
		"rg": "123456780"
	}
}
```

### Atualizar o Registro de um cliente

**[PUT]** _/api/clients/:id_

``` json
Exemplo de requisão alterando o nome

{
	"name": "UPDATE_NAME"
}
```

```json
Exemplo da resposta de sucesso
{
  "message": "Client updated!",
	"client": {
		"cpf": "12345678900",
		"id": "UUID",
		"inserted_at": "2022-07-03T04:05:31",
		"name": "UPDATE_NAME",
		"phone": "(xx) xxxxx-xxxx",
		"rg": "123456780"
	}
}
```

### Buscar os dados de um cliente
**[GET]** _/api/clients/:id_
```json
Exemplo da resposta, passando um id que corresponde a um cliente. 

{
	"id": "UUID",
	"inserted_at": "2022-07-03T04:05:31",
	"name": "NAME",
	"phone": "(xx) xxxxx-xxxx"
}
```
### Listar todos o clientes
**[GET]** _/api/clients_
```json
Exemplo da resposta, quando não houver clientes cadastrados

[]
```
```json
Exemplo da resposta, quando houver clientes cadastrados

[
	{
		"id": "UUID",
		"inserted_at": "2022-07-03T04:05:31",
		"name": "NAME",
		"phone": "(xx) xxxxx-xxxx"
	},
	{
		"id": "UUID",
		"inserted_at": "2022-07-03T04:05:31",
		"name": "NAME",
		"phone": "(xx) xxxxx-xxxx"
	},
	{
		"id": "UUID",
		"inserted_at": "2022-07-03T04:05:31",
		"name": "NAME",
		"phone": "(xx) xxxxx-xxxx"
	}
	...
]
```

### Deletar um cliente

**[DELETE]** _api/clients/:id_
```json
Exemplo da resposta, passando um id válido.

{
	"message": "The client CLIENT_NAME was deleted with sucess!"
}
```

## Serviços
### Inserção de um serviço no Banco
**[POST]** _/api/services_

```json
Exemplo da requisão
{
	"title": "TITLE_SERVICE",
	"price": 20.00
}
```
```json
Exemplo da resposta
{
	"message": "Service created!",
	"service": {
		"id": "UUID",
		"inserted_at": "2022-07-03T04:05:56",
		"price": 20.0,
		"title": "TITLE_SERICE"
	}
}
```

## Venda
### Cadastrando uma venda
**[POST]** _/api/sales_
```json
Exemplo da requisição

{
	"payment_method": "PAYMENT_METHOD", // "dinheiro", "cartão", "fiado".
	"employee_id": "EMPLOYEE_UUID",
	"service_id": "SERVICE_UUID",
	"client_id": "CLIENT_UUID"
}
```

```json
Exemplo da resposta
{
	"messagge": "Sale created!",
	"sale": {
		"client_id": "CLIENT_UUID",
		"employee_id": "EMPLOYEE_ID",
		"id": "UUID",
		"inserterd_at": "2022-07-04T20:36:55",
		"service_id": "SERVICE_UUID"
	}
}
```
### Buscar dados de uma venda
**[GET]** _/api/sales/:id_

### Listar todas as vendas
**[GET]** _/api/sales_

### Excluir venda da base de dados
**[DELETE]** _/api/sales/:id_

## Folha de Pagamento
### Cadastrar um Pagamento de um funcionário 
**[POST]** _/api/employees/payroll_

### Buscar dados de uma venda
**[GET]** _/api/employees/payroll/:id_

### Listar todas as vendas
**[GET]** _/api/employees/payroll_

### Excluir venda da base de dados
**[DELETE]** _/api/employees/payroll/:id_

***

## Learn more about Phoenix and Elixir

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix