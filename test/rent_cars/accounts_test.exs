defmodule RentCars.AccountsTest do
  @moduledoc false

  use RentCars.DataCase

  alias RentCars.Accounts

  describe "create users" do
    test "create_user/1 with valid data" do
      valid_attrs = %{
        first_name: "first_name",
        last_name: "last_name",
        user_name: "user_name",
        password: "password",
        password_confirmation: "password_confirmation",
        email: "email",
        driver_license: "123456789"
      }

      assert {:ok, user} = Accounts.create_user(valid_attrs)

      assert valid_attrs.first_name == user.first_name
      assert valid_attrs.last_name == user.last_name
      assert valid_attrs.user_name == user.user_name
      assert valid_attrs.password == user.password
      assert valid_attrs.password_confirmation == user.password_confirmation
      assert valid_attrs.email == user.email
      assert valid_attrs.driver_license == user.driver_license
    end
  end
end
