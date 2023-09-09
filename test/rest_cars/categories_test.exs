defmodule RentCarsWeb.Api.CategoriesTest do
  @moduledoc false

  use RentCars.DataCase

  alias RentCars.Categories
  alias RentCars.Categories.Category

  alias RentCars.CategoriesFixtures

  describe "list_categories/0" do
    test "should return all categories" do
      CategoriesFixtures.category_fixture(%{name: "Car 123", description: "123"})
      CategoriesFixtures.category_fixture(%{name: "Car 456", description: "456"})

      assert [
               %RentCars.Categories.Category{
                 id: _,
                 name: "CAR 123",
                 description: "123",
                 inserted_at: _,
                 updated_at: _
               },
               %RentCars.Categories.Category{
                 id: _,
                 name: "CAR 456",
                 description: "456",
                 inserted_at: _,
                 updated_at: _
               }
             ] = Categories.list_categories()
    end
  end

  describe "create_category/1" do
    test "should create when valid data" do
      attrs = %{description: "pumpkin 123", name: "sport"}

      assert {:ok, %Category{} = category} = Categories.create_category(attrs)
      assert category.name == String.upcase(attrs.name)
      assert category.description == attrs.description
    end

    test "should error when duplicated data" do
      attrs = %{description: "pumpkin 123", name: "sport"}

      Categories.create_category(attrs)

      assert {:error, changeset} = Categories.create_category(attrs)
      assert "has already been taken" in errors_on(changeset).name
      assert %{name: ["has already been taken"]} = errors_on(changeset)
    end

    test "should error when without required fields" do
      lack_description = %{name: "sport"}

      assert {:error, changeset} = Categories.create_category(lack_description)
      assert "can't be blank" in errors_on(changeset).description
      assert %{description: ["can't be blank"]} = errors_on(changeset)
    end
  end

  describe "get_category/1" do
    test "should return one category by id" do
      %Category{id: category_id} = CategoriesFixtures.category_fixture()

      assert %Category{id: ^category_id} = Categories.get_category(category_id)
    end
  end

  describe "update_category/1" do
    test "should update one category by id" do
      %Category{id: category_id} = category = CategoriesFixtures.category_fixture()

      new_name = "SUV"

      assert {:ok, %Category{id: ^category_id, name: ^new_name}} =
               Categories.update_category(category, %{name: new_name})
    end
  end

  describe "delete_category/1" do
    test "should delete one category by id" do
      category = CategoriesFixtures.category_fixture()

      assert {:ok, _} = Categories.delete_category(category)

      assert nil == Categories.get_category(category.id)
    end
  end
end
