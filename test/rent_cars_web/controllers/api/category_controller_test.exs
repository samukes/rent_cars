defmodule RentCarsWeb.Api.CategoryControllerTest do
  @moduledoc false

  use RentCarsWeb.ConnCase

  alias RentCars.Categories.Category
  alias RentCars.CategoriesFixtures

  describe "GET index" do
    test "should list all categories", %{conn: conn} do
      CategoriesFixtures.category_fixture(%{name: "Car 123", description: "123"})
      CategoriesFixtures.category_fixture(%{name: "Car 456", description: "456"})

      result = get(conn, ~p"/api/categories")

      assert [
               %{
                 "description" => "456",
                 "id" => _,
                 "name" => "CAR 456"
               },
               %{
                 "description" => "123",
                 "id" => _,
                 "name" => "CAR 123"
               }
             ] = json_response(result, 200)["data"]
    end
  end

  describe "GET show" do
    test "should retrieve a category by id", %{conn: conn} do
      %Category{id: id} = CategoriesFixtures.category_fixture()

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

  describe "PUT update" do
    test "should update a given category", %{conn: conn} do
      category = CategoriesFixtures.category_fixture()

      new_name = "Hatch"

      refute new_name == category.name

      result = put(conn, ~p"/api/categories/#{category.id}", category: %{name: new_name})

      new_name = String.upcase(new_name)

      assert %{"id" => _, "name" => ^new_name, "description" => _} =
               json_response(result, 200)["data"]
    end
  end

  describe "DELETE delete" do
    test "should update a given category", %{conn: conn} do
      category = CategoriesFixtures.category_fixture()

      result = delete(conn, ~p"/api/categories/#{category.id}")

      assert response(result, 204)
    end
  end
end
