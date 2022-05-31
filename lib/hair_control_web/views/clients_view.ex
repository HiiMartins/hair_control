defmodule HairControlWeb.ClientsView do
  use HairControlWeb, :view

  alias HairControl.Client

  def render("create.json", %{
        client: %Client{
          id: id,
          name: name,
          cpf: cpf,
          rg: rg,
          phone: phone,
          inserted_at: inserted_at
        }
      }) do
    %{
      message: "Client created!",
      client: %{
        id: id,
        name: name,
        phone: phone,
        cpf: cpf,
        rg: rg,
        inserted_at: inserted_at
      }
    }
  end
end
