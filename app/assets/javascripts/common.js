$(".menu-wrap a").on("click", function() {
	if (!$(this).hasClass("active-link")) {
		$(".active-link").removeClass("active-link");
		$(this).addClass("active-link");
	} else {
		$(".active-link").removeClass("active-link");
	}
})
