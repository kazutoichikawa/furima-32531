window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input",() => {
    const inputValue = priceInput.value;
    const feeValue = parseInt(inputValue * 0.1);
    const profitValue = parseInt(inputValue - feeValue);
    const fee = document.getElementById("add-tax-price")
    fee.innerHTML = feeValue
    const profit = document.getElementById("profit")
    profit.innerHTML = profitValue
  })
});
 