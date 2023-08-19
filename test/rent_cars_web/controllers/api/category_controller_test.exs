defmodule RentCarsWeb.Api.CategoryControllerTest do
  @moduledoc false

  use RentCarsWeb.ConnCase

  describe "GET index" do
    test "should list all categories", %{conn: conn} do
      result = get(conn, ~p"/api/categories")

      assert json_response(result, 200)["data"] == [
               %{
                 "description" => "pumpkin 1223",
                 "id" => "123123",
                 "name" => "SPOT"
               }
             ]
    end
  end
end
