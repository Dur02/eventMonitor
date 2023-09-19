"use strict"

	// 阈值加减
		var oReduce1 = document.getElementById('reduce1');
		var oAdd1 = document.getElementById('add1');
		var oThreshold1 = document.getElementById('threshold1');
		oReduce1.onclick = function(){
			oThreshold1.value--;
		};
		oAdd1.onclick = function(){
			oThreshold1.value++;
		};

		var oReduce2 = document.getElementById('reduce2');
		var oAdd2 = document.getElementById('add2');
		var oThreshold2 = document.getElementById('threshold2');
		oReduce2.onclick = function(){
			oThreshold2.value = parseInt(oThreshold2.value) - parseInt(oThreshold1.value);
		};
		oAdd2.onclick = function(){
			oThreshold2.value = parseInt(oThreshold2.value) + parseInt(oThreshold1.value);
		};