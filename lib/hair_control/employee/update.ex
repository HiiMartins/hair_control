defmodule HairControl.Employee.Update do
  alias HairControl.{Employee, Sale, Service, Repo}
  alias Employee.Payroll
  alias Ecto.UUID

  def call(%{"id" => uuid} = params) do
    case UUID.cast(uuid) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, _uuid} -> fetch_employee(params)
    end
  end

  def update_total_comission(
        %Sale{
          employee: employee,
          service: %Service{price: price, commission_percentage: commission_percentage}
        } = struct
      ) do
    result_update_comission = %{update_commission: price * commission_percentage |> div(100)}

    employee
    |> Employee.changeset(result_update_comission)
    |> Repo.update()

    {:ok, struct}
  end

  def update_total_received(
        %Payroll{
          employee: employee,
          amount_paid: amount_paid
        } = struct
      ) do
    employee
    |> Employee.changeset(%{amount_paid: amount_paid})
    |> Repo.update()

    {:ok, struct}
  end

  defp fetch_employee(%{"id" => uuid} = params) do
    case Repo.get(Employee, uuid) do
      nil -> {:error, "Employee not Found!"}
      employee -> update_employee(employee, params)
    end
  end

  defp update_employee(employee, params) do
    employee
    |> Employee.changeset(params)
    |> Repo.update()
  end
end
