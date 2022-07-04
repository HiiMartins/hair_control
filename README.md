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

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix