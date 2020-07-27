# params?
- hash like object that holds information from our request
# then, strong params?
- its a way for us to filter params selecting specific keys

# HTML ERB template
- <%= %> erb tag for printing values
  - shortcut: pe + tab / shift + ctrl + ~
- <% %> erb tag for logics
  - shortcut: er + tab
- <%# %> erb tag for comments
- we have access to instance variables that are declared from the action that renders the template.

# How to render templates
- render :template_name
- render '/laughs/template_name'
- render '/laughs/template_name.html.erb'

# form html element
- needs:
  - action and method attributes (for path and verb)
  - input fields (for collecting information)

# Newly added routes
- new and edit
  - actions that renders form for us to fill out details about an entity that we want to create or update
  - then, using routes defined in method + action attributes to reach our proper controller actions: create or update
- on new,
  - http://localhost:3000/laughs(action) + Post(method) sends request to laughs#create as you click 'Create New Laugh'

# HTTP Request is Stateless
- no previous request information is persisted.