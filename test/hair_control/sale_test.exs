defmodule HairControl.SaleTest do
  use HairControl.DataCase

  alias HairControl.Sale

  describe "build/1" do
    test "When all params are valid, return a tuple with {:ok, struct}" do
      params = %{
        payment_method: "dinheiro",
        employee_id: "2a35c6e2-04a3-4f2f-bb45-fb2ff260d330",
        client_id: "2a35c6e2-04a3-4f2f-bb45-fb2ff260d330",
        service_id: "2a35c6e2-04a3-4f2f-bb45-fb2ff260d330"
      }

      response = Sale.build(params)

      assert {:ok,
              %Sale{
                payment_method: :dinheiro,
                employee_id: "2a35c6e2-04a3-4f2f-bb45-fb2ff260d330",
                client_id: "2a35c6e2-04a3-4f2f-bb45-fb2ff260d330",
                service_id: "2a35c6e2-04a3-4f2f-bb45-fb2ff260d330"
              }} == response
    end
  end
end
