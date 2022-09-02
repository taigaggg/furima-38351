window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const taxPriceInput = document.getElementById('add-tax-price');
    taxPriceInput.innerHTML = Math.floor(priceInput.value * 0.1);

    const profitInput = document.getElementById('profit');
    profitInput.innerHTML = Math.floor(priceInput.value - taxPriceInput.innerHTML );
  });
});