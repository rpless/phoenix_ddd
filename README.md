# PhoenixDdd

An example implementation of Domain Driven Design with Elixir/Phoenix Framework.

This application simulates a system at a university that allows various users to submit jobs to the system.
The goal of the system is to try to show the concepts of Repositories, Domain Entities, and Ubiquitous Language from Domain Driven Design.
It is by no means complete or authoritative.
It is only an example of my experience implementing DDD with Phoenix.
If you see a problem, want to help flesh it out more, or just have a question, feel free to open an issue or find me on the [Elixir Slack](elixir-lang.slack.com).

## Running the App.
To start your Phoenix app:

  1. Make sure you have a running Postgres instance.
  2. Install dependencies with `mix deps.get`
  3. Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  4. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Shortcomings
Currently, the only supported operations are creating jobs, accessing submitted jobs, and accessing users.
In the future, I'd like to add job completion (to show services) and some kind of "analytics" (to show another bounded context and aggregates).
