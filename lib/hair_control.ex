defmodule HairControl do
  @moduledoc """
  HairControl keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  alias HairControl.{Employee, Client}

  defdelegate create_employee(params), to: Employee.Create, as: :call

  defdelegate create_client(params), to: Client.Create, as: :call
  defdelegate fetch_client(params), to: Client.Get, as: :call
  defdelegate update_client(params), to: Client.Update, as: :call
end
