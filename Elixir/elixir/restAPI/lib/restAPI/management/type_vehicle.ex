defmodule RestAPI.Management.Type_vehicle do
  use Ecto.Schema
  import Ecto.Changeset


  schema "type_vehicle" do
    field :description, :string

    timestamps()
  end

  @doc false
  def changeset(type_vehicle, attrs) do
    type_vehicle
    |> cast(attrs, [:description])
    |> validate_required([:description])
  end
end
