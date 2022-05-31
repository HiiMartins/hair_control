defmodule HairControlWeb.ClientsControllerTest do
  use HairControlWeb.ConnCase

  describe "create/2" do
    test "when the valid params, return a create meessage", %{conn: conn} do
      params = %{
        name: "Evelin",
        phone: "1899711223344",
        rg: "1234567800",
        cpf: "12345678900",
        address: "Joao Flauzino, 38",
        district: "São Francisco"
      }

      response =
        conn
        |> post(Routes.clients_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "Client created!",
               "client" => %{"id" => _id, "name" => "Evelin"}
             } = response
    end

    test "when there are invalid params, return a error message", %{conn: conn} do
      params = %{
        phone: "1899711223344",
        rg: "1234567800",
        cpf: "12345678900",
        address: "Joao Flauzino, 38",
        district: "São Francisco"
      }

      response =
        conn
        |> post(Routes.clients_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{"message" => %{"name" => ["can't be blank"]}}

      assert response == expected_response
    end
  end
end
