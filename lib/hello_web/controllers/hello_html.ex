defmodule HelloWeb.HelloHTML do
  use HelloWeb, :html

  embed_templates "hello_html/*"

  attr :msg, :string, required: true

  def greet(assigns) do
    ~H"""
    <div>
      <h2>Hello World, from <%= @msg %>!</h2>
      <table>
        <tr>
          <th>Number</th>
          <th>Power</th>
        </tr>
        <%= for num <- 1..10 do %>
        <tr>
          <td><%= num %></td>
          <td><%= num * num %></td>
        </tr>
        <% end %>
      </table>
      <%= raw "<strong>End</strong>" %>
      <ul>
        <%= for {item, index} <- Enum.with_index(1..10) do %>
          <li class={"bg-#{if rem(index, 2) == 0, do: 'black', else: 'white'}"}>
            <%= item %>
          </li>
        <% end %>
      </ul>
    </div>
    """
  end
end
