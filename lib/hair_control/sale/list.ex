defmodule HairControl.Sale.List do
  import Ecto.Query

  alias HairControl.{Client, Employee, Sale, Service, Repo}

  # def call(%{}), do: {:ok, Repo.all(from(s in Sale, preload: [:client, :employee, :service]))}

  def call(params) do
    params
    |> apply_filter()
    |> response()
  end

  defp apply_filter(params) do
    params
    |> list_sale_by()
  end

  defp list_sale_by(filters) do
    filters
    |> Enum.reduce(Sale, fn
      {"payment_method", payment_method}, query ->
        query |> where([q], q.payment_method == ^payment_method)

      {"service_name", service_name}, query ->
        from(q in query, join: s in Service, where: s.title == ^service_name)

      {"employee_name", employee_name}, query ->
        from(q in query, join: e in Employee, where: e.name == ^employee_name)

      {"client_name", client_name}, query ->
        from(q in query, join: c in Client, where: c.name == ^client_name)

      {"data_from", data_from}, query ->
        query |> where([q], q.inserted_at >= ^data_from)
    end)
  end

  defp response(query) do
    {:ok, Repo.all(from(q in query, preload: [:client, :employee, :service]))}
  end
end
