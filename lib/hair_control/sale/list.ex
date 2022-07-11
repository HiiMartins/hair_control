defmodule HairControl.Sale.List do
  import Ecto.Query

  alias HairControl.{Sale, Repo}

  def call(), do: {:ok, Repo.all(from(s in Sale, preload: [:client, :employee, :service]))}
end
