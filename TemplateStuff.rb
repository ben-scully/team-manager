<p id="notice"><%= notice %></p>

<h1>Event</h1>

<p>
  <strong>DisplayName:</strong>
  <%= @event.display_name %>
</p>

<p>
  <strong>Start:</strong>
  <%= @event.start %>
</p>

<p>
  <strong>Location:</strong>
  <%= @event.location %>
</p>

<p>
  <%= link_to 'Edit', edit_event_path(@event) %> |
  <%= link_to 'Back', events_path %>
</p>

<h2>Teams</h2>

<table>
  <thead>
    <tr>
      <th>Display Name</th>
      <th colspan="3"></th>
    </tr>
  </thead>

  <tbody>
    <% @event.teams.each do |team| %>
      <tr>
        <td><%= team.display_name %></td>
      </tr>
    <% end %>
  </tbody>
</table>
