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
	if (win <= 991){
		if (deletedItems.length > 0){
			menu.remove( )
			$(".navbar-nav").append(menu_copy); 
			deletedItems = []
		}
		else{
			console.log(menu.length)
		}
	}else{
		menu.each(function(index, item){
			const i = $(this).index()
			total += $(item).outerWidth()
		/*	console.log(i + " : " + $(item).outerWidth(true))*/
			
		})
		if((nav.outerWidth(true) - total) < 80 &&  (menu.length - 3) > 2){
		 	let lastItem = menu.eq(menu.length - 4)
			if (lastItem.hasClass('dropdown')) {
			 	lastItem = menu.eq(menu.length - 5)
				deletedItems.push({ item: lastItem, width: lastItem.outerWidth(true) });
				total -= lastItem.outerWidth(true)
			  	lastItem.remove()
			} else {
				deletedItems.push({ item: lastItem, width: lastItem.outerWidth(true) });
				total -= lastItem.outerWidth(true)
			  	lastItem.remove()
			}
			if ($(".dropdown").length === 0) {
				$(".navbar-nav .nav-item:contains('회원가입')").before('<li class="nav-item dropdown"><a class="nav-link" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa-solid fa-ellipsis"></i></a> <ul class="dropdown-menu"></ul></li>')
				deletedItems.forEach(function(deletedItem){
					let item = deletedItem.item
			  	 	let itemText = item.text().trim()
					let link = item.find('a');
			  	 	let itemHref = link.attr('href')
				   	if($(".dropdown-item:contains('" + itemText + "')").length == 0){
						$(".dropdown-menu").prepend('<li><a class="dropdown-item" href="' + itemHref + '">' + itemText + '</a></li>');
				   	}
				})
			}else{
				deletedItems.forEach(function(deletedItem){
					let item = deletedItem.item
				 	let itemText = item.text().trim()
					let link = item.find('a')
			  	 	let itemHref = link.attr('href');
				   	if($(".dropdown-item:contains('" + itemText + "')").length == 0){
						$(".dropdown-menu").prepend('<li><a class="dropdown-item" href="' + itemHref + '">' + itemText + '</a></li>');
				   	}
				})
			}
		}else {
			if (deletedItems.length > 0 ) {
				const lastItem = deletedItems[deletedItems.length - 1];
				const { item, width } = lastItem;
				if(nav.outerWidth(true) - (total + width) > 80 ){
				   	const { item, width } = deletedItems.pop();
					total += width
					let itemText = item.text().trim();
					if($(".dropdown-item:contains('" + itemText + "')").length == 1){
						$(".dropdown-item:contains('" + itemText + "')").remove()
				   	}
					let lastItem = menu.eq(menu.length - 4)
					if (lastItem.hasClass('dropdown')) {
						if($(".dropdown-item").length == 0){
							lastItem.before(item); 
						}
						else{
							lastItem = menu.eq(menu.length - 4)
							lastItem.before(item); 
						}
					}/*else{
						lastItem.before(item); 
						console.log("dorpdown undetect2")
					}*/
					
			      
					if(deletedItems.length  == 0 ){
						$(".dropdown").remove()
					}
				}
			}
		}
		const dropdown = (menu.eq(menu.length - 3).outerWidth(true) +  menu.eq(menu.length - 2).outerWidth(true) +  menu.eq(menu.length - 1).outerWidth(true))
		const nav_size = nav.outerWidth(true)
		if (Math.floor(nav_size - dropdown) - total > -180) {
			get_nav()
		}
	}
}