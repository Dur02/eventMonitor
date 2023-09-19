/**
 * 处理数字增加单位，万、百万 、千万、亿、百亿、千亿、万亿
 */
function numAddUnit(num,fixedVal){
	if(fixedVal == undefined){
		fixedVal =2;
	}
	
	var numLen = num.toString().length;
	
	if( numLen>=5 &&  numLen<7){
		num = (num/10000).toFixed(fixedVal)+'万';
	}else if( numLen==7){
		num = (num/1000000).toFixed(fixedVal)+'百万';
	}else if( numLen==8){
		num = (num/10000000).toFixed(fixedVal)+'千万';
	}else if( numLen>=9 &&  numLen<11){
		num = (num/100000000).toFixed(fixedVal)+'亿';
	}else if( numLen==11 ){
		num = (num/10000000000).toFixed(fixedVal)+'百亿';
	}else if( numLen==12){
		num = (num/100000000000).toFixed(fixedVal)+'千亿';
	}else if( numLen>=13){
		num = (num/1000000000000).toFixed(fixedVal)+'万亿';
	}
	return num;
}