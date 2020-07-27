import { RECEIVE_ALL_POKEMON } from "../actions/pokemon_action";

const pokemonReducer = (oldState = {}, action) => {
  Object.freeze(oldState);
  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      return action.pokemons
    default:
      return oldState;
  }
}




export default pokemonReducer;