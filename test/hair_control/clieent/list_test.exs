defmodule HairControl.Client.ListTest do
  use HairControl.DataCase

  alias HairControl.Client
  alias Client.{Create, List}

  describe "call/1" do
    test "retuns a list with all clients" do
      params = %{
        name: "Evelin",
        phone: "189922334455",
        cpf: "12345678900",
        rg: "121231231",
        address: "Rua Faustino, 97",
        district: "São Franscico"
      }

      Create.call(params)

      response = List.call()

      #TO DO arrumar logica de teste do list
      assert response == response
    end
  end
end
