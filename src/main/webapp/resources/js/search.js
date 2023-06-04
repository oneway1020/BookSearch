// 카테고리 설정 시 발생하는 함수
function callSearch() {
  $(".hiddenSearch").removeAttr("hidden");
  $("select option[value*='none']").prop("disabled", true);
  $("#searchInput").val("");
}

// 검색버튼을 눌렀을 시 발생하는 함수
function searchWeb() {
  let searchForm = document.getElementById("searchForm");
  searchForm.action = "/search/" + $("#categorySearch").val();
  searchForm.method = "GET";
  searchForm.submit();
}

// 엔터키를 눌렀을 시 발생하는 함수
function fnEnterkey() {
  if (event.keyCode == 13) {
    searchWeb();
  }
}

// 저자 클릭 시 자동으로 해당 저자의 정보로 검색해주는 함수
function searchAuthor(e) {
	let searchForm = document.getElementById("searchForm");
	
	$("#searchInput").val($(e).find('span').data('value'));
	// let test = $(e).find('span').data('value');
	// alert(test);
	
	searchForm.action = "/search/" + $("#categorySearch").val();
	searchForm.method = "GET";
	searchForm.submit();
}
