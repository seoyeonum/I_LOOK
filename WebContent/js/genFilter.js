/**=================================================
   일반 돌봄 1차 필터 관련 스크립트 (genFilter.js)
==================================================*/

//================== 이 페이지가 불려지면 =========================

document.addEventListener('DOMContentLoaded', function()
{
	// 1. 날짜 선택 제한 - 돌봄 시작일
	
 	// Date() → 오늘 날짜 객체 생성
    var today = new Date();
    
    // 오늘로부터 4일 후 (최소 날짜)
    var minStartDate = new Date(today);
    minStartDate.setDate(today.getDate() + 4);
    
    // 오늘로부터 33일 후 (최대 날짜)
    var maxStartDate = new Date(today);
    maxStartDate.setDate(today.getDate() + 33);
    
    // 돌봄 시작일의 최소, 최대 날짜 설정
    var minStartDateStr = formatDate(minStartDate);
    var maxStartDateStr = formatDate(maxStartDate);
    
    // 시작 날짜와 종료 날짜 입력 → min, max 속성 설정
    $('#date-start').attr('min', minStartDateStr);
    $('#date-start').attr('max', maxStartDateStr);
    

  	//-------------------------------
    
  	// 2. 날짜 선택 제한 - 돌봄 종료일
    
	// 시작 날짜 선택 시 종료 날짜는 최소값 표기 및 최대값 설정
    $('#date-start').on('change', function()
    {
        var startDate = $(this).val();
        
        // 종료일 최소값은 시작일로 설정
        $('#date-end').attr('min', startDate);
        
        // 종료일 최대값은 시작일로부터 29일 후로 설정
        var maxEndDate = new Date(startDate);
        maxEndDate.setDate(maxEndDate.getDate() + 29);
        var maxEndDateStr = formatDate(maxEndDate);
        $('#date-end').attr('max', maxEndDateStr);
        
     	// 만약 종료 날짜가 새로운 시작 날짜보다 이전이면 종료 날짜를 시작 날짜와 같게 설정
        if ($('#date-end').val() < startDate)
        {
            $('#date-end').val(startDate);
        }
        
    });
    
    
	//-------------------------------
    
    // 3. 시간 선택 제한
    
 	// 경고 메시지 요소 기본적으로 숨기기
    $('#time-warning').hide();
    
    // 시작 시간, 종료 시간 변경 시 검사 실행
    $('#time-start').on('change', checkTimeDiff);
    $('#time-end').on('change', checkTimeDiff);
    
    // 폼 제출 시 유효성 검사
    $('#primary-filter-form').on('submit', function(event)
    {
        // 시간 차이 재확인
        if ($('#time-start').val() && $('#time-end').val())
        {
            var startHour = parseInt($('#time-start').val());
            var endHour = parseInt($('#time-end').val());
            var hourDiff = endHour - startHour;
            
            // 8시간 초과면 제출 막기
            if (hourDiff > 8)
       		{
            	// 경고 팝업
            	alert('일반 돌봄 하루 최대 이용시간은 8시간입니다.');
            	event.preventDefault(); // 폼 제출 막기
            }
        }
    });
    
});


//================== 위 기능을 위한 함수 =========================

// 함수 1.날짜 → YYYY-MM-DD 형식으로 변환
function formatDate(date)
{
    var year = date.getFullYear();
    var month = String(date.getMonth() + 1).padStart(2, '0');		//-- LPAD 와 같다.
    var day = String(date.getDate()).padStart(2, '0');
    return year + '-' + month + '-' + day;
}


// 함수 2.시간 차이 검사 함수
function checkTimeDiff()
{
    // 두 시각이 모두 선택되었다면,
    if ($('#time-start').val() && $('#time-end').val())
    {
        // 시간 계산
        var startHour = parseInt($('#time-start').val());
        var endHour = parseInt($('#time-end').val());
        var hourDiff = endHour - startHour;
        
        // 시간 차가 8시간 초과라면,
        if (hourDiff > 8)
        {
            // 경고 표시
            $('#time-warning').show();
        }
        else
        {
            // 경고 숨기기
            $('#time-warning').hide();
        }
    }
}