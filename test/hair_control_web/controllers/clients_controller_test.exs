defmodule HairControlWeb.ClientsControllerTest do
  use HairControlWeb.ConnCase

  alias HairControl.Client

  setup %{conn: conn} do
    valid_params = %{
      name: "Evelin",
      phone: "1899711223344",
      rg: "1234567800",
      cpf: "12345678900",
      address: "Joao Flauzino, 38",
      district: "São Francisco"
    }

    {:ok, requester_client} = HairControl.create_client(valid_params)

    %{
      conn: conn,
      requester_client: requester_client
    }
  end

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

  describe "show/2" do
    test "when receive a valid id, return show message", %{
      conn: conn,
      requester_client: %Client{id: id}
    } do
      response =
        conn
        |> get(Routes.clients_path(conn, :show, id))
        |> json_response(:ok)

      assert %{"name" => "Evelin"} = response
    end
  end
end
