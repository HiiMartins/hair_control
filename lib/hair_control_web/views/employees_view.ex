defmodule HairControlWeb.EmployeesView do
  use HairControlWeb, :view

  alias HairControl.Employee

  def render("create.json", %{
        employee: %Employee{
          id: id,
          name: name,
          cpf: cpf,
          email: email,
          total_commission: total_commission,
          total_received: total_received,
          inserted_at: inserted_at,
          role: role,
          status: status
        },
        token: token
      }) do
    %{
      message: "Employee created!",
      employee: %{
        id: id,
        name: name,
        cpf: cpf,
        email: email,
        total_commission: total_commission,
        total_received: total_received,
        inserted_at: inserted_at,
        role: role,
        status: status
      },
      token: token
    }
  end

  def render("sign_in.json", %{token: token}), do: %{token: token}

  def render("delete.json", %{employee: %Employee{name: name}}) do
    %{
      message: "The Employee #{name} was inactived with sucess!"
    }
  end

  def render("list.json", %{employee: employee}) do
    Enum.map(employee, &render("show.json", %{employee: &1}))
  end

  def render("show.json", %{
        employee: %Employee{
          id: id,
          name: name,
          cpf: cpf,
          email: email,
          total_commission: total_commission,
          total_received: total_received,
          inserted_at: inserted_at,
          role: role,
          status: status
        }
      }) do
    %{
      id: id,
      name: name,
      cpf: cpf,
      email: email,
      total_commission: total_commission,
      total_received: total_received,
      inserted_at: inserted_at,
      role: role,
      status: status
    }
  end

  def render("update.json", %{
        employee: %Employee{
          id: id,
          name: name,
          cpf: cpf,
          email: email,
          inserted_at: inserted_at,
          role: role,
          status: status
        }
      }) do
    %{
      message: "Employee updated!",
      employee: %{
        id: id,
        name: name,
        cpf: cpf,
        email: email,
        inserted_at: inserted_at,
        role: role,
        status: status
      }
    }
  end
end
