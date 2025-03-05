function btn_click(){
    let btns = $(".menu_btn")
    let btns_text = $(".menu_btn span")
    console.log(btns)
    btns.on("click", function(e){
        e.preventDefault();
        btns_text.removeClass("menu_btn_active")
        let index = btns.index(this); 
        btns_text.eq(index).addClass("menu_btn_active")
        alert(index)
    });
}
function scrollTopNav(){
    let win = $(window)
    if (win.scrollTop() == 0){
        $("nav").removeClass("css_nav_color")
        $("nav").addClass("css_nav_color_t")
    }else{
        $("nav").removeClass("css_nav_color_t")
        $("nav").addClass("css_nav_color")
    }
}

let deletedItems = []; 
let num = 0;
let menu_copy = $(".nav-item").clone(true);
function get_nav(){
	const nav = $(".navbar-nav.justify-content-start.flex-grow-1.pe-3.flex-nowrap")
	const logo = $(".navbar-brand")
	let menu = $(".nav-item")
	const sadasd = $(".offcanvas-body")
	let total = 0;
	const win = $(window).outerWidth();
	let currentWidth = win - logo.outerWidth(true)
	console.log(menu_copy.outerWidth())
	if (win < 768){
		if (menu.length < 8){
			menu.remove()
			$(".navbar-nav").append(menu_copy); 
			deletedItems = []
		}
	}else{
		menu.each(function(index, item){
			const i = $(this).index()
			total += $(item).outerWidth()
			console.log(i + " : " + $(item).outerWidth(true))
			
		})
		console.log(nav.outerWidth(true) - total)
		if((nav.outerWidth(true) - total) < 80){
		 	const lastItem = menu.eq(menu.length - 4)
			deletedItems.push({ item: lastItem, width: lastItem.outerWidth(true) });
			total -= lastItem.outerWidth(true)
		  	lastItem.remove()
		}else {
			if (deletedItems.length > 0 ) {
				const lastItem = deletedItems[deletedItems.length - 1];
				const { item, width } = lastItem;
				if(nav.outerWidth(true) - (total + width) > 80 ){
				   	const { item, width } = deletedItems.pop();
					total += width
					const lastogmenu = menu.eq(menu.length - 3)
			       	lastogmenu.before(item); 
				}
			}
		}
		const dropdown = (menu.eq(menu.length - 3).outerWidth(true) +  menu.eq(menu.length - 2).outerWidth(true) +  menu.eq(menu.length - 1).outerWidth(true))
		const nav_size = nav.outerWidth(true)
		console.log(dropdown)
		console.log(Math.floor(nav_size - dropdown) - total)
		if (Math.floor(nav_size - dropdown) - total > -180) {
			get_nav()
		}
	}
}