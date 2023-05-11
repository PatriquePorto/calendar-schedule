defmodule CalendlexWeb.Admin.Components.EventType do
  use CalendlexWeb, :live_component

  alias CalendlexWeb.Admin.Components.Dropdown

  def mount(socket) do
    {:ok, socket}
  end

  def handle_event("clone_me", _params, socket) do
    event_type = socket.assigns.event_type

    case Calendlex.clone_event_type(event_type) do
      {:ok, new_event_type} ->
        {:noreply,
          push_redirect(socket,
          to: Routes.live_path(socket, CalendlexWeb.Admin.EditEventTypeLive, new_event_type)
          )}

     {:error, _} ->
       send(self(), :clone_error)
       {:noreply, socket}
    end
  end
end
