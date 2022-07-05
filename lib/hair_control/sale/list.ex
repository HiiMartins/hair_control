defmodule HairControl.Sale.List do
  alias HairControl.{Sale, Repo}

  def call(), do: {:ok, Repo.all(Sale)}
end
