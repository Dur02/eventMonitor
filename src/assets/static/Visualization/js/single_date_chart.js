function process_dic_to_single_datechart(data,chartid,text_id) {
        var valuelist=[];
        dtlen=data.length;
//        alert(dtlen);
//        alert(data[0].key);
//        alert(data[0].key.slice(4,6));
        alert(dtlen);
        for (var i = 0; i < dtlen; i++) {
            var dataItem = data[i];
            valuelist.push({
                'x': dataItem.key,
                'y': dataItem.date,
                'value': dataItem.value
            });
        }
        var chart;
        chart=init_single_date_chart(valuelist);
        var flag=0;
        $(window).scroll(function() {
            if (flag == 0) {

                if (scroll_make_chart(chartid, chart)) {
                    flag = 1;
                    $('#'+text_id).addClass('show');
                }
            }
        });
}
function scroll_make_chart(id,chart)
{
        var hT = $('#'+id).offset().top,
            hH = $('#'+id).outerHeight(),
            wH = $(window).height(),
            wS = $(this).scrollTop();
        if (wS > (hT+hH/3-wH)){
            AmCharts.makeChart(id, chart);
            return true;
        }
    return false;
}
function init_single_date_chart(data_dic){
           var date_chart =  {
    "type": "xy",
    "theme": "light",
    "marginRight": 80,
    "path": "/static/Visualization/js/amcharts/",
    "startDuration": 1.5,
    "trendLines": [],
    "balloon": {
        "adjustBorderColor": false,
        "shadowAlpha": 0
    },
    "graphs": [{
        "balloonText": "<div style='margin:5px;'><b>[[y]]年[[x]]日</b><br>value:<b>[[value]]</b></div>",
        "bullet": "round",
        "id": "AmGraph-1",
        "bulletBorderAlpha": 0.2,
        "bulletAlpha": 0.8,
        "lineAlpha": 0,
        "fillAlphas": 0,
        "valueField": "value",

        "yField": "y"
    },{}],
    "valueAxes": [ {
        "id": "ValueAxis-2",
        "axisAlpha": 0.2,
        "position": "bottom",
        "type": "date",
        "dataDateFormat": "YYYYMMDD",
       	"minPeriod": "YYYYMMDD",
        "minHorizontalGap":50
    }],
    "categoryField": "x",
    "categoryAxis": {
        "gridPosition": "start",
        "axisAlpha":0,
        "gridAlpha":0

    },
    "allLabels": [],
    "titles": [],
    "dataProvider": data_dic,

    "export": {
        "enabled": true,
        "libs": {
      "path": "/static/Visualization/js/amcharts/export/libs/"
    }
    },

    "chartScrollbar": {
        "offset": 15,
        "scrollbarHeight": 5
    }
};
    return date_chart;

}