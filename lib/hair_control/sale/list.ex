defmodule HairControl.Sale.List do
  import Ecto.Query

  alias HairControl.{Repo, Sale}

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
        from q in query,
          join: s in assoc(q, :service),
          where: s.title == ^service_name,
          preload: [service: s]

      {"employee_name", employee_name}, query ->
        from q in query,
          join: e in assoc(q, :employee),
          where: e.name == ^employee_name,
          preload: [employee: e]

      {"client_name", client_name}, query ->
        from q in query,
          join: c in assoc(q, :client),
          where: c.name == ^client_name,
          preload: [client: c]

      {"data_from", data_from}, query ->
        query |> where([q], q.inserted_at >= ^data_from)
    end)
  end

  defp response(query) do
    {:ok, Repo.all(from(q in query, preload: [:client, :employee, :service]))}
  end
end
