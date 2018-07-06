document.addEventListener("DOMContentLoaded", function() {
  let lat = document.querySelector('.lat');
  let lon = document.querySelector('.lon');
  let rad = document.querySelector('.rad');
  let popupNote = document.querySelector('.popupNote')
  let addCircle = function (event) {
    let circle = L.circle(event.latlng, {
    color: 'red',
    fillColor: '#f03',
    fillOpacity: 0.5,
    radius: rad.value*1000,
    stroke: false
    }).addTo(countryMap);
    circle.bindPopup(popupNote.value);
  }
  let bounds = L.latLngBounds(
    $('#ruby').data().boundaries._northEast,
    $('#ruby').data().boundaries._southWest
  );
  let centre = $('#ruby').data().centre;
  let zoom = $('#ruby').data().zoom;
  let countryMap = L.map('countryMap', {
      noWrap: true
  }).fitBounds(bounds);
  let layer = new L.StamenTileLayer("terrain",{
    noWrap: true
  }).addTo(countryMap);
  function onMapClick(event) {
    lat.innerHTML = event.latlng.lat;
    lon.innerHTML = event.latlng.lng;
    addCircle(event);
    alert("Added visited region");
  }
  function addBlog(blog){
    if (blog.title && blog.post){
      $('#prev-blogs').prepend(`<div class="blog">
        <h3>${blog.title}</h3>
        <p> ${$('#ruby').data().time} </p>
        <p>${blog.post}<p>
      </div>`)
    }else {
      alert("Blog must have title and content!")
    }
  }
  function fetchBlog(uri,blog){
    let token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
    fetch(`${uri}/blogs.json`, {
      method: 'POST',
      credentials: 'include',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': token,
      },
      body: JSON.stringify(blog)
    })
  }

  function saveBlog(){
    let data = $('#ruby').data()
    let uri = data.uri
    let blog = {
      title: document.querySelector('.blog-title').value,
      post: document.querySelector('.blog-content').value,
      country: data.country
    }
    fetchBlog(uri, blog);
    addBlog(blog);
    document.querySelector('.blog-title').value = "";
    document.querySelector('.blog-content').value = "";
  }
  countryMap.addEventListener('click', onMapClick);
  let faSave = document.querySelector('i');
  faSave.addEventListener('click', saveBlog);
  console.log(JSON.stringify($('#ruby').data().boundaries))
});
