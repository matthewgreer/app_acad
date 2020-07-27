window.addEventListener('DOMContentLoaded', () => {
    const currentRoute = location.hash;
    console.log({ currentRoute });
});

window.addEventListener('hashchange', (e) => {
    const oldRoute = e.oldURL.split('#')[1];
    const newRoute = e.newURL.split('#')[1];

    debugger;

    console.log({ oldRoute });
    console.log({ newRoute });
});