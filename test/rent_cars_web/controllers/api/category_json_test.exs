defmodule RentCarsWeb.Api.CategoryJSOMTest do
  @moduledoc false

  use RentCarsWeb.ConnCase, async: true

  alias RentCarsWeb.Api.CategoryJSON

  test "Renders index.json" do
    assert %{data: [%{description: "pumpkin 1223", id: "123123", name: "SPOT"}]} =
             CategoryJSON.render("index.json", %{
               categories: [%{description: "pumpkin 1223", id: "123123", name: "SPOT"}]
             })
  end

  test "Renders category.json" do
    assert %{description: "pumpkin 1223", id: "123123", name: "SPOT"} =
             CategoryJSON.render("category.json", %{
               category: %{description: "pumpkin 1223", id: "123123", name: "SPOT"}
             })
  end

  test "when not list should return empty list" do
    assert %{data: []} = CategoryJSON.render("index.json", %{categories: %{}})
  end
end
