
console.log('a');

// 左边下拉
$(".down-list").parent().on("click", function() {
	if (!$(this).parent().hasClass("active")) {
		$(".active").removeClass("active");
		$(this).parent().addClass("active");
	} else {
		$(".active").removeClass("active");
	}
})
$(".menu-wrap a").on("click", function() {
	if (!$(this).hasClass("active-link")) {
		$(".active-link").removeClass("active-link");
		$(this).addClass("active-link");
	} else {
		$(".active-link").removeClass("active-link");
	}
})

$(".test").on("click", function() {
	$(".content-container").load("test.html");
})
