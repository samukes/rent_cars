defmodule RentCars.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `RentCars.Accounts` context.
  """

  def user_attrs(attrs \\ %{}) do
    valid_attrs = %{
      first_name: "first_name",
      last_name: "last_name",
      user_name: "user_name",
      password: "password",
      password_confirmation: "password",
      email: "Email@com",
      driver_license: "123456789"
    }

    Enum.into(attrs, valid_attrs)
  end

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> user_attrs()
      |> RentCars.Accounts.create_user()

    user
  end
end
