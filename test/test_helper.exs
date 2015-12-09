ExUnit.start

Mix.Task.run "ecto.create", ["--quiet", "-r", "PhoenixDdd.Persistence"]
Mix.Task.run "ecto.migrate", ["--quiet", "-r", "PhoenixDdd.Persistence"]
Ecto.Adapters.SQL.begin_test_transaction(PhoenixDdd.Persistence)
