defmodule RestAPI.Management.Trademark do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trademark" do
    field(:description, :string)

    timestamps()
  end

  @doc false
  def changeset(trademark, attrs) do
    trademark
    |> cast(attrs, [:description])
    |> validate_required([:description])
  end
end
