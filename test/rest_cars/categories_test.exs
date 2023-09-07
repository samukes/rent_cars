defmodule RentCarsWeb.Api.CategoriesTest do
  @moduledoc false

  use RentCars.DataCase

  alias RentCars.Categories
  alias RentCars.Categories.Category

  describe "list_categories/0" do
    test "should return all categories" do
      assert Categories.list_categories() == []
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
end
