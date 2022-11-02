document.querySelector("#singlePage").addEventListener("click", function () {
    window.location.href="property-single.html";
    let aptName = document.querySelector("#aptName").textContent;
    let price = document.querySelector("#price").textContent;
    let address = document.querySelector("#address").textContent;
    let area = document.querySelector("#area").textContent;
    let floor = document.querySelector("#floor").textContent;
    loading(aptName, price, address, area, floor);
  });

function loading(aptName, price, address, area, floor){
    document.querySelector("aptName").textContent = aptName;
    document.querySelector("aptName2").textContent = aptName;
    //document.querySelector("")

}
