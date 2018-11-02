defmodule RestAPI.Management.Users_li do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users_li" do
    field :full_name, :string
    field :identification, :string
    field :last_name, :string
    field :type_user, :integer

    timestamps()
  end

  @doc false
  def changeset(users_li, attrs) do
    users_li
    |> cast(attrs, [:last_name, :full_name, :identification, :type_user])
    |> validate_required([:last_name, :full_name, :identification, :type_user])
  end
end
