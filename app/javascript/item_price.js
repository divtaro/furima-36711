window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;

  // 販売手数料の変数を定義
  const addTaxDom = document.getElementById('add-tax-price');
  // 入力した金額をもとに販売手数料を計算する処理
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1)

  // 販売利益の変数を定義
  const addProfitDom = document.getElementById('profit');
  // 入力した金額をもとに販売利益を計算する処理
  addProfitDom.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML)
})

});