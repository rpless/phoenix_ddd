defmodule PhoenixDdd.Persistence.Migrations.AddUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :user_id, :string, primary_key: true
      add :name, :string, null: false
      add :department, :string, null: false
    end
  end
end
