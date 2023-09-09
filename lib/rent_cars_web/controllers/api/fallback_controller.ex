defmodule RentCarsWeb.Api.FallbackController do
  @moduledoc false

  use RentCarsWeb, :controller

  alias RentCarsWeb.ErrorJSON

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(ErrorJSON)
    |> render("422.json", changeset: changeset)
  end
end
