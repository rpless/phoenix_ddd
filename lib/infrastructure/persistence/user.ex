defmodule PhoenixDdd.Persistance.User do
  use Ecto.Model
  
  @primary_key {:user_id, :string, autogenerate: false}

  schema "users" do
    field :name
    field :department
  end
end
