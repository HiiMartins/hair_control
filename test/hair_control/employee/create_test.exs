defmodule HairControl.Employee.CreateTest do
  use HairControl.DataCase

  alias HairControl.{Employee, Repo}
  alias Employee.Create

  describe "call/1" do
    test "when all params are valid, creates a employee" do
      params = %{
        name: "Monique",
        cpf: "12345678900",
        password: "12345",
        email: "monique@mail.com"
      }

      count_before = Repo.aggregate(Employee, :count)

      response = Create.call(params)

      count_after = Repo.aggregate(Employee, :count)

      assert {:ok, %Employee{name: "Monique"}} = response
      assert count_after > count_before
    end

    test "when there are invalid params, return a error" do
      params = %{
        name: "Monique",
        cpf: "12345678900",
        password: "12",
        email: "monique@mail.com"
      }

      response = Create.call(params)

      assert {:error, changeset} = response
      assert errors_on(changeset) == %{password: ["should be at least 4 character(s)"]}
    end
  end
end
