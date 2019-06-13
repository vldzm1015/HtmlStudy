

$(function(){
	
	var anchors = $('.tabSet').find('a');
	var panelDiv = $('.tabSet').find('div .panel');
		
	anchors.show();
	panelDiv.hide();
	
	var onAnchor = anchors.filter('.on');
	var onPanel = $(onAnchor.attr('href'));
	
	onPanel.show();
	
	//anchors
	anchors.mouseenter(function(){
		var now_onAnchor = anchors.filter('.on');
		now_onAnchor.removeClass('on');
		$(this).addClass('on');
		
		/*now_onAnchor.removeAttr('class');
		$(this).attr('class', 'on');*/
		
		panelDiv.hide();
		var selectedPanel = $($(this).attr('href'));
		selectedPanel.show();
	});
	
});