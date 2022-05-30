defmodule HairControl.Client.CreateTest do
  use HairControl.DataCase

  alias HairControl.{Client, Repo}
  alias Client.Create

  describe "call/1" do
    test "When all params are valid, creates a Client" do
      params = %{
        name: "Evelin",
        phone: "189922334455",
        cpf: "12345678900",
        rg: "121231231",
        address: "Rua Faustino, 97",
        district: "São Franscico"
      }

      count_before = Repo.aggregate(Client, :count)

      response = Create.call(params)

      count_after = Repo.aggregate(Client, :count)

      assert {:ok,
              %Client{
                name: "Evelin",
                phone: "189922334455",
                cpf: "12345678900",
                rg: "121231231",
                address: "Rua Faustino, 97",
                district: "São Franscico"
              }} = response

      assert count_after > count_before
    end

    test "Where there are invalid params, return a error" do
      params = %{
        phone: "189922334455",
        cpf: "12345678900",
        rg: "121231231",
        address: "Rua Faustino, 97",
        district: "São Franscico"
      }

      response = Create.call(params)

      assert {:error, changeset} = response
      assert errors_on(changeset) == %{name: ["can't be blank"]}
    end
  end
end
