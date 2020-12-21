const pay = () => {
  Payjp.setPublicKey("pk_test_929531525968853461723df7");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault()

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order[number]"),
      exp_month: formData.get("order[exp_month]"),
      exp_year: `20${formData.get("order[exp_year]")}`,
      cvc: formData.get("order[cvc]"),
    };
    
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id
        const renderDom = document.getElementById("charge-form")
        const tokenObj = `<input value=${token} name='token' type="hidden">`
        renderDom.insertAdjacentHTML("beforeend", tokenObj)
      }
      document.getElementById("order_number").removeAttribute("name")
      document.getElementById("order_month").removeAttribute("name")
      document.getElementById("order_year").removeAttribute("name")
      document.getElementById("order_exp_year").removeAttribute("name")

      document.getElementById("charge-form").submit
    })
  })
};

window.addEventListener("load", pay);