let arrPizzasEscolhidas = [];

for (let button of document.querySelectorAll(".menu-button")) {
    button.addEventListener("click", () => {
        if (button.clicked === false || button.clicked === undefined) {
            button.clicked = true;
            button.textContent = "Remover do pedido";
            button.classList.add("btn-gray");
            arrPizzasEscolhidas.push(button.id);
        }  else {
            button.textContent = "Adicionar ao pedido";
            button.clicked = false;
            button.classList.remove("btn-gray");
            arrPizzasEscolhidas.splice(arrPizzasEscolhidas.indexOf(button.id), 1);
        }

        console.log(button.classList);
    });
}

document.querySelector("#order-link").addEventListener("click", (e) => {
    document.getElementById("form").submit();
})