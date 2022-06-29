defmodule HairControlWeb.SalesView do
  use HairControlWeb, :view

  alias HairControl.Sale

  def render("create.json", %{
    sale: %Sale{
      id: id,
      employee_id: employee_id,
      service_id: service_id,
      client_id: client_id,
      inserted_at: inserterd_at
    }
  }) do
    %{
      messagge: "Sale created!",
      sale: %{
        id: id,
        employee_id: employee_id,
        client_id: client_id,
        service_id: service_id,
        inserterd_at: inserterd_at
      }
    }
  end
end
