defmodule PhoenixDdd.Model.Job do
  defstruct [
    job_id: nil,
    user_id: nil,
    code: nil
  ]

  def create(%{user_id: user_id, code: code}) do
    case {user_id, code} do
      {"", _} -> nil
      {_, ""} -> nil
      {user_id, code} ->
        id = UUID.uuid1()
        %__MODULE__{job_id: id, user_id: user_id, code: code}
    end
  end
  def create(_), do: nil
end
