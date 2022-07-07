defmodule HairControlWeb.SalesView do
  use HairControlWeb, :view

  alias HairControl.Sale

  def render("create.json", %{
        sale: %Sale{
          id: id,
          payment_method: payment_method,
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
        payment_method: payment_method,
        employee_id: employee_id,
        client_id: client_id,
        service_id: service_id,
        inserterd_at: inserterd_at
      }
    }
  end

  def render("delete.json", %{sale: %Sale{id: id}}) do
    %{
      message: "The sale de id #{id} was deleted with sucess!"
    }
  end

  def render("list.json", %{sale: sale}) do
    Enum.map(sale, &render("show.json", %{client: &1}))
  end

  def render("show.json", %{
        sale: %Sale{
          id: id,
          payment_method: payment_method,
          client_id: client_id,
          employee_id: employee_id,
          service_id: service_id,
          inserted_at: inserted_at
        }
      }) do
    %{
      id: id,
      payment_method: payment_method,
      client_id: client_id,
      employee_id: employee_id,
      service_id: service_id,
      inserted_at: inserted_at
    }
  end
end
