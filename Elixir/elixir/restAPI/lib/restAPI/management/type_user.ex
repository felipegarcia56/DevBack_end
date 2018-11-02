defmodule RestAPI.Management.Type_user do
  use Ecto.Schema
  import Ecto.Changeset


  schema "type_user" do
    field :description, :string

    timestamps()
  end

  @doc false
  def changeset(type_user, attrs) do
    type_user
    |> cast(attrs, [:description])
    |> validate_required([:description])
  end
end
