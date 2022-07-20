defmodule HairControl.Sale.Create do
  alias HairControl.{Client, Employee, Sale, Service, Repo}

  def call(params) do
    params
    |> Sale.build()
    |> fetch_constraint()
    |> preloud_assotions()
    |> create_sale()
  end

  defp fetch_constraint(params) do
    params
    |> fetch_employee()
    |> fetch_client()
    |> fetch_service()
  end

  defp fetch_employee({:ok, %Sale{employee_id: employee_id}} = params) do
    case Repo.get(Employee, employee_id) do
      nil -> {:error, "Employee not found!"}
      _result -> params
    end
  end

  defp fetch_employee({:error, _reason} = error), do: error

  defp fetch_client({:ok, %Sale{client_id: client_id}} = params) do
    case Repo.get(Client, client_id) do
      nil -> {:error, "Client not found!"}
      _result -> params
    end
  end

  defp fetch_client({:error, _reason} = error), do: error

  defp fetch_service({:ok, %Sale{service_id: service_id}} = params) do
    case Repo.get(Service, service_id) do
      nil -> {:error, "Service not found!"}
      _result -> params
    end
  end

  defp fetch_service({:error, _reason} = error), do: error

  defp preloud_assotions({:ok, struct}) do
    struct
    |> Repo.preload([:service, :employee])
    |> Employee.Update.update_total_comission()
  end

  defp preloud_assotions({:error, _reason} = error), do: error

  defp create_sale({:ok, struct}), do: Repo.insert(struct)
  defp create_sale({:error, _changeset} = error), do: error
end
