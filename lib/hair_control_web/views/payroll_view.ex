defmodule HairControlWeb.PayrollView do
  use HairControlWeb, :view

  alias HairControl.Employee.Payroll

  def render("create.json", %{
        payroll: %Payroll{
          id: id,
          amount_paid: amount_paid,
          employee_id: employee_id,
          inserted_at: inserted_at
        }
      }) do
    %{
      message: "Register in Payroll with sucess!",
      payroll: %{
        id: id,
        amount_paid: amount_paid,
        employee_id: employee_id,
        inserted_at: inserted_at
      }
    }
  end

  def render("delete.json", %{payroll: %Payroll{id: id}}) do
    %{
      message: "The regiter with id #{id} was deleted with success!"
    }
  end

  def render("list.json", %{payroll: payroll}) do
    Enum.map(payroll, &render("show.json", %{payroll: &1}))
  end

  def render("show.json", %{
    payroll: %Payroll{
      id: id,
      amount_paid: amount_paid,
      employee_id: employee_id,
      inserted_at: inserted_at
    }
  }) do
    %{
      id: id,
      amount_paid: amount_paid,
      employee_id: employee_id,
      inserted_at: inserted_at
    }
  end
end
