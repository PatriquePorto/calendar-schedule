defmodule CalendlexWeb.Admin.Components.EventTypeForm do
  use CalendlexWeb, :live_component

  alias Calendlex.EventType
  alias Phoenix.LiveComponent

  def update(
    %{
      event_type: %EventType{color: current_color, slug: slug} = event_type,
      changeset: changeset
    },
    socket
  ) do
    socket =
      socket
      |> assign(changeset: changeset)
      |> assign(event_type: event_type)
      |> assign(current_color: current_color)
      |> assign(public_url: build_public_url(socket, slug))

    {:ok, socket}
  end

  defp build_public_url(socket, nil) do
    build_public_url(socket, "")
  end

  defp build_public_url(socket, slug) do
    Routes.live_url(socket, CalendlexWeb.EventTypeLive, slug)
  end
end
