<%= form_with model: [:admin, test],
                      url: update_inline_admin_test_path (test),
                      local: true,
                      class: 'form-inline hide',
                      data: { test_id: test.id } do |form| %>
   <%= form. text_field :title, class: 'form-control mr-2' %>
   <%= form.submit t('.submit'), class: 'btn btn-primary' %>
<% end %>