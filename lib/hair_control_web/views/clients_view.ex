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

  def render("list.json", %{client: client}) do
    Enum.map(client, &render("show.json", %{client: &1}))
  end

  def render("show.json", %{
        client: %Client{
          id: id,
          name: name,
          phone: phone,
          inserted_at: inserted_at
        }
      }) do
    %{
      id: id,
      name: name,
      phone: phone,
      inserted_at: inserted_at
    }
  end

  def render("update.json", %{
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
      message: "Client updated!",
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
