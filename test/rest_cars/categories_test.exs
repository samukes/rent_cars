defmodule RentCarsWeb.Api.CategoriesTest do
  @moduledoc false

  use RentCars.DataCase

  alias RentCars.Categories

  describe "list_categories/0" do
    test " returns all categories" do
      assert Categories.list_categories() == []
    end
  end
end
