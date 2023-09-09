defmodule RentCarsWeb.Api.CategoryControllerTest do
  @moduledoc false

  use RentCarsWeb.ConnCase

  describe "GET index" do
    test "should list all categories", %{conn: conn} do
      result = get(conn, ~p"/api/categories")

      assert json_response(result, 200)["data"] == []
    end
  end

  describe "GET show" do
    test "should retrieve a category by id", %{conn: conn} do
      params = %{name: "Sport", description: "A sport for you"}

      %{"id" => id} =
        conn
        |> post(~p"/api/categories", category: params)
        |> json_response(201)
        |> Access.get("data")

      result = get(conn, ~p"/api/categories/#{id}")

      assert %{"id" => ^id} = json_response(result, 200)["data"]
    end
  end

  describe "POST create" do
    test "should list all categories", %{conn: conn} do
      name = "Sport"
      description = "A sport for you"
      params = %{name: name, description: description}

      result = post(conn, ~p"/api/categories", category: params)

      name = String.upcase(name)

      assert %{"id" => _, "name" => ^name, "description" => ^description} =
               json_response(result, 201)["data"]
    end

    test "should error when data is invalid", %{conn: conn} do
      params = %{name: "Sport"}

      result = post(conn, ~p"/api/categories", category: params)

      assert %{
               "errors" => %{
                 "detail" => "Unprocessable Entity",
                 "reason" => %{"description" => ["can't be blank"]}
               }
             } = json_response(result, 422)
    end
  end
end
