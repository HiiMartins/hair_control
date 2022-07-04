# HairControl
<p>É uma api REST, construída em Elixir com o objetivo de auxliar na administração de um salão de cabeleiro</p>

Para iniciar seu server:

  * Instale as dependências com: `mix deps.get`
  * Crie e migre seu bando de dados com: `mix ecto.setup`
  * Inicie Phoenix endpoint com: `mix phx.server` ou inside IEx com: `iex -S mix phx.server`

Agora você pode visitar [`localhost:4000`](http://localhost:4000) do seu navegador.
<br><br>

# Chamadas para API
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

### Buscar um dados de um cliente
**[GET]** _/api/clients/:id_
```json
Exemplo da resposta, passando um id válido. 

{
	"id": "UUID",
	"inserted_at": "2022-07-03T04:05:31",
	"name": "NAME",
	"phone": "(xx) xxxxx-xxxx"
}
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

## Venda
### Cadastrando uma venda
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

## Learn more about Phoenix and Elixir

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix