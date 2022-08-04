defmodule HairControlWeb.Auth.Guardian do
  use Guardian, otp_app: :hair_control

  alias HairControl.{Employee, Repo}

  def subject_for_token(%{id: id}, _claims) do
    sub = to_string(id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    claims
    |> Map.get("sub")
    |> HairControl.fetch_employee()
  end

  def authenticate(%{"id" => employee_id, "password" => password}) do
    case Repo.get(Employee, employee_id) do
      nil -> {:error, "Employee not found!"}
      employee -> validate_password(employee, password)
    end
  end

  def validate_password(%Employee{password_hash: hash} = employee, password) do
    case Argon2.verify_pass(password, hash) do
      true -> create_token(employee)
      false -> {:error, :unauthorized}
    end
  end

  def create_token(employee) do
    {:ok, token, _claims} = encode_and_sign(employee)
    {:ok, token}
  end
end
