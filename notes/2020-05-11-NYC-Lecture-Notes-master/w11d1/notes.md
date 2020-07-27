### Lecture Agenda
- React-Redux Review / Questions 
- What is jbuilder? 
  - allows us to control what data is sent up and how it's organized
  - allows us to convert Ruby objects into JSON
- jbuilder templates / methods
  - `json.array!`
  - `json.set!`
  - `json.extract!`
  - `json.partial!`
- Api Backend (Kookaburra App x Jbuilder)
  - use Rails as an API, send up data not HTML
- Normalized State
  - next objects under their ids to make them easy to refer to and to ensure that the keys are unique
  - don't duplicate data, there's a single source of truth for each entity, eerywhere else we just refer to its id

### Resource
- [Jbuilder Docs](https://github.com/rails/jbuilder) USE THE DOCS!!!