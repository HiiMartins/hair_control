defmodule HairControl.Sale.CreateTest do
  use HairControl.DataCase

  alias HairControl.{Sale, Repo}
  alias Sale.Create

  describe "call/1" do
    test "When all params are valid, create a sales record" do
      params = %{
        payment_method: "dinheiro",
        employee_id: "2a35c6e2-04a3-4f2f-bb45-fb2ff260d330",
        client_id: "2a35c6e2-04a3-4f2f-bb45-fb2ff260d330",
        service_id: "2a35c6e2-04a3-4f2f-bb45-fb2ff260d330"
      }

      count_before = Repo.aggregate(Sale, :count)

      response = Create.call(params)

      count_after = Repo.aggregate(Sale, :count)

      assert {:ok,
              %Sale{
                payment_method: :dinheiro,
                employee_id: "2a35c6e2-04a3-4f2f-bb45-fb2ff260d330",
                client_id: "2a35c6e2-04a3-4f2f-bb45-fb2ff260d330",
                service_id: "2a35c6e2-04a3-4f2f-bb45-fb2ff260d330"
              }} == response

      assert count_after > count_before
    end
  end
end
