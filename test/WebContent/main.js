const TopButton = document.querySelector("#topBtn");

window.addEventListener("scroll", scrollFunction);

function scrollFunction(){
	if(window.scrollY > 300){
		if(!TopButton.classList.contains("btnEntrance")){
			TopButton.classList.remove("btnExit");
			TopButton.classList.add("btnEntrance");
			TopButton.style.display = "block";
		}
	}else{
		if(TopButton.classList.contains("btnEntrance"))
		TopButton.classList.remove("btnEntrance");
		TopButton.classList.add("btnExit");
		setTimeout(function(){
			TopButton.style.display = "none";
		}, 250);
	}
}

TopButton.addEventListener("click", backToTop);

function backToTop(){
	window.scrollTo(0, 0);
}