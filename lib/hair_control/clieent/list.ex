defmodule HairControl.Client.List do
  alias HairControl.{Client, Repo}

  def call(), do: {:ok, Repo.all(Client)}
end
