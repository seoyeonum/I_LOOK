
/**=====================================
   알림함 관련 스크립트 (notify.js)
======================================*/

//================== 이 페이지가 불려지면 =========================

document.addEventListener('DOMContentLoaded', function()
{
	// 0.알림함 버튼 요소 가져오기
    var notifyBtn = document.getElementById('notify-btn');
	var notifyPanel = document.getElementById('notify-panel');
	
    var closenotifyBtn = document.getElementById('close-notify');
    var readAllBtn = document.getElementById('read-all-btn');

    // 1.알림함 버튼 클릭 이벤트 처리
    notifyBtn.addEventListener('click', function(e)
    {
        //e.stopPropagation(); // 이벤트 버블링 방지
        
        // 패널 위치 업데이트
        updatePanelPosition();
        
        // 알림창 토글 (표시/숨김)
        var isVisible = notifyPanel.classList.contains('visible');
        
        // 만약, visible 클래스 갖고 있는 게 있다면
        if (isVisible)
        {
            notifyPanel.classList.remove('visible');			// visible 지워주기
            notifyBtn.setAttribute('aria-expanded', 'false');	// notify-btn 요소 축소하기
            // aria-expanded="true": 요소가 확장됨 (열림 상태)
            // aria-expanded="false": 요소가 축소됨 (닫힘 상태)
            
        }
        else
        {
            notifyPanel.classList.add('visible');				// notifyPanel에 visible 속성 추가하기
            notifyBtn.setAttribute('aria-expanded', 'true');	// notify-btn 요소 확장하기
            
        }
    });
 	
 	// 2.닫기 버튼 클릭 이벤트 처리
    closenotifyBtn.addEventListener('click', function(e)
    {
        //e.stopPropagation(); // 이벤트 버블링 방지
        
        notifyPanel.classList.remove('visible');			// visible 지워주기
        notifyBtn.setAttribute('aria-expanded', 'false');	// notify-btn 요소 축소하기
        
    });
 	
 	// 3.창 크기 변경 시 알림창 위치 조정(→ 알림함 버튼 아래 위치 고정)
    window.addEventListener('resize', function()
    {
        if (notifyPanel.classList.contains('visible'))
        {
            updatePanelPosition();
        }
    });
 	
 	
	// 4.모두 읽음 표시 버튼 클릭 이벤트 처리
    readAllBtn.addEventListener('click', function(e)
    {
        //e.stopPropagation(); // 이벤트 버블링 방지
        
        // 모든 알림을 읽음 상태로 변경
        document.querySelectorAll('.notify-item.unread').forEach(function(item)
        {
		    item.classList.remove('unread');
		});
        
        // 알림 뱃지 숨기기
        var badge = document.getElementById('notify-badge');
        if (badge)
        {
            badge.style.display = 'none';
        }
        
        /* 읽었다는 사실을 수행할 수 있는 쿼리 작성? */
        
    });
	
 	// 5.알림 항목 클릭 이벤트 처리
    document.querySelectorAll('.notify-item').forEach(function(item)
   	{
        item.addEventListener('click', function(e)
        {
            //e.stopPropagation(); // 이벤트 버블링 방지
            
            // 알림 클릭 시 해당 알림과 관련된 페이지로 이동
            window.location.href = './ChildUsed.jsp';
            
            /* 읽었다는 사실을 수행할 수 있는 쿼리 작성? */
            
            // 읽지 않은 알림이면 읽음 상태로 변경
            // 여기서 this는 클릭한 알림 항목!
            if (this.classList.contains('unread'))
            {
                this.classList.remove('unread');
                
                // 읽지 않은 알림 개수 업데이트
                updatenotifyBadge();
            }
            
        });
    });
 	
 	// 6.초기 알림 뱃지 설정
    updatenotifyBadge();

});

//================== 위 기능을 위한 함수 =========================

// 함수 1.알림함 버튼 위치 계산하여 패널 위치 조정하는 함수
function updatePanelPosition()
{
	// 알림함 버튼 요소 가져오기
    var notifyBtn = document.getElementById('notify-btn');
	var notifyPanel = document.getElementById('notify-panel');
	
	// getBoundingClientRect()
	// : 뷰포트(viewport) 기준 위치와 크기를 나타내는 DOMRect 객체를 반환
	
    var btnRect = notifyBtn.getBoundingClientRect();
    notifyPanel.style.top = (btnRect.bottom + 10) + 'px';
    notifyPanel.style.right = (window.innerWidth - btnRect.right) + 'px';
}



// 함수 2.알림 뱃지 업데이트 함수
function updatenotifyBadge()
{
	// 읽지 않은(unread) 값을 클래스로 가진 엘리먼트들의 개수
    var unreadCount = document.querySelectorAll('.notify-item.unread').length;
	
	// 알림 숫자 뱃지
    var badge = document.getElementById('notify-badge');
    
    if (unreadCount > 0)
    {
    	// 뱃지 PC데이터(숫자) 바꾸기
        badge.textContent = unreadCount;
        badge.style.display = 'flex';
    }
    else
    {
        badge.style.display = 'none';
    }
}