defmodule RestAPI.Management.Vehicle_li do
  use Ecto.Schema
  import Ecto.Changeset


  schema "vehicle_li" do
    field :id_user, :integer
    field :plate, :string
    field :trademark, :integer
    field :type_bodywork, :integer
    field :type_vehicle, :integer

    timestamps()
  end

  @doc false
  def changeset(vehicle_li, attrs) do
    vehicle_li
    |> cast(attrs, [:plate, :type_vehicle, :type_bodywork, :trademark, :id_user])
    |> validate_required([:plate, :type_vehicle, :type_bodywork, :trademark, :id_user])
  end
end
