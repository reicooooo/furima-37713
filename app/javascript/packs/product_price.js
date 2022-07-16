window.addEventListener('load', () => {
const priceInput = document.getElementById("item-price");
// if(!priceInput) return null;
priceInput.addEventListener("input", () => {
   const inputValue = priceInput.value;
   const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.round(priceInput.value * 0.1);
    const addPofitDom = document.getElementById("profit");
    addPofitDom.innerHTML = Math.round(priceInput.value - Math.round(priceInput.value * 0.1))
})
});