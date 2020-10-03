function price(){
  // 画面が読み込まれた時に動くように定義する
   const priceInput = document.getElementById("item-price");
   const add_tax = document.getElementById("add-tax-price");//販売手数料
   const profit = document.getElementById("profit");//販売利益
   // 価格入力時に手数料、利益計算
     priceInput.addEventListener('keyup', () => {
         const value = priceInput.value; //value（入力の金額を定義）
         
       if (value >= 300 && value <= 9999999){
         let fee = value * 0.1
         let gains = value - fee
         add_tax.textContent = fee;
         profit.textContent = gains;
     } else {
       let fee = '-';
       let gains = '-';
       add_tax.textContent = fee;
       profit.textContent = gains;
     }
   });
  
  }
  window.addEventListener('load', price);












//function calculation() {
//  const priceInput = document.getElementById("item_price")
//  priceInput.addEventListener("keyup", function(item_price){
//    item_price * 0.1
//  })
//  console.log("OK")
  // 関数の名前の定義をして、loadのカンマの隣にその関数の名前を記述しましょう
  // 価格（item-price）・販売手数料・販売利益のidを取得して変数に代入しましょう
  // ajax-app見ながら
  // addEventListener/keyup/input
//}
//window.addEventListener("load", calculation);



//function calculation() {
//const priceInput = document.getElementById("//")
//priceInput.addEventListener
//};
//window.addEventListener("turbolinks:load", calculation)


// ①入力された値を取得して変数に入れる
// ②取得した変数を使って手数料と利益を計算し、計算結果を変数に入れる Math.floor
 // ③計算結果の変数を画面上に表示させる