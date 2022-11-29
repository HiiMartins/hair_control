defmodule HairControlWeb.ServicePacksView do
  use HairControlWeb, :view

  alias HairControl.ServicePacks

  def render("create.json", %{
        service_pack: %ServicePacks{
          id: id,
          title: title,
          description: description,
          total_seasons: total_seasons,
          price: price,
          list_service_id: list_service_id,
          status: status,
          inserted_at: inserted_at
        }
      }) do
    %{
      message: "Service pack created!",
      service_pack: %{
        id: id,
        title: title,
        description: description,
        total_seasons: total_seasons,
        price: price,
        list_service_id: list_service_id,
        status: status,
        inserted_at: inserted_at
      }
    }
  end

  def render("delete.json", %{service_pack: %ServicePacks{title: title}}) do
    %{
      message: "The service pack #{title} was deleted with sucess!"
    }
  end

  def render("list.json", %{service_pack: service_pack}) do
    Enum.map(service_pack, &render("show.json", %{service_pack: &1}))
  end

  def render("show.json", %{
        service_pack: %ServicePacks{
          id: id,
          title: title,
          description: description,
          total_seasons: total_seasons,
          price: price,
          list_service_id: list_service_id,
          status: status,
          inserted_at: inserted_at
        }
      }) do
    %{
      id: id,
      title: title,
      description: description,
      total_seasons: total_seasons,
      price: price,
      list_service_id: list_service_id,
      status: status,
      inserted_at: inserted_at
    }
  end

  def render("update.json", %{
        service_pack: %ServicePacks{
          id: id,
          title: title,
          description: description,
          total_seasons: total_seasons,
          price: price,
          list_service_id: list_service_id,
          status: status,
          inserted_at: inserted_at
        }
      }) do
    %{
      message: "Service pack updated!",
      service_pack: %{
        id: id,
        title: title,
        description: description,
        total_seasons: total_seasons,
        price: price,
        list_service_id: list_service_id,
        status: status,
        inserted_at: inserted_at
      }
    }
  end
end
