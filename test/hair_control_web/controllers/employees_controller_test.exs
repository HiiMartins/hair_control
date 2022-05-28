defmodule HairControlWeb.EmployeesControllerTest do
  use HairControlWeb.ConnCase

  describe "create/2" do
    test "when the valid params, return a create message", %{conn: conn} do
      params = %{
        name: "Monique",
        cpf: "12345678900",
        password: "12345",
        email: "monique@mail.com"
      }

      response =
        conn
        |> post(Routes.employees_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "Employee created!",
               "employee" => %{"id" => _id, "inserted_at" => _inserted_at, "name" => "Monique"}
             } = response
    end

    test "when there are invalid params, return a error message", %{conn: conn} do
      params = %{
        cpf: "12345678900",
        password: "12345",
        email: "monique@mail.com"
      }

      response =
        conn
        |> post(Routes.employees_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{"message" => %{"name" => ["can't be blank"]}}

      assert response == expected_response
    end
  end
end
