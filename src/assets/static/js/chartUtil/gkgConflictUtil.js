function pie_chart(domId,text_id, fields, data,scroll) {
    var chart = {
        "type": "pie",
        "theme": "light",
        "dataProvider": data,
        "titleField": fields.category||"key",
        "valueField": fields.value||"value",
        "labelRadius": 5,

        "radius": "32%",
        "innerRadius": "50%",
        "labelText": "[[title]]",
        "export": {
            "enabled": true
        }
    };
    
    /*
    if(scroll==0){
        var flag=0;
        $(window).scroll(function() {
            if (flag == 0) {
                if (scroll_make_chart(domId, chart)) {
                    flag = 1;
                    $('#'+text_id).addClass('show');
                }
            }
        });
    }
    else
    {
        AmCharts.makeChart(domId,chart);
        $('#'+text_id).addClass('show');
    }
    */
    AmCharts.makeChart(domId,chart);
}


function bubble_map(map_id,bubble_data){
    var bubble_map = new Datamap({
      element: document.getElementById(map_id),
      projection: 'mercator',
      geographyConfig: {
        popupOnHover: true,
        highlightOnHover: true
      },
      bubblesConfig: {
        borderWidth: 1,
        borderOpacity: 1,
        borderColor: '#FFFFFF'
      },
      fills: {
          defaultFill: '#ABDDA4',
          country:"#ff4500",
          state:"#428bca",
          city:"orange"
      }
    });
    bubble_map.bubbles(bubble_data, {
        popupTemplate: function (geo, data) {
            return '<div class="hoverinfo"><strong>发生地名:' + data.name + "<br/>" + '实体数量: ' + data.yield + "<br/>" + '信息描述: ' + data.significance+'</strong>'
        }
    });
}

function column_chart(domId,text_id,fields,data,scroll)
{
    var chart ={
          "type": "serial",
          "theme": "light",
          "dataProvider": data,
          "valueAxes": [ {
            "gridColor": "#FFFFFF",
            "gridAlpha": 0.2,
            "dashLength": 0
          } ],
          "gridAboveGraphs": true,
          "startDuration": 1,
          "graphs": [ {
            "balloonText": "[[key]]: <b>[[value]]</b>",
            "fillAlphas": 0.8,
            "lineAlpha": 0.2,
            "type": "column",
            "valueField":"number"
          } ],
          "chartCursor": {
            "categoryBalloonEnabled": false,
            "cursorAlpha": 0,
            "zoomable": false
          },
          "categoryField":"key",
          "categoryAxis": {
            "labelRotation": 45,
            "gridPosition": "start",
            "gridAlpha": 0,
            "tickPosition": "start",
            "tickLength": 20
          },
          "export": {
                "enabled": true
         }
    };
    if(scroll==0){
        var flag=0;
        $(window).scroll(function() {
            if (flag == 0) {
                if (scroll_make_chart(domId, chart)) {
                    flag = 1;
                    $('#'+text_id).addClass('show');
                }
            }
        });
    }
    else
    {
        AmCharts.makeChart(domId,chart);
        $('#'+text_id).addClass('show');
    }
}

function scroll_make_chart(id,chart) {
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