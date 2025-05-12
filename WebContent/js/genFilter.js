/**
일반 돌봄 1차 필터 관련 스크립트 (genFilter.js)
*/

//================== 이 페이지가 불려지면 =========================

document.addEventListener('DOMContentLoaded', function()
{
	var dateStartElement = document.getElementById('date-start');
	var dateEndElement = document.getElementById('date-end');
	
	// 비활성화할 날짜 배열 → 임의의 날짜. 이후 쿼리로 얻어오기.
    var disabledDates = ["2025-05-15", "2025-05-20", "2025-05-25"];
    
    // 시작 날짜 선택기
    var startDatePicker = flatpickr("#date-start", {
        dateFormat: "Y-m-d"						// 날짜 포맷
        , disable: disabledDates				// 비활성화 날짜 배열
        , minDate: "+4d"						// 오늘로부터 4일 후
        , maxDate: "+33d"						// 오늘로부터 33일 후
        , onChange: function(selectedDates)     // 돌봄 시작일로 선택한 날짜
        {
            if (selectedDates[0])
            {
                var maxDate = new Date(selectedDates[0]);	// 돌봄 종료일의 최대 날짜 초기화(돌봄 시작일의 인스턴스)
                maxDate.setDate(maxDate.getDate() + 29);	// ...는 시작일로부터 29일 후까지만 가능
                
                endDatePicker.set('minDate', selectedDates[0]);		// 돌봄 시작일이 곧 돌봄 종료 최소일
                endDatePicker.set('maxDate', maxDate);				// 돌봄 종료일의 초대일은 시작일 + 29일 후
                
                // 만약 종료일 값 존재 && 현재 선택된 종료 날짜 < 새 시작 날짜이면
                if (dateEndElement.value && new Date(dateEndElement.value) < selectedDates[0])
                {
                    endDatePicker.setDate(selectedDates[0]);	// 종료일을 새 시작 날짜로 설정(변경)
                }
            }
        }
    });
    
    
    // 종료 날짜 선택기
    var endDatePicker = flatpickr("#date-end", {
        dateFormat: "Y-m-d"						// 날짜 포맷
        , disable: disabledDates				// 비활성화 날짜 배열
        , minDate: "+4d"						// 오늘로부터 4일 후
    	// maxDate는 시작 날짜가 선택된 후 동적으로 설정됨
    });
	
	
	/*
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
	var dateStartElement = document.getElementById('date-start');
	dateStartElement.setAttribute('min', minStartDateStr);
	dateStartElement.setAttribute('max', maxStartDateStr);
	
	
	//-------------------------------
 
	// 2. 날짜 선택 제한 - 돌봄 종료일
 
	// 시작 날짜 선택 시 종료 날짜는 최소값 표기 및 최대값 설정
	dateStartElement.addEventListener('change', function()
	{
    	var startDate = this.value;
    	var dateEndElement = document.getElementById('date-end');
     
    	// 종료일 최소값은 시작일로 설정
    	dateEndElement.setAttribute('min', startDate);
     
    	// 종료일 최대값은 시작일로부터 29일 후로 설정
    	var maxEndDate = new Date(startDate);
    	maxEndDate.setDate(maxEndDate.getDate() + 29);
    	
    	var maxEndDateStr = formatDate(maxEndDate);
    	dateEndElement.setAttribute('max', maxEndDateStr);
     
    	// 만약 종료 날짜가 새로운 시작 날짜보다 이전이면 종료 날짜를 시작 날짜와 같게 설정
    	if (dateEndElement.value < startDate)
    	{
    	    dateEndElement.value = startDate;
    	}
	});
	*/
 
	//-------------------------------
 
	// 3. 시간 선택 제한
 
	// 경고 메시지 요소 기본적으로 숨기기
	var maxTimeWarning = document.getElementById('max-time-warning');
	var minTimeWarning = document.getElementById('min-time-warning');
	maxTimeWarning.style.display = 'none';
	minTimeWarning.style.display = 'none';
 
	// 시작 시간, 종료 시간 변경 시 검사 실행
	var timeStartElement = document.getElementById('time-start');
	var timeEndElement = document.getElementById('time-end');
 
	timeStartElement.addEventListener('change', checkTimeDiff);
	timeEndElement.addEventListener('change', checkTimeDiff);
 
	// 폼 제출 시 유효성 검사
	var filterForm = document.getElementById('primary-filter-form');
	filterForm.addEventListener('submit', function(event)
	{
    
		// 시간 차이 재확인
    	if (timeStartElement.value && timeEndElement.value)
    	{
        	var startHour = parseInt(timeStartElement.value);
        	var endHour = parseInt(timeEndElement.value);
        	var hourDiff = endHour - startHour;
         
        	// 8시간 초과면 제출 막기
        	if (hourDiff > 8)
        	{
            	// 경고 팝업
            	alert('일반 돌봄 하루 최대 이용시간은 8시간입니다.');
            	event.preventDefault(); // 폼 제출 막기
        	}
         
        	// 1시간 미만이면 제출 막기
        	if (hourDiff <= 0)
        	{
            	// 경고 팝업
            	alert('일반 돌봄은 최소 1시간부터 이용 가능합니다.');
            	event.preventDefault(); // 폼 제출 막기
        	}
    	}
	});
});

//================== 위 기능을 위한 함수 =========================

/*
//함수 1.날짜 → YYYY-MM-DD 형식으로 변환
function formatDate(date)
{
	var year = date.getFullYear();
	var month = String(date.getMonth() + 1).padStart(2, '0');   //-- LPAD 와 같다.
	var day = String(date.getDate()).padStart(2, '0');
	return year + '-' + month + '-' + day;
}
*/

//함수 2.시간 차이 검사 함수 (+ 경고 메시지 출력)
function checkTimeDiff()
{
	var timeStartElement = document.getElementById('time-start');
	var timeEndElement = document.getElementById('time-end');
	var maxTimeWarning = document.getElementById('max-time-warning');
	var minTimeWarning = document.getElementById('min-time-warning');
 
	// 두 시각이 모두 선택되었다면,
	if (timeStartElement.value && timeEndElement.value)
	{
    	// 시간 계산
    	var startHour = parseInt(timeStartElement.value);
    	var endHour = parseInt(timeEndElement.value);
    	var hourDiff = endHour - startHour;
     
    	// 시간 차가 8시간 초과라면,
    	if (hourDiff > 8)
    	{
        	// 경고 표시
        	maxTimeWarning.style.display = 'block';
    	}
    	else
    	{
    		// 경고 숨기기
    		maxTimeWarning.style.display = 'none';
    	}
     
    	// 시간 차가 1시간 미만이라면,
    	if (hourDiff <= 0)
    	{
        	// 경고 표시
        	minTimeWarning.style.display = 'block';
    	}
    	else
    	{
        	// 경고 숨기기
        	minTimeWarning.style.display = 'none';
    	}
	}
}