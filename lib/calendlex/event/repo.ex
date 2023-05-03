defmodule Calendlex.Event.Repo do
  alias Calendlex.{Event, Repo}

  import Ecto.Query

  def insert(params) do
    %Event{}
    |> Event.changeset(params)
    |> Repo.insert()
  end

  def get(id) do
    Event
    |> Repo.get(id)
    |> Repo.preload(:event_type)
    |> case do
      nil ->
        {:error, :not_found}

      event ->
        {:ok, event}
    end
  end

  def get_by_start_date(date) do
    Event
    |> where([e], fragment("?::date", e.start_at) == ^date)
    |> order_by(:start_at)
    |> Repo.all()
  end
end
