// 전역 변수 및 설정값 (기존과 동일)
let deletedItems = [];
let menu_copy;
let isInitialized = false;
let lastWinWidth = 0;

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
const lgBreakpoint = 767; // 예시 값, 실제 프로젝트의 breakpoint 값 사용

// btn_click 함수 (기존과 동일)
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

$(window).on('load', function() {
    function initializeNav() {
        if (isInitialized) return;
        const mainNav = $(MAIN_NAV_SELECTOR);
        if (mainNav.length && mainNav.children('.nav-item').length) {
            // 초기 메뉴 복사 (드롭다운 제외)
            menu_copy = mainNav.children('.nav-item:not(' + DROPDOWN_SELECTOR + ')').clone(true);
            isInitialized = true; // 초기화 완료 플래그 설정

            // *** 수정된 부분 ***
            // 지연 실행 제거: requestAnimationFrame을 직접 사용하여 다음 프레임에 get_nav 호출
            // 기존: setTimeout(() => { requestAnimationFrame(get_nav); }, 200);
            requestAnimationFrame(get_nav);
            // *** 수정 완료 ***

            // 리사이즈 이벤트 핸들러 (너비 변화 감지 로직 추가됨)
            $(window).on('resize', function() {
                const currentWinWidth = $(window).outerWidth();
                // 성능을 위해 너비가 실제로 일정량 이상 변경되었을 때만 실행
                if (Math.abs(currentWinWidth - lastWinWidth) > 3) {
                    lastWinWidth = currentWinWidth;
                    requestAnimationFrame(get_nav); // 리사이즈 시에도 requestAnimationFrame 사용
                }
            });

            // 스크롤 이벤트 핸들러
            $(window).on('scroll', scrollTopNav);
            scrollTopNav(); // 초기 로드 시 스크롤 상태 체크

        } else {
            // 네비게이션 요소가 아직 로드되지 않았으면 잠시 후 다시 시도
            // 이 부분은 비동기 로딩 상황을 고려하여 유지할 수 있습니다.
            console.log('Main navigation not ready, retrying initialization...');
            setTimeout(initializeNav, 100);
        }
    }
    initializeNav(); // 초기화 함수 호출
});

// 레이아웃 안정화 확인 함수 (기존과 동일, 필요시 initializeNav에서 사용 가능)
function waitForLayoutStabilization(element, callback) {
    let previousWidth = element.outerWidth(true);
    function checkStabilization() {
        requestAnimationFrame(() => { // requestAnimationFrame 내부에서 너비 체크
            const currentWidth = element.outerWidth(true);
            if (currentWidth === previousWidth && currentWidth > 0) { // 너비가 0 이상이고 안정화되었는지 확인
                callback(); // 너비가 변하지 않으면 레이아웃이 안정화된 것으로 간주
            } else {
                previousWidth = currentWidth;
                checkStabilization(); // 변하면 다음 프레임에서 다시 확인
            }
        });
    }
    checkStabilization();
}


function get_nav() {
    // 초기화 및 요소 존재 여부 확인
    if (!isInitialized || !menu_copy) return;
    const nav = $(MAIN_NAV_SELECTOR);
    const rightMenu = $(RIGHT_MENU_SELECTOR);
    if (!nav.length || !rightMenu.length) return;

    const winWidth = $(window).outerWidth();
    const lgBreakpoint = 767;

    // --- 모바일 뷰 로직 (이전과 동일) ---
    if (winWidth < lgBreakpoint) {
        // console.log('Mobile view (< ' + lgBreakpoint + 'px). Relying on Bootstrap Offcanvas.');
        if (deletedItems.length > 0) {
            // console.log('Transitioning Desktop -> Mobile: Clearing deletedItems state.');
            nav.empty().append(menu_copy.clone(true));
            deletedItems = [];
        }
        nav.find(DROPDOWN_SELECTOR).remove();
        rightMenu.show();
        return;
    }

    // --- 데스크탑 뷰 로직 ---
    console.log('Desktop view (>= ' + lgBreakpoint + 'px)');
    rightMenu.show();

    // 현재 상태 계산
    const navOffsetLeft = nav.offset()?.left ?? 0;
    const rightMenuOffsetLeft = rightMenu.offset()?.left ?? (navOffsetLeft + 800);
    const availableSpace = rightMenuOffsetLeft - navOffsetLeft;
    const currentNavWidth = nav.outerWidth(true);
    const currentGap = availableSpace - currentNavWidth;
    const threshold = winWidth > 1400 ? 70 : 45; // 증가된 임계값

    let stateChanged = false; // 상태 변경 여부 플래그

    console.log('--- Current State ---');
    console.log('Available Space:', Math.round(availableSpace));
    console.log('Threshold:', threshold);
    console.log('Current Nav Width:', Math.round(currentNavWidth));
    console.log('Current Gap:', Math.round(currentGap));
    console.log('Items currently in dropdown:', deletedItems.length);
    console.log('---------------------');

    // 1. 제거 로직: 현재 간격이 임계값보다 작고, 화면에 제거할 항목이 남아 있을 때
    if (currentGap < threshold) {
        const itemsOnScreen = nav.children('.nav-item:not(' + DROPDOWN_SELECTOR + ')');
        if (itemsOnScreen.length > 0) {
            console.log("Gap too small, removing one item...");
            const itemToHide = itemsOnScreen.last();
            const itemWidth = Math.ceil(itemToHide.outerWidth(true));

            if (!nav.find(DROPDOWN_SELECTOR).length) {
                nav.append(DROPDOWN_TOGGLE_HTML);
                console.log("Dropdown added.");
            }

            deletedItems.push({
                item: itemToHide.clone(true),
                width: itemWidth,
                text: itemToHide.find('.nav-link').text().trim() || 'N/A',
                href: itemToHide.find('.nav-link').attr('href') || '#'
            });

            console.log(`Item removed: ${deletedItems[deletedItems.length-1].text}`);
            itemToHide.remove();
            stateChanged = true; // 상태 변경됨

            // 드롭다운 메뉴 업데이트
            const dropdownMenu = nav.find(DROPDOWN_MENU_SELECTOR);
            if (dropdownMenu.length) {
                dropdownMenu.empty();
                $(deletedItems).get().reverse().forEach(deleted => {
                    if(deleted.href && deleted.text) {
                       dropdownMenu.append(`<li><a class="dropdown-item" href="${deleted.href}">${deleted.text}</a></li>`);
                    }
                });
                console.log('Dropdown items updated:', deletedItems.length);
            }

            console.log('get_nav finished after removing one item.');
            // ★★★ 상태가 변경되었으므로 다음 프레임에 다시 체크 예약 ★★★
            requestAnimationFrame(get_nav);
            return; // 이번 호출 종료
        } else {
            console.log("Gap too small, but no more items to remove from screen.");
        }
    }

    // 2. 복원 로직: (제거 작업이 없었을 경우에만 실행)
    //    현재 간격이 (임계값 + 여유)보다 크고, 숨겨진 항목이 있을 때
    if (!stateChanged && currentGap >= threshold + 20 && deletedItems.length > 0) {
        console.log("Gap is large enough, attempting to restore one item...");
        const lastDeleted = deletedItems[deletedItems.length - 1];
        const itemToRestore = lastDeleted.item.clone(true);

        // 임시 추가하여 실제 간격 확인
        const dropdownBtn = nav.find(DROPDOWN_SELECTOR);
        if (dropdownBtn.length) {
            dropdownBtn.before(itemToRestore);
        } else {
            nav.append(itemToRestore);
        }
        const tempNavWidth = nav.outerWidth(true);
        const tempGap = availableSpace - tempNavWidth;

        console.log(`Attempting restore: ${lastDeleted.text}. Measured gap if restored: ${Math.round(tempGap)}`);

        // 실제 측정 간격이 복원 조건 만족하는지 확인
        if (tempGap >= threshold + 20) {
            console.log(`Restoring item: ${lastDeleted.text}`);
            const restoredItemInfo = deletedItems.pop();
            stateChanged = true; // 상태 변경됨

            const dropdownMenu = nav.find(DROPDOWN_MENU_SELECTOR);
             if (dropdownMenu.length) {
                dropdownMenu.find(`li a[href="${restoredItemInfo.href}"]`).closest('li').remove();
             }

            if (deletedItems.length === 0) {
                nav.find(DROPDOWN_SELECTOR).remove();
                console.log("All items restored, dropdown removed.");
            }

            console.log('get_nav finished after restoring one item.');
            // ★★★ 상태가 변경되었으므로 다음 프레임에 다시 체크 예약 ★★★
            requestAnimationFrame(get_nav);
            return; // 이번 호출 종료

        } else {
            console.log(`Restore aborted (measurement): ${lastDeleted.text} doesn't fit.`);
            itemToRestore.remove(); // 임시 추가했던 항목 제거
        }
    }

    // 제거 또는 복원 작업이 없었던 경우
    if (!stateChanged) {
        console.log('get_nav finished. No state change needed this time.');
    }
} // get_nav 함수 끝


// scrollTopNav 함수 (기존 코드 유지)
function scrollTopNav() {
    // window.scrollY 대신 $(window).scrollTop() 사용 (jQuery 일관성)
    if ($(window).scrollTop() === 0) {
        // 클래스 이름 확인 필요 (css_nav_color_t, css_nav_color)
        $("nav.navbar").removeClass("css_nav_color").addClass("css_nav_color_t"); // 'nav' 보다는 실제 네비게이션 바 요소 선택자 사용 권장 (예: '.navbar')
    } else {
        $("nav.navbar").removeClass("css_nav_color_t").addClass("css_nav_color");
    }
}