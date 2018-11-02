defmodule RestAPI.Management.Type_bodywork do
  use Ecto.Schema
  import Ecto.Changeset


  schema "type_bodywork" do
    field :description, :string

    timestamps()
  end

  @doc false
  def changeset(type_bodywork, attrs) do
    type_bodywork
    |> cast(attrs, [:description])
    |> validate_required([:description])
  end
end
