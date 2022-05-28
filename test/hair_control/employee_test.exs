defmodule HairControl.EmployeeTest do
  use HairControl.DataCase

  alias HairControl.Employee

  describe "build/1" do
    test "when all params are valid, return a tuple with :ok, struct" do
      params = %{
        name: "Monique",
        cpf: "12345678900",
        password: "12345",
        email: "monique@mail.com"
      }

      response = Employee.build(params)

      assert {:ok,
              %Employee{
                cpf: "12345678900",
                email: "monique@mail.com",
                name: "Monique"
              }} = response
    end

    test "when there are invalid params, returns a tuple with :error, invalid changeset" do
      params = %{cpf: "12345678900"}

      response = Employee.build(params)

      assert {:error, %Ecto.Changeset{valid?: false}} = response
    end
  end
end
