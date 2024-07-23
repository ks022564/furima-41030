const price = () => {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.round(inputValue * 0.1);
    const profitDom = document.getElementById("profit");
    profitDom.innerHTML = Math.round(inputValue * 0.9);
  })
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);