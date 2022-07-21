defmodule HairControl.Employee.Payroll.List do
  alias HairControl.{Employee, Repo}
  alias Employee.Payroll

  def call(), do: {:ok, Repo.all(Payroll)}
end
