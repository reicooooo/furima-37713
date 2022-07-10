window.addEventListener('load', () => {
  console.log("OK");
});

window.addEventListener('load', () => {
const priceInput = document.getElementById("item-price");
console.log(priceInput);
});

window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
   console.log("イベント発火");
 })
});