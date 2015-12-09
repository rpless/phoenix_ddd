defmodule PhoenixDdd.Persistence.Job do
  use Ecto.Model

  @primary_key {:job_id, :string, autogenerate: false}

  schema "jobs" do
    field :user_id
    field :code
  end
end
