defmodule HairControl.Employee.Payroll.CreateTest do
  use HairControl.DataCase

  alias HairControl.{Employee, Repo}
  alias Employee.Payroll

  describe "call/1" do
    test "when all parrams are valid, create a register payroll and updated total received in employee" do
      params_employee = %{
        name: "Monique",
        cpf: "12345678900",
        password: "12345",
        email: "monique@mail.com"
      }

      {:ok, %{id: employee_id}} = Employee.Create.call(params_employee)

      params_payroll = %{
        amount_paid: 20.0,
        employee_id: employee_id
      }

      count_before = Repo.aggregate(Payroll, :count)

      response_payroll = Payroll.Create.call(params_payroll)
      response_total_recived = Repo.get(Employee, employee_id)

      count_after = Repo.aggregate(Payroll, :count)

      assert count_after > count_before
      assert {:ok, %Payroll{amount_paid: 20.0}} = response_payroll
      assert {:ok, %Employee{total_received: 20.0}} = {:ok, response_total_recived}
    end
  end
end
