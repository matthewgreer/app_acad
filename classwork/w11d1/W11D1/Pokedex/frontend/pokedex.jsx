import React from "react";
import ReactDOM from "react-dom";
import { fetchAllPokemon } from "./util/api_util";
import { receiveAllPokemon } from "./actions/pokemon_action"

document.addEventListener('DOMContentLoaded', () => {
    const root = document.getElementById('root');

    window.fetchAllPokemon = fetchAllPokemon;
    window.receiveAllPokemon = receiveAllPokemon;

    ReactDOM.render(<h1>Pokedex</h1>, root);
});