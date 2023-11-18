defmodule RentCars.Accounts.User do
  @moduledoc false

  use Ecto.Schema

  import Ecto.Changeset

  @role_values ~w(USER ADMIN)a
  @fields ~w(roles)a
  @required_fields ~w(first_name last_name user_name password password_confirmation email driver_license)a

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :user_name, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :password_hash, :string
    field :email, :string
    field :driver_license, :string
    field :roles, Ecto.Enum, values: @role_values, default: :USER

    timestamps()
  end

  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @fields ++ @required_fields)
    |> validate_required(@required_fields)
  end
end
