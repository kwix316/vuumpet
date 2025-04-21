function btn_click() {
    let btns = $(".menu_btn");
    let btns_text = $(".menu_btn span");
    btns.on("click", function(e) {
        e.preventDefault();
        btns_text.removeClass("menu_btn_active");
        let index = btns.index(this);
        btns_text.eq(index).addClass("menu_btn_active");
        alert(index);
    });
}

let deletedItems = [];
let menu_copy;
let isInitialized = false;
let lastWinWidth = 0;

// 설정값
const MAIN_NAV_SELECTOR = '#main-nav-items';
const LOGO_SELECTOR = '.navbar-brand img';
const RIGHT_MENU_SELECTOR = '#right-menu';
const DROPDOWN_TOGGLE_HTML = `
    <li class="nav-item dropdown nav-item-more">
        <a class="nav-link" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="fa-solid fa-ellipsis"></i>
        </a>
        <ul class="dropdown-menu dropdown-menu-end"></ul>
    </li>`;
const DROPDOWN_SELECTOR = '.nav-item-more';
const DROPDOWN_MENU_SELECTOR = '.nav-item-more .dropdown-menu';
const lgBreakpoint = 767;
const MIN_DESKTOP_ITEMS = 3;
const MAX_DESKTOP_ITEMS = 7;

$(document).ready(function() {
    function initializeNav() {
        if (isInitialized) return;
        const mainNav = $(MAIN_NAV_SELECTOR);
        if (mainNav.length && mainNav.children('.nav-item').length) {
            menu_copy = mainNav.children('.nav-item:not(' + DROPDOWN_SELECTOR + ')').clone(true);
            isInitialized = true;
            requestAnimationFrame(get_nav);
            $(window).on('resize', function() {
                const currentWinWidth = $(window).outerWidth();
                if (Math.abs(currentWinWidth - lastWinWidth) > 3) {
                    lastWinWidth = currentWinWidth;
                    requestAnimationFrame(get_nav);
                }
            });
            $(window).on('scroll', scrollTopNav);
            scrollTopNav();
        } else {
            setTimeout(initializeNav, 100);
        }
    }
    initializeNav();
});

function get_nav() {
    const nav = $(MAIN_NAV_SELECTOR);
    if (!nav.length) return;

    const winWidth = $(window).outerWidth();
    const parentContainer = nav.closest('.container-fluid');
    const logoWidth = $(LOGO_SELECTOR).outerWidth(true) || 0;
    const rightMenuWidth = $(RIGHT_MENU_SELECTOR).outerWidth(true) || 0;
    const availableSpace = parentContainer.width() - logoWidth - rightMenuWidth;
    const floorNavWidth = Math.floor(availableSpace);

    // 모바일 뷰
    if (winWidth < lgBreakpoint) {
        nav.empty().append(menu_copy.clone(true));
        deletedItems = [];
        return;
    }

    // 데스크톱 뷰
    let totalItemsWidth = 0;
    let collapsibleItems = [];
    let displayedItemsCount = 0;

    nav.children('.nav-item:not(' + DROPDOWN_SELECTOR + ')').each(function() {
        const item = $(this);
        totalItemsWidth += Math.ceil(item.outerWidth(true));
        collapsibleItems.push(item);
        displayedItemsCount++;
    });

    const dropdownButton = nav.find(DROPDOWN_SELECTOR);
    if (dropdownButton.length) {
        totalItemsWidth += Math.ceil(dropdownButton.outerWidth(true));
    }

    // 항목 제거
    while (totalItemsWidth > floorNavWidth && displayedItemsCount > MIN_DESKTOP_ITEMS) {
        const itemToHide = collapsibleItems.pop();
        const itemWidth = Math.ceil(itemToHide.outerWidth(true));
        deletedItems.push({
            item: itemToHide.clone(true),
            width: itemWidth,
            text: itemToHide.find('.nav-link').text().trim(),
            href: itemToHide.find('.nav-link').attr('href')
        });
        itemToHide.remove();
        totalItemsWidth -= itemWidth;
        displayedItemsCount--;
        if (!nav.find(DROPDOWN_SELECTOR).length) nav.append(DROPDOWN_TOGGLE_HTML);
    }

    // 드롭다운 업데이트
    const dropdownMenu = nav.find(DROPDOWN_MENU_SELECTOR);
    if (deletedItems.length) {
        if (!nav.find(DROPDOWN_SELECTOR).length) nav.append(DROPDOWN_TOGGLE_HTML);
        dropdownMenu.empty();
        $(deletedItems).get().reverse().forEach(deleted => {
            dropdownMenu.append(`<li><a class="dropdown-item" href="${deleted.href}">${deleted.text}</a></li>`);
        });
    } else {
        nav.find(DROPDOWN_SELECTOR).remove();
    }

    // 항목 복원
    while (deletedItems.length && displayedItemsCount < MAX_DESKTOP_ITEMS) {
        const lastDeleted = deletedItems[deletedItems.length - 1];
        if (totalItemsWidth + lastDeleted.width <= floorNavWidth) {
            const itemToRestore = deletedItems.pop();
            totalItemsWidth += itemToRestore.width;
            displayedItemsCount++;
            nav.find(DROPDOWN_SELECTOR).before(itemToRestore.item);
            nav.find(DROPDOWN_MENU_SELECTOR + ` a[href="${itemToRestore.href}"]`).closest('li').remove();
        } else {
            break;
        }
    }
}

function scrollTopNav() {
    if ($(window).scrollTop() === 0) {
        $("nav").removeClass("css_nav_color").addClass("css_nav_color_t");
    } else {
        $("nav").removeClass("css_nav_color_t").addClass("css_nav_color");
    }
}