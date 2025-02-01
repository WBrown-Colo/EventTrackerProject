console.log('script.js loaded');
window.addEventListener('load', function(e){
	console.log('Document loaded')
	init();
});

function init() {
	console.log('In init');
//	document.cigarForm.lookup.addEventListener('click', function(e){
//		e.preventDefault();
//		let cigarId = document.cigarForm.cigarId.value;
//		if (!isNaN(cigarId) && cigarId > 0) {
//			getCigar(cigarId);
//		}
//	});
	document.createCigar.addCigarButton.addEventListener('click', function(e){
		e.preventDefault();
		
		let newCigar = {
			brand: createCigar.brand.value,
			name: createCigar.name.value,
		};
		addCigar(newCigar);
		createCigar.reset();
	});
	
	loadCigarList();
	
}

function loadCigarList() {
	let xhr = new XMLHttpRequest();
	xhr.open('GET', 'api/cigars');
	xhr.onreadystatechange = function() {
		if (xhr.readyState === xhr.DONE) {
			if (xhr.status === 200) {
				displayCigarList(JSON.parse(xhr.responseText));
			} else {
				console.error(xhr.status + ': ' + xhr.responseText);
			}
		}
	};
	xhr.send();
	
}

function displayCigarList(cigars) {
	let tbody = document.getElementById('cigarListTbody');
	tbody.textContent = '';
	
	for (let cigar of cigars) {
		let tr = document.createElement('tr');
		
		let img = document.createElement('img');
		img.src = cigar.imageUrl;
		img.alt = 'Image of ' + cigar.name;
		img.class = img.classList.add('cigar-thumbnail-img')
		
		let td = document.createElement('td');
		td.appendChild(img);
		td.cigarId = cigar.id;
		tr.appendChild(td);
		
		td = document.createElement('td');
		td.textContent = cigar.brand;
		tr.appendChild(td);
		
		td = document.createElement('td');
		td.textContent = cigar.name;
		tr.appendChild(td);
		
		tr.cigarId = cigar.id;
		tr.addEventListener('click', function(e){
			console.log(e.target.parentElement);
			cigarId = e.target.parentElement.cigarId;
//			console.log(cigarId);
			getCigar(cigarId);
			
		})
		tbody.appendChild(tr);
	}
}

function getCigar(cigarId) {
	let xhr = new XMLHttpRequest();
		xhr.open('GET', `api/cigars/${cigarId}`);
		xhr.onreadystatechange = function() {
			if (xhr.readyState === xhr.DONE) {
				if (xhr.status === 200) {
					displayCigar(JSON.parse(xhr.responseText));
				} else {
					console.error(xhr.status + ': ' + xhr.responseText);
				}
			}
		};
		xhr.send();
}

function displayCigar(cigar) {
	
	let cigarDiv = document.getElementById('cigarDetailsDiv');
	cigarDiv.textContent = '';
	
	let h3 = document.createElement('h3');
	h3.textContent = cigar.brand;
	cigarDiv.appendChild(h3);
	
	let img = document.createElement('img');
	img.src = cigar.imageUrl;
	img.alt = 'Image of ' + cigar.brand  + " " + cigar.name;
	img.classList.add('cigar-details-img');
	cigarDiv.appendChild(img);
	
	let backButton = document.createElelment('button');
	backButton.textContent = 'Back to List';
	backButton.classList.add('btn', 'btn-primary');
	backButton.addEventListener('click', function(e){
		showList();
	});
	cigarDiv.appendChild(backButton);
	
	showDetails();
}

function showDetails() {
	let detailsDiv = document.getElementById('cigarDetailsDiv');
	let listDiv = document.getElementById('cigarListDiv');
	detailsDiv.style.display = 'block';
	listDiv.style.display = 'none';
}

function showList() {
	let detailsDiv = document.getElementById('cigarDetailsDiv');
	let listDiv = document.getElementById('cigarListDiv');
	detailsDiv.style.display = 'none';
	listDiv.style.display = 'block';
}

function addCigar(cigar) {
	let xhr = new XMLHttpRequest();
	xhr.open('POST', 'api/cigars');
	xhr.onreadystatechange = function() {
		if(xhr.readyState === xhr.DONE) {
			if(xhr.status === 201) {
				let createdCigar = JSON.parse(xhr.responseText);
				displayCigar(createdCigar);
			}
		}
	};
	xhr.setRequestHeader("Content-type", "application/json");
	xhr.send(JSON.stringify(cigar));
}