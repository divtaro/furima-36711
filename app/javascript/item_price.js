window.addEventListener('load', () => {
  //コンソール上の表示確認用
  // console.log("OK"); 
  // 金額を入力した数値をpriceInputという変数に格納する
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
  //コンソール上の表示確認用
  // console.log("イベント発火");
  const inputValue = priceInput.value;
  console.log(inputValue);

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