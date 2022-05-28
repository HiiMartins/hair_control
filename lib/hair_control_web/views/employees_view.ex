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
end
