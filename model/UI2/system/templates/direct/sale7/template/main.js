define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.backBtnClick = function() {
		justep.Portal.closeWindow();
	};

	Model.prototype.toUrl = function(url) {
		return require.toUrl(url);
	};

	Model.prototype.open = function(url) {
		if (this.getStatus() === 5) {
			justep.Portal.openWindow(require.toUrl(url));
		}
	};

	Model.prototype.modelLoad = function(event) {

		var scrollAnimate = $('.x-grid-menu7-4');
		var horn = scrollAnimate.find('.cell');
		var speed = 300;
		var timer = 2000;
		scrollUp = function() {
			horn.animate({
				marginTop : -scrollAnimate.height()
			}, speed, function() {
				horn.find('.card:first').remove().appendTo(horn);
				horn.css({
					marginTop : 0
				});
			});
		};
		!scrollAnimate.length > 0 || setInterval(scrollUp, timer);

	};

	return Model;
});