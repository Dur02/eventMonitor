function exportAllData2(JSONData, ShowLabel,DataName){
	if(JSONData===''){
		return;
	}
	var arrData = typeof JSONData !== 'object' ? JSON.parse(JSONData) : JSONData;
    var CSV = '';
    if (ShowLabel) {
        var row = "";
        for (var index in arrData[0]) {
            row += index + ',';
        }
        row = row.slice(0, -1);
        CSV += row + '\r\n';
    }
    for (var i = 0; i < arrData.length; i++) {
        var row = "";
        for (var index in arrData[i]) {
            var arrValue = arrData[i][index] == null ? "" : '' + arrData[i][index] + '';
            row += arrValue + ',';
        }
        row.slice(0, row.length - 1);
        CSV += row + '\r\n';
    }
    if (CSV == '') {
        growl.error("Invalid data");
        return;
    }
    var fileName = DataName+"数据";
    if (msieversion()) {
        var IEwindow = window.open();
        IEwindow.document.write('sep=,\r\n' + CSV);
        IEwindow.document.close();
        IEwindow.document.execCommand('SaveAs', true, fileName + ".csv");
        IEwindow.close();
    } else {
        var uri = 'data:text/json;charset=utf-8,' + escape(CSV);
        var link = document.createElement("a");
        link.href = uri;
        link.style = "visibility:hidden";
        link.download = fileName + ".json";
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
    }

}
function msieversion() {
    var ua = window.navigator.userAgent;
    var msie = ua.indexOf("MSIE ");
    if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)) // If Internet Explorer, return version number
    {
        return true;
    } else { // If another browser,
        return false;
    }
    return false;
}



///////////////////////////////////
function exportAllData(JSONData,ShowLabel,ReportTitle) {
	if(JSONData===''){
		return;
	}
    var arrData = typeof JSONData != 'object' ? JSON.parse(JSONData) : JSONData;
    var CSV = "\ufeff";
    var firfixCSV = "\ufeff";
    if (ShowLabel) {
        var row = "";
        var firfixRow = "";
        for (var index in arrData[0]) {
            row += index + ',';
            firfixCSV += index + ',';
        }
        CSV += row.slice(0, -1) + '\r\n';
        firfixCSV = (firfixCSV.slice(0, -1) + '\n');
    }
    for (var i = 0; i < arrData.length; i++) {
        var row = "";
        for (var index in arrData[i]) {
            row += '"' + arrData[i][index] + '",';
            firfixCSV += arrData[i][index] + ',';
        }
        row.slice(0, row.length - 1);
        CSV += row + '\r\n';
        firfixCSV = (firfixCSV.slice(0, -1) + '\n');
    }

    if (CSV == '') {
        alert("Invalid data");
        return;
    }
    var link = document.createElement("a");
    link.id = "lnkDwnldLnk";
    document.body.appendChild(link);
    var csv = CSV;
   /* blob = new Blob([csv], { type: 'text/csv,charset=gbk', endings: 'native' });*/
   /* if (window.webkitURL) {
        var csvUrl = window.webkitURL.createObjectURL(blob);
    } else {*/
    
        var csvUrl = 'data:text/csv;charset=utf-8,' + encodeURI(firfixCSV);
    //}
    var filename = ReportTitle+"数据" + '.csv';
    $("#lnkDwnldLnk")
    .attr({
        'download': filename,
        'href': csvUrl
    });
    $('#lnkDwnldLnk')[0].click();
    $('.bs-example-modal-lg').modal('hide');
    document.body.removeChild(link);
}




