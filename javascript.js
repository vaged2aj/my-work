window.onload =  function() {init();
styling();
	
};	

var tarifniH;
		var pocetU;
		var pocetUPul;
		var nula;
		nula = true;

	    function tarif(tarifniH){
				// spocita vysi odmeny z tarifni hodnoty //
		if (tarifniH == 0){
				    return 0;
			    }
		else if (tarifniH <= 500){
			return 300;
				    }
		else if (tarifniH <= 1000){
			return 500;
				    }
		else if (tarifniH <=5000){
			return 1000;
							}
		else if (tarifniH <=10000){
			return 1500;
											    }
		else if (tarifniH <= 200000){
			return 1500+Math.ceil((tarifniH-10000)/1000)*40;
												}
		else if (tarifniH <= 10000000) {
			return 9100+Math.ceil((tarifniH-200000)/10000)*40;
												    }
		else if (tarifniH > 10000000) {
			return 48300+Math.ceil((tarifniH-10000000)/100000)*40;
																	}
		}

	    function getter() {
				
		    sazba = 21
			//tarifniH = document.getElementById("tarifniHF").value; 
			tarifniH = myGetVar("#tarifniHF",1,"tarifní hodnotu")
			pocetU = pocetUkonufunc()[0];
			pocetUPul = pocetUkonufunc()[1];
			SOpushtion = document.getElementById("prvni").value;
			snizTFVal = document.getElementById("snizTF").checked;
			ztratovyVal = document.getElementById("ztrata").value;
			ztrataVysl =	ztratovycas();
			cestovneFunction();
			sopfunction();
			dphFunction();
			pausal();
			celkemfunction();
			
			} 

		function cestovneFunction() {
		if (document.getElementById("cestovneF").value) {
		cestovne = parseInt(document.getElementById("cestovneF").value);								
		
		}
		else {
		cestovne = 0;
		}
		}

		function myGetVar(myId,type,nameVar) {
			
			if (type==1)
			{
			var myVar; 
			myVar = document.querySelector(myId).value;
			}
			else if (type==2){
				myVar = document.querySelector(myId).checked;

			}

			
			return myVar;
		}
	    function pausal() {
				if (pocetU){
						    rozpisPausal = "tj. "+(pocetU+pocetUPul)+" x "+koruna.format(300);
						    return pocetU*300;
					    }
				else {
				    rozpisPausal = "tj. 0 x "+koruna.format(300);
				    return 0;
					    }} 

	    function pocetUkonufunc() {
				var pocetU = parseInt(document.getElementById("pocetUF").value);
				if (!pocetU) {
						  
					pocetU = 0; 
					    }
				var pocetUPul = parseInt(document.getElementById("pocetUFpul").value);
				if (!pocetUPul) {
						  pocetUPul = 0; 
					    }
				return [pocetU,pocetUPul]
				}
	    function ztratovycas() {

				if (ztratovyVal) {
						 return ztratovyVal*100;
					    }
				else {
						    return 0
					    }}

	    function snizeni(x) {
				var b = x;
				if (snizTFVal){
					b = 0.8*x;
					if (b>5000) {
						    b = 5000;
								}
				}
					    
				else {b=x;} 
					    
				    return b;

			}

	    function odmena(pocetUkonu,tarifniH,pocetUPul) {
				// spocita odmenu podle AT, potrbuje pocet ukonu, tarifni hodnotu//
				if (snizTFVal){
					    rozpisOdmena = "tj. "+pocetUkonu+" x "+koruna.format(snizeni(tarif(tarifniH)))+" a "+pocetUPul+" x "+koruna.format(snizeni(tarif(tarifniH))*0.5)
				return (pocetUkonu+pocetUPul*.5)*snizeni(tarif(tarifniH));
			}
				else {
						    rozpisOdmena = "tj. "+pocetUkonu+" x "+koruna.format(tarif(tarifniH))+" a "+pocetUPul+" x "+koruna.format(tarif(tarifniH)*0.5);
						    return (pocetUkonu+pocetUPul*0.5)*tarif(tarifniH);
					    }}
    function sopfunction() {

				if (SOpushtion == "1") {
							sop = parseInt(soudnipushl(tarifniH,true));

	}			    else if (SOpushtion == '2') {

						sop = parseInt(soudnipushl(tarifniH));

						}
						    else if (SOpushtion == '3') {
									if (document.getElementById("vlastniF").value){
											    
									sop = parseInt(document.getElementById("vlastniF").value);
								}
									else {
											    sop = 0;
										    }
								}
			    else {
						sop = 0;
					}
					    
			}

	    function celkemfunction() {
				let odmenC = odmena(pocetU,tarifniH,pocetUPul);
				let pausalC = (pocetU+pocetUPul)*300;
				let cestovneC = parseInt(cestovne); 
				let ztratC = ztratovycas();
				let sazbaC = sazba
				let zaklad = odmenC+pausalC+cestovneC+ztratC
				celkem = dphFunction(zaklad,sazba)[0]+sop;
				pausalVysl = pausalC
				odmenVysl = odmenC
				dphVysl = dphFunction(zaklad,sazba)[1]
				zakladBezDPHVysl = zaklad
//				celkem = dphFunction((odmena(pocetU,tarifniH,pocetUPul))+(pocetU+pocetUPul)*300+parseInt(cestovne)+ztratovycas()),sazba)[0]+sop;
		}
	    

	    var koruna = new Intl.NumberFormat('cs-CZ',{style: 'currency', currency: 'CZK',});
	    
		
		// function vysledek() {
		// 	getter()
		// 	document.getElementById("pocetUV").innerHTML = pocetU; 
		// 		document.getElementById("odmenaV").innerHTML = koruna.format(odmenVysl);
		// 	document.getElementById("pausalV").innerHTML =koruna.format(pausalVysl);
		// 	document.getElementById("dphV").innerHTML =koruna.format(dphVysl);
		// 	document.getElementById("zakladbezV").innerHTML = koruna.format(zakladBezDPHVysl);
		// 	document.getElementById("sopV").innerHTML = koruna.format(sop);
		// 	document.getElementById("cestovneV").innerHTML =koruna.format(cestovne);
		// 	document.getElementById("celkemV").innerHTML =koruna.format(celkem);
		// 	document.getElementById("rozpisOdmenaV").innerHTML =rozpisOdmena;
		// 	document.getElementById("rozpispausalV").innerHTML =rozpisPausal;
		// 	document.getElementById("ztratovyV").innerHTML =koruna.format(ztrataVysl);
		// 	}


			function vysledek2() {
				getter()
				var va = {};
				va = {	
				"Počet úkonů:":pocetU+pocetUPul, 
					//pocetpul:pocetUPul,
					"Odměna:" :koruna.format(odmenVysl),
					"Paušál:":koruna.format(pausalVysl),
					"Cestovné:":koruna.format(cestovne),
					"Ztrátový čas":koruna.format(ztrataVysl),
					"Základ bez DPH: ":koruna.format(zakladBezDPHVysl),
					"DPH:":koruna.format(dphVysl),
					"SOP: ":koruna.format(sop),
					"Celkem: ":koruna.format(celkem)
					
															
				};
				// va.push(pocetU)
				// va.push(pausalVysl);
				// va.push(dphVysl);
				// va.push(zakladBezDPHVysl);
				// va.push(sop);
				// va.push(cestovne);
				// //  va += celkem;
				// //  va += rozpisOdmena;
				// // va += rozpisPausal;
				// // va += ztrataVysl;
				  var rozpis = {};
				  rozpis = {
					  
					  rozpO:rozpisOdmena,
					rozpP:rozpisPausal,
				  };
				return [va,rozpis];	
				
			}






			function soudnipushl(x,y=false){
if (y === true){
	if (x == 0){
		return 0;
	}
else if (x <= 10000){
			return 400;
		}
else if (x <= 20000){
				return 800;
					}
	
else { 
				return parseInt(Math.round(0.04*Math.ceil(x/10)*10,0));
}
	}
else {
	if (x ==0) {
		return 0;
	}
else if (x <= 20000){
				return 1000;
							}
else{
	return parseInt(Math.round(0.05*Math.ceil(x/10)*10,0));}
	}
}


function dphFunction (input, sazba) {
	var dphAnoNe = document.querySelector('#dphyesno').checked
	
	if (dphAnoNe) {
	return [(sazba/100+1)*input, sazba/100*input]
	}
	else {
		return [input, 0]
	}

	
}



var hlavicka = ["Počet úkonů:", "Odměna:", "Paušál:", "Cestovné:","Ztrátový čas:", "Základ bez DPH:", "DPH:", "SOP:"]
	var footer = ["Celkem"]	;


function Tabulka() {
		this.ukotveni = document.querySelector("#vyslRamec")
		this.tbl = document.createElement('table');
		this.tbl.setAttribute('id',"tabulkaVysledkyFork");
		this.ukotveni.appendChild(this.tbl);
		this.tbl.style.borderRadius="10px" ;
		// this.tbl.style.backgroundColor="grey" ;
		//this.tbl.style.width="600px"	;

		
		this.addrow = function(iter1,iter2,iter3) {
			var a = this.tbl.insertRow();
			var b = a.insertCell();
			b.innerHTML="<td class='prvni'>"+iter1+"</td>";
			b.setAttribute('class','prvni');
			var c = a.insertCell();
			c.innerHTML="<td class='druha'>"+iter2+"</td>";
			c.style.textAlign="right"
			c.setAttribute('class','druhaa')
			var d = a.insertCell();
			d.innerHTML="<td class='treti'>"+iter3+"</td>";
			
		
		}

		this.destroy = function() {
			ukotveni.remove();
		}
		
		// return this.tbl;	
}

function styling() {
	var abcInput = document.querySelector("#pocetUF");
	var bcdInput = document.querySelector("#pocetUFpul");
	var cdeInput = document.querySelector('#tarifniHF').value;
	var abc = document.querySelector("#pocetUF").value;
	var bcd = document.querySelector("#pocetUFpul").value;
	if (abc || bcd) {
		 
		 abcInput.style.backgroundColor="white"
		 bcdInput.style.backgroundColor="white"
	}
	else {
		abcInput.style.backgroundColor="pink"
		bcdInput.style.backgroundColor="pink"
		nula = true;
	}

	if (abc) {
		// abcInput.style.backgroundColor="honeydew";
		nula = false;
	}

	if (bcd) {
		// bcdInput.style.backgroundColor="honeydew"
		nula = false;
	}

	if (!cdeInput) {
	
		nula = true;
	}




}


function sopCheckfunc() {

	let sopInput = document.querySelector('#vlastniF');
	let sopCheck = document.querySelector('select'); 
	let sopLabel = document.querySelector('#vlastniLabel'); 
	
	
	if (sopCheck.value === "3") {
		sopInput.removeAttribute("disabled")
		sopLabel.innerHTML=" vlastní (Kč):"
	}
	else {
		sopInput.setAttribute("disabled","disabled")
		sopLabel.innerHTML=""

	}

}




function myEvent() {
	var abcInput = document.querySelector("#pocetUF");
	var bcdInput = document.querySelector("#pocetUFpul")
	abcInput.addEventListener('change',function(){styling()})
	bcdInput.addEventListener('change',function(){styling()})


}

function init() {
	myEvent();
	let sopCheck = document.querySelector('select');
	sopCheck.addEventListener('change',function(){sopCheckfunc()})

}


function Tabulka2() {
	this.legenda = ["Počet úkonů:", "Odměna:", "Paušál:", "Cestovné:","Ztrátový čas:", "Základ bez DPH:", "DPH:", "SOP:"]
	this.ukotveni = document.querySelector("#vyslRamec")
	this.tbl = document.createElement('table');
	this.tbl.setAttribute('id',"tabulkaVysledkyFork");
	this.ukotveni.appendChild(this.tbl);
	this.tbl.style.borderRadius="10px" ;
	// this.tbl.style.backgroundColor="grey" ;
	//this.tbl.style.width="600px"	;

	
	this.createRowsOf = function() {
		for (i in this.legenda) {
		var a = this.tbl.insertRow();
		
		a.innerHTML = "<td class='prvni'>"+this.legenda[i]+"</td>";
		
		}
		var posledni = this.tbl.createTFoot();
		posledni.innerHTML = "<td class='bold'>Celkem:</td>";
		
	}

	this.addMyCells = function(row,iter1,trida) {
		var radek = this.tbl.rows[row];
		radek.innerHTML += "<td class="+trida+">"+iter1;"</td>"
	
	}

	
	

	this.size = function() {
		return this.tbl.rows.length


	}
	this.destroy = function() {
		var ukotveni = document.querySelector('#tabulkaVysledkyFork')
		ukotveni.remove();
	}
	

}


	
	function vysledek3() {
		
		getter();
		
		
		let va = [];
		va.push(pocetU+pocetUPul);
		va.push(koruna.format(odmenVysl));
		va.push(koruna.format(pausalVysl));
		va.push(koruna.format(cestovne));
		va.push(koruna.format(ztrataVysl));	
		va.push(koruna.format(zakladBezDPHVysl));
		va.push(koruna.format(dphVysl));
		va.push(koruna.format(sop));
		va.push(koruna.format(celkem));
		va.push(rozpisOdmena);
		va.push(rozpisPausal);
	
				
			
		return va;	

	}

		
		

		
	

	function combined() {
		console.log(nula)
		styling();
		if (document.querySelector('#tabulkaVysledkyFork')) {
			document.querySelector('#tabulkaVysledkyFork').remove();
		}

		if (nula == true) {
			return 0;
		}

		let mtarif = document.querySelector("#tarifniHF").value
		let mpocetU = document.querySelector('#pocetUF').value
		let mpocetUpul = document.querySelector('#pocetUFpul').value

		console.log(mtarif,mpocetU,mpocetUpul)

		if (mtarif==NaN && mpocetU==NaN && mpocetUpul==NaN ) {
			console.log(5);
			return 0;
		}


		var iter = 0;
		let vysled = vysledek3();
		// for (i in vysled) {
		// 	console.log(vysled[i]);
		// }
		abcde = new Tabulka2();
		abcde.createRowsOf();
		for (let i=0; i < abcde.size(); i++) {
		 	abcde.addMyCells(i,vysled[i],"druha");
			
		 }
		abcde.addMyCells(1,vysled[9],"treti");
		abcde.addMyCells(2,vysled[10],"treti");

	
		// (1;vysled[9]);
		// abcde.addMyCells(2;vysled[10]);



	}

		
function vynulovat() {
	
	var abc = document.querySelectorAll('.vynulovat')
	
	abc.forEach(function(elem) {elem.value = "" })

	
	let mtab = document.querySelector('#tabulkaVysledkyFork');
	console.log(typeof(mtab));
	//if (!mtab == null) {
	mtab.remove();

	
	if (!typeof(abcde)=="undefined") {
	
	
	}
	var abcInput = document.querySelector("#pocetUF")
	var bcdInput = document.querySelector("#pocetUFpul")
	abcInput.style.backgroundColor="pink"
	bcdInput.style.backgroundColor="pink"
	
	// getter();
	// vysled = vysledek3();
	// console.log(odmenVysl)
	nula = true;
}
