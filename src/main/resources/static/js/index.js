///////////////////////// select box 설정 (지역, 매매기간) /////////////////////////
let date = new Date();
//let root="/05_WhereIsMyHome_Algorithm";

window.onload = function () {
  let yearEl = document.querySelector("#year");
  let yearOpt = `<option value="">매매년도</option>`;
  let year = date.getFullYear();
  for (let i = year; i > year - 20; i--) {
    yearOpt += `<option value="${i}">${i}년</option>`;
  }
  yearEl.innerHTML = yearOpt;

  // 브라우저가 열리면 시도정보 얻기.
  sendRequest("sido", "");
};

document.querySelector("#year").addEventListener("change", function () {
  let month = date.getMonth() + 1;
  let monthEl = document.querySelector("#month");
  let monthOpt = `<option value="">매매월</option>`;
  let yearSel = document.querySelector("#year");
  let m = yearSel[yearSel.selectedIndex].value == date.getFullYear() ? month : 13;
  for (let i = 1; i < m; i++) {
    monthOpt += `<option value="${i < 10 ? "0" + i : i}">${i}월</option>`;
  }
  monthEl.innerHTML = monthOpt;
});


// 시도가 바뀌면 구군정보 얻기.
document.querySelector("#sido").addEventListener("change", function () {
	initOption("gugun");
	initOption("dong");
	document.querySelector("#gugun").innerHTML = "구/군";
	document.querySelector("#dong").innerHTML = "동";
	
	if (this[this.selectedIndex].value){
		var selectValue = this[this.selectedIndex].value;
		sendRequest("gugun", selectValue);
	}
});

// 구군이 바뀌면 동정보 얻기.
document.querySelector("#gugun").addEventListener("change", function () {
	initOption("dong");
	document.querySelector("#dong").innerHTML = "동";
	if (this[this.selectedIndex].value){
		var selectValue = this[this.selectedIndex].value;
		sendRequest("dong", selectValue);
	}
});

function sendRequest(selid, selected) {
	console.log(selected);
  switch (selid) {
	case "sido":
		url= "http://localhost"+"/apt/getSido";
		break;
	case "gugun":
		url= "http://localhost"+"/apt/getGugun?sido="+selected;
		break;
	case "dong":
		var select = document.getElementById("sido");
        var selectsido = select.options[select.selectedIndex].value;
		url= "http://localhost"+"/apt/getDong?sido="+selectsido+"&gugun="+selected;
		break;
	}
  	
	fetch(`${url}`)
	.then((response) => response.json())
	.then((data) => addOption(selid, data));
}


function addOption(selid, data) {
  let opt = ``;
  initOption(selid);
  switch (selid) {
    case "sido":
      opt += `<option value="">시/도</option>`;
      break;
    case "gugun":
      opt += `<option value="">구/군</option>`;
      break;
    case "dong":
      opt += `<option value="">동</option>`;
      break;
  }
  for (var value of data) {
      opt += "<option>" + value + "</option>";
    }
  document.querySelector(`#${selid}`).innerHTML = opt;
}

function initOption(selid) {
  let options = document.querySelector(`#${selid}`);
  options.length = 0;
  // let len = options.length;
  // for (let i = len - 1; i >= 0; i--) {
  // options.remove(i);
  // }
}


function makeList(data) {
  document.querySelector("#houses").setAttribute("style", "display: ;");
  document.querySelector("#result").setAttribute("style", "display: ;");// 보이자
  document.querySelector("#property-nav").setAttribute("style", "display: ;");
  let parser = new DOMParser();
  const xml = parser.parseFromString(data, "application/xml");
  let slider = document.querySelector("#slider");
  
  // console.log(xml);
  
  let apts = xml.querySelectorAll("item");
  apts.forEach((apt) => {
    let div_property_item = document.createElement("div")
    div_property_item.setAttribute("class", "property-item tns-item");
    // div_property_slider.appendChild(div_property_item);

    let a_img = document.createElement("a")
    a_img.setAttribute("href", "property-single.html");
    a_img.setAttribute("class", "img");
    div_property_item.appendChild(a_img);

    let img = document.createElement("img");
    var num = Math.floor(Math.random()*7+1)+1; // 1~8 img 번호
    img.setAttribute("src", `images/img_${num}.jpg`);
    img.setAttribute("alt", "Image");
    img.setAttribute("class", "img-fluid");
    a_img.appendChild(img);
  
    let div_property_content = document.createElement("div");
    div_property_content.setAttribute("class", "property-content")
    div_property_item.appendChild(div_property_content);

    let div_price = document.createElement("div");
    div_price.setAttribute("class", "price mb-2");
    div_price.setAttribute("id", "price");

    let span_price = document.createElement("span");
    span_price.appendChild(document.createTextNode("₩" + apt.querySelector("거래금액").textContent+"만"));
    
    div_price.appendChild(span_price);
    div_property_content.appendChild(div_price);

    let div_address = document.createElement("div");
    div_property_content.appendChild(div_address);

    let span_address = document.createElement("span");
    span_address.setAttribute("class", "d-block mb-2 text-black-50");
    span_address.setAttribute("id", "address");
    span_address.appendChild(document.createTextNode(apt.querySelector("법정동").textContent));
    div_address.appendChild(span_address);

    let span_aptName = document.createElement("span");
    span_aptName.setAttribute("class", "city d-block mb-3");
    span_aptName.setAttribute("id", "aptName");
    span_aptName.appendChild(document.createTextNode(apt.querySelector("아파트").textContent));
    div_address.appendChild(span_aptName);

    let div_specs = document.createElement("div");
    div_specs.setAttribute("class", "specs d-flex mb-4");
    div_address.appendChild(div_specs);

    let span_item = document.createElement("span");
    span_item.setAttribute("class", "d-block d-flex align-items-center me-3");
    div_specs.appendChild(span_item);

    // icon 생략
    let span_caption = document.createElement("span");
    span_caption.setAttribute("class", "caption");
    span_caption.setAttribute("id", "area");
    span_caption.appendChild(document.createTextNode("면적 " + apt.querySelector("전용면적").textContent));
    span_item.appendChild(span_caption);

    let span_item2 = document.createElement("span");
    span_item2.setAttribute("class", "d-block d-flex align-items-center");
    div_specs.appendChild(span_item2);

    // icon 생략
    let span_caption2 = document.createElement("span");
    span_caption2.setAttribute("class", "caption");
    span_caption2.setAttribute("id", "floor");
    span_caption2.appendChild(document.createTextNode(apt.querySelector("층").textContent + "층"));
    span_item2.appendChild(span_caption2);

    let a_singlePage = document.createElement("a");
    // a_singlePage.setAttribute("href", "property-single.html");
    // a_singlePage.setAttribute("class", "btn btn-primary py-2 px-3");
    a_singlePage.setAttribute("id", "singlePage")
    // a_singlePage.textContent = "See details";
    div_address.appendChild(a_singlePage);
  
    slider.appendChild(div_property_item);
  });
}
