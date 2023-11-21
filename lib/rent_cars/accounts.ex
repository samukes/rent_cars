defmodule RentCars.Accounts do
  @moduledoc false

  alias RentCars.Accounts.User
  alias RentCars.Repo

  def create_user(attrs) do
    attrs
    |> User.changeset()
    |> Repo.insert()
  end

  def get_user!(id) do
    Repo.get!(User, id)
  end
end
