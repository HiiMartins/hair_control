defmodule HairControl.CientTest do
  use HairControl.DataCase

  alias HairControl.Client

  describe "build/1" do
    test "when all params are valid, return a tuple with :ok, struct" do
      params = %{
        name: "Evelin",
        phone: "189922334455",
        cpf: "12345678900",
        rg: "121231231",
        address: "Rua Faustino, 97",
        district: "São Franscico"
      }

      response = Client.build(params)

      assert {:ok,
              %Client{
                name: "Evelin",
                phone: "189922334455",
                cpf: "12345678900",
                rg: "121231231",
                address: "Rua Faustino, 97",
                district: "São Franscico"
              }} == response
    end

    test "when there are invalid params, returns a tuple whith :error and invalid changeset" do
      params = %{
        phone: "189922334455",
        cpf: "12345678900",
        rg: "121231231",
        address: "Rua Faustino, 97",
        district: "São Franscico"
      }

      response = Client.build(params)

      assert {:error, %Ecto.Changeset{valid?: false}} = response
    end
  end
end
