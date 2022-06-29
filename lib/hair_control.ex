defmodule HairControl do
  @moduledoc """
  HairControl keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  alias HairControl.{Employee, Client, Sale, Service}

  defdelegate create_employee(params), to: Employee.Create, as: :call

  defdelegate create_client(params), to: Client.Create, as: :call
  defdelegate delete_client(params), to: Client.Delete, as: :call
  defdelegate fetch_client(params), to: Client.Get, as: :call
  defdelegate list_clients(), to: Client.List, as: :call
  defdelegate update_client(params), to: Client.Update, as: :call

  defdelegate create_service(params), to: Service.Create, as: :call
  defdelegate delete_service(params), to: Service.Delete, as: :call
  defdelegate fetch_service(params), to: Service.Get, as: :call
  defdelegate list_services(), to: Service.List, as: :call
  defdelegate update_service(params), to: Service.Update, as: :call

  defdelegate create_sale(params), to: Sale.Create, as: :call
end
