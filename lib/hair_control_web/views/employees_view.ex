defmodule HairControlWeb.EmployeesView do
  use HairControlWeb, :view

  alias HairControl.Employee

  def render("create.json", %{
        employee: %Employee{
          id: id,
          name: name,
          cpf: cpf,
          email: email,
          inserted_at: inserted_at
        }
      }) do
    %{
      message: "Employee created!",
      employee: %{
        id: id,
        name: name,
        cpf: cpf,
        email: email,
        inserted_at: inserted_at
      }
    }
  end

  def render("delete.json", %{employee: %Employee{name: name}}) do
    %{
      message: "The Employee #{name} was deleted with sucess!"
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
          inserted_at: inserted_at
        }
      }) do
    %{
      id: id,
      name: name,
      cpf: cpf,
      email: email,
      inserted_at: inserted_at
    }
  end

  def render("update.json", %{
        employee: %Employee{
          id: id,
          name: name,
          cpf: cpf,
          email: email,
          inserted_at: inserted_at
        }
      }) do
    %{
      message: "Employee updated!",
      employee: %{
        id: id,
        name: name,
        cpf: cpf,
        email: email,
        inserted_at: inserted_at
      }
    }
  end
end
