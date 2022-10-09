defmodule HairControl.Helper.Verifications do

  def verify_status(%{status: status} = params) do
    case status == "active" do
      false -> {:error, "Client is inactive"}
      true -> {:ok, params}
    end
  end
end
