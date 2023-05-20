defmodule PentoWeb.WrongLive do
  use PentoWeb, :live_view

  def mount(_params, _session, socket) do
    {
      :ok,
      assign(
        socket,
        score: 0,
        message: "Make a guess:",
        secret_number: Enum.random(1..10)
        )
    }
  end

  @spec render(any) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~H"""
      <h1>Your score: <%= @score %></h1>
      <h2><%= @message %></h2>
      <h2>
        <%= for n <- 1..10 do %>
          <.link href="#" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-full" phx-click="guess" phx-value-number={n} >
            <%= n %>
          </.link>
        <% end %>
      </h2>
    """
  end

  def handle_event("guess", %{"number" => guess}, socket) do
    %{assigns: _ = %{secret_number: sn, score: cs}} = socket
    sn = to_string(sn)

    {message, score, secret_number} = case guess do
      ^sn -> {"WINNER", cs + 1, Enum.random(1..10)}
      _ ->   {"Your guess: #{guess}. Wrong. Guess again.", cs - 1, sn}
    end

    {
      :noreply,
      assign(
        socket,
        message: message,
        score: score,
        secret_number: secret_number
      )
    }
  end

end
