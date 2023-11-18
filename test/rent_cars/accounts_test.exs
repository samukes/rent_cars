defmodule RentCars.AccountsTest do
  @moduledoc false

  use RentCars.DataCase

  alias RentCars.Accounts

  describe "create_user/1" do
    test "succes with valid data" do
      valid_attrs = %{
        first_name: "first_name",
        last_name: "last_name",
        user_name: "user_name",
        password: "password",
        password_confirmation: "password",
        email: "Email@com",
        driver_license: "123456789"
      }

      assert {:ok, user} = Accounts.create_user(valid_attrs)

      assert valid_attrs.first_name == user.first_name
      assert valid_attrs.last_name == user.last_name
      assert valid_attrs.user_name == user.user_name
      assert valid_attrs.password == user.password
      assert valid_attrs.password_confirmation == user.password_confirmation
      assert String.downcase(valid_attrs.email) == user.email
      assert valid_attrs.driver_license == user.driver_license
    end
  end

  test "throws an error when unique constraint is broken" do
    valid_attrs = %{
      first_name: "first_name",
      last_name: "last_name",
      user_name: "user_name",
      password: "password",
      password_confirmation: "password",
      email: "email@com",
      driver_license: "123456789"
    }

    assert {:ok, _user} = Accounts.create_user(valid_attrs)

    assert {:error, changeset} = Accounts.create_user(valid_attrs)
    assert %{driver_license: ["has already been taken"]} == errors_on(changeset)
  end

  test "throws an error when invalid email" do
    valid_attrs = %{
      first_name: "first_name",
      last_name: "last_name",
      user_name: "user_name",
      password: "password",
      password_confirmation: "password",
      email: "email com",
      driver_license: "123456789"
    }

    assert {:error, changeset} = Accounts.create_user(valid_attrs)
    assert "has invalid format" in errors_on(changeset).email
  end

  test "throws an error when invalid passowrd length" do
    valid_attrs = %{
      first_name: "first_name",
      last_name: "last_name",
      user_name: "user_name",
      password: "pas",
      password_confirmation: "pas",
      email: "email@com",
      driver_license: "123456789"
    }

    assert {:error, changeset} = Accounts.create_user(valid_attrs)
    assert "should be at least 6 character(s)" in errors_on(changeset).password
  end
end
