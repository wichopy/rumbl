defmodule Rumbl.Repo do
  # use Ecto.Repo, otp_app: :rumbls
  # Uncomment this first section when hooking up actual db.
  # @doc """
  # Dynamically loads the repository url from the
  # DATABASE_URL environment variable.
  # """
  # def init(_, opts) do
  #   {:ok, Keyword.put(opts, :url, System.get_env("DATABASE_URL"))}
  # end


  # !!! Faking the database for now
  # @moduledoc """
  # In memory repository
  # """
  def all(Rumbl.User) do
    [%Rumbl.User{id: "1", name: "john", username: "jose", password: "elixir"},
    %Rumbl.User{id: "2", name: "greg", username: "ggman", password: "banana"},
    %Rumbl.User{id: "3", name: "mike", username: "jas", password: "whoops"},]
  end

  def all(_module), do: []

  def get(module, id) do
    Enum.find all(module), fn map -> map.id == id end
  end

  def get_by(module, params) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end
  end

end

#Example usage, in terminal run:

# iex -S mix 
# iex(1)> alias Rumbl.User
# iex(2)> alias Rumbl.Repo
# iex(3)> Repo.all User
# iex(4)> Repo.all Rumbl.Other
# iex(5)> Repo.get User, "1"
# iex(6)> Repo.get User, "2"
# iex(7)> Repo.get_by User, name: "john"
