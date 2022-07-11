defmodule HairControlWeb.SalesView do
  use HairControlWeb, :view

  alias HairControl.{Client, Employee, Sale, Service}

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
    Enum.map(sale, &render("show.json", %{sale: &1}))
  end

  def render("show.json", %{
        sale: %Sale{
          client: %Client{
            name: name_client
          },
          service: %Service{
            title: title,
            price: price
          },
          employee: %Employee{
            name: name_employee
          },
          id: id,
          payment_method: payment_method,
          inserted_at: inserted_at
        }
      }) do
    %{
      id: id,
      name_client: name_client,
      name_employee: name_employee,
      title_service: title,
      price_service: price,
      payment_method: payment_method,
      inserted_at: inserted_at
    }
  end
end
