$(function() {
	const menuItems = $(".menu-item")
	const nav = $("nav")
	menuItems.each(function(index){
	  	$(this).on("click", function(e) {
			e.preventDefault()
			let sectionPosY = 0;
			let currentSection = null;
	        if(index == 0 ||  index == 3 ||  index == 6){
	        	currentSection = $("#7th")
	        	sectionPosY = currentSection.offset().top; 
			}else if(index == 1 ||  index == 4 ||  index == 7){
				currentSection = $("#carrier")
        		sectionPosY = currentSection.offset().top; 
			}else if(index == 2 ||  index == 5 ||  index == 8){
				currentSection = $("#accessary")
        		sectionPosY = currentSection.offset().top; 
			}
			const topVal = (sectionPosY - nav.outerHeight()) + 2
	       	$('html, body').stop().animate({
	           	scrollTop: topVal
	       	}, 400)
	     })
	})
})