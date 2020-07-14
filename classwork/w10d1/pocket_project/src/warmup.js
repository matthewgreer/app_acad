const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
    if (htmlElement.children) {
        Array.from(htmlElement.children).forEach((child) => htmlElement.removeChild(child));
    }
    const newPTag = document.createElement("p");
    // const newPContent = document.createTextNode(`${string}`);
    // newPTag.appendChild(newPContent);
    newPTag.innerHTML = string;
    htmlElement.appendChild(newPTag);
};


// htmlGenerator('Party Time.', partyHeader);
htmlGenerator('I\'m so vanilla!', partyHeader);