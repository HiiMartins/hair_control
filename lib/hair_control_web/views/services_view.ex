defmodule HairControlWeb.ServicesView do
  use HairControlWeb, :view

  alias HairControl.Service

  def render("create.json", %{
        service: %Service{
          id: id,
          title: title,
          price: price,
          commission_percentage: commission_percentage,
          inserted_at: inserted_at,
          status: status
        }
      }) do
    %{
      message: "Service created!",
      service: %{
        id: id,
        title: title,
        price: price,
        commission_percentage: commission_percentage,
        inserted_at: inserted_at,
        status: status
      }
    }
  end

  def render("delete.json", %{service: %Service{title: title}}) do
    %{
      message: "The service #{title} was deleted with sucess!"
    }
  end

  def render("list.json", %{service: service}) do
    Enum.map(service, &render("show.json", %{service: &1}))
  end

  def render("show.json", %{
        service: %Service{
          id: id,
          title: title,
          price: price,
          inserted_at: inserted_at,
          status: status
        }
      }) do
    %{
      id: id,
      title: title,
      price: price,
      inserted_at: inserted_at,
      status: status
    }
  end

  def render("update.json", %{
        service: %Service{
          id: id,
          title: title,
          price: price,
          inserted_at: inserted_at,
          status: status
        }
      }) do
    %{
      message: "Service updated!",
      service: %{
        id: id,
        title: title,
        price: price,
        inserted_at: inserted_at,
        status: status
      }
    }
  end
end
