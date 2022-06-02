defmodule HairControl.Client.List do
  alias HairControl.{Client, Repo}

  def call(), do: Repo.all(Client)
end
