alias Calendlex.{EventType, Repo}

Repo.delete_all(EventType)

event_types = [
  %{
    name: "15 minute meeting",
    description: "Short meeting call.",
    slug: "15-minute-meeting",
    duration: 15,
    color: "blue"
  },
  %{
    name: "30 minute meeting",
    description: "Extended meeting call.",
    slug: "30-minute-meeting",
    duration: 30,
    color: "pink"
  },
  %{
    name: "Pair programming session",
    description: "One hour of pure pair programming fun!",
    slug: "pair-programming-session",
    duration: 60,
    color: "purple"
  }
]

for event_type <- event_types do
  event_type
  |> EventType.changeset()
  |> Repo.insert!()
end
