defmodule RentCarsWeb.Api.AccountControllerTest do
  @moduledoc false

  use RentCarsWeb.ConnCase

  alias RentCars.AccountsFixtures

  describe "POST create" do
    test "should create a user", %{conn: conn} do
      attrs = AccountsFixtures.user_attrs()

      result = post(conn, ~p"/api/accounts", user: attrs)

      first_name = attrs.first_name
      email = String.downcase(attrs.email)

      assert %{"id" => _, "first_name" => ^first_name, "email" => ^email} =
               json_response(result, 201)["data"]
    end
  end
end
