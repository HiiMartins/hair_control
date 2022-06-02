defmodule HairControl.Client.GetTest do
  use HairControl.DataCase

  alias HairControl.Client
  alias Client.{Create, Get}

  describe "call/1" do
    test "when receive a valid id, return a client" do
      params = %{
        name: "Evelin",
        phone: "189922334455",
        cpf: "12345678900",
        rg: "121231231",
        address: "Rua Faustino, 97",
        district: "São Franscico"
      }

      {:ok, client} = Create.call(params)

      response = Get.call(client.id)

      assert {:ok, %Client{name: "Evelin"}} = response
    end
  end
end
