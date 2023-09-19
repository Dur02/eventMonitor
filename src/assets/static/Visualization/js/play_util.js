var PlayController = {
    create: function(code, interval, posCount, playDom) {
        var ctrl = {};
        ctrl.code = function(reflect) {
            code(ctrl.pos);
            if (playDom && reflect) {
                ctrl.ui.setPos();
            }
        };
        ctrl.interval = interval;
        ctrl.pos = 0;
        ctrl.posCount = posCount;
        ctrl.intervalId = -1;
        ctrl.playDom = playDom;
        ctrl.start = function() {
            if (ctrl.intervalId === -1) {
                ctrl.intervalId = setInterval(function () {
                    ctrl.code(true);
                    ctrl.pos += 1;
                    if (ctrl.pos >= ctrl.posCount) {
                        ctrl.pos = 0;
                    }
                }, ctrl.interval);
            }
        };
        ctrl.stop = function() {
            if (ctrl.intervalId !== -1) {
                clearInterval(ctrl.intervalId);
                ctrl.intervalId = -1;
            }
        };
        ctrl.setPos = function(pos, reflect) {
            ctrl.pos = pos >= posCount ? 0 : pos;
            ctrl.stop();
            ctrl.code(reflect);
        };
        if (playDom) {
            ctrl.ui = PlaySlider.create(ctrl);
        }
        return ctrl;
    }
};

function getCssIntValue(dom, attr) {
    return parseFloat(dom.css(attr));
}

var PlaySlider = {
    create: function(ctrl) {
        var ui = {};
        ui.playDom = '#' + ctrl.playDom;
        ui.play = $(ui.playDom);
        ui.play.addClass('play-container');
        ui.play.html('<span class="play-start play-btn"></span><span class="play-passed"></span><span class="play-slider"></span><span class="play-future"></span>');
        ui.playWidth = getCssIntValue(ui.play, 'width');
        ui.playBtn = $(ui.playDom + ' > .play-btn');
        ui.playPassed = $(ui.playDom + ' > .play-passed');
        ui.playFuture = $(ui.playDom + ' > .play-future');
        ui.playSlider = $(ui.playDom + ' > .play-slider');
        ui.actualLength = ui.playWidth - getCssIntValue(ui.playSlider, 'width') -
                            getCssIntValue(ui.playBtn, 'width') -
                            getCssIntValue(ui.playBtn, 'margin-right') -
                            getCssIntValue(ui.playPassed, 'border-left') -
                            getCssIntValue(ui.playFuture, 'border-right');

        function positionChange(p) {
            var passed = p || (ui.actualLength * (ctrl.pos / (ctrl.posCount - 1)));
            var future = ui.actualLength - passed;
            ui.playPassed.css('width', passed + 'px');
            ui.playFuture.css('width', future + 'px');
        }
        positionChange();
        ui.offsetLeft = $(ui.playDom + ' > .play-passed').offset().left;

        ui.playBtn.click(function() {
            var $t = $(this);
            if ($t.hasClass('play-stop')) {
                ctrl.stop();
                $t.removeClass('play-stop');
                $t.addClass('play-start');
            }
            else if ($t.hasClass('play-start')) {
                ctrl.start();
                $t.removeClass('play-start');
                $t.addClass('play-stop');
            }
        });

        function getRealPos(pageX) {
            var x = pageX - ui.offsetLeft - 0.5 * getCssIntValue(ui.playSlider, 'width');
            x = x < 0 ? 0 : (x > ui.actualLength ? ui.actualLength : x);
            return x;
        }

        ui.dragging = null;
        $(document.body).on('mousedown', 'span.play-slider', function(e) {
            ui.dragging = $(e.target);
        });

        $(document.body).on('mouseup', function(e) {
            if (ui.dragging) {
                ui.dragging = null;
                var x = getRealPos(e.pageX);
                ui.setPos(x);
            }
        });

        $(document.body).on('mousemove', function(e) {
            if (ui.dragging) {
                var x = getRealPos(e.pageX);
                positionChange(x);
            }
        });

        ui.play.on('click', function(e) {
            var t = $(e.target);
            if (t.hasClass('play-passed') || t.hasClass('play-future') || t.hasClass('play-slider')) {
                if (ui.playBtn.hasClass('play-stop')) {
                    ui.playBtn.removeClass('play-stop');
                    ui.playBtn.addClass('play-start');
                }
                var x = getRealPos(e.pageX);
                ui.setPos(x, true);
            }
        });

        ui.setPos = function(pos) {
            if (pos) {
                var p = parseInt(pos / ui.actualLength * ctrl.posCount);
                if (p !== ctrl.pos) {
                    ctrl.setPos(p, true);
                }
            }
            else {
                positionChange();
            }
        };

        return ui;
    }
};
