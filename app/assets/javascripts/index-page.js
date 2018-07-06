document.addEventListener("DOMContentLoaded", function() {
  function idFetch(item){
    fetch(`/users/${item.data().user}/countries.json`)
    .then(response => response.json())
    .then(json => {
      item.data("countryID", json.id)
      countryLayers.resetStyle(countryLayers);
      item.data("countryLayer").setStyle({
        color: "#666",
        fillOpacity: 1,
      }).bindPopup(`<a href="/users/${item.data().user}/countries/${item.data().countryID}">${item.data().countryName}</a>`);
    });
  }
  var indexBounds = new L.LatLngBounds(new L.LatLng(90, -180), new L.LatLng(-80, 180));
  var indexMap = L.map('home-map', {
    scrollWheelZoom: false,
    minZoom: 1,
    maxBounds: indexBounds,
    maxBoundsViscosity: 1.0
  }).setView([0, 0], 1);

  var myStyle = {
    color: '#4286f4',
    stroke:false,
    fillOpacity:0
  };

  var countryLayers = L.geoJson(world, {
    onEachFeature: countryAssignment,
    style: myStyle
  }).addTo(indexMap);

  $(".cntrys-btn").click(function(event) {
    event.preventDefault()
    let token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
    var item = $(this.parentNode);
    if (item.parent().attr('id') === 'visited') {
      this.innerHTML = "+";
      $('#not-visited').append(item);
      countryLayers.resetStyle(countryLayers);
      item.data("countryLayer").setStyle({
        color: '#4286f4',
        fillOpacity: 0,
      });
      fetch(`/users/${item.data().user}/countries/${item.data().countryID}.json`, {
        method: 'DELETE',
        credentials: 'include',
        headers: {
          'X-CSRF-Token': token,
        },
      })
    }else{
      this.innerHTML = "&times";
      $('#visited').append(item);
      let boundaries = item.data().countryLayer._bounds
      let bounds = L.latLngBounds(
        boundaries._northEast,
        boundaries._southWest
      );
      indexMap.fitBounds(bounds);
      let data = {
        name: item.data().countryName,
        user: item.data().user,
        boundaries: boundaries
      }
      fetch(`/users/${item.data().user}/countries.json`, {
        method: 'POST',
        credentials: 'include',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': token,
        },
        body: JSON.stringify(data)
      }).then(timeout => {
        setTimeout(idFetch(item), 1000)
      });
    }
  });

  function countryAssignment(feature, layer) {
    let user =$('#user').data().user.id;
    let countries = $('#user').data().countries;
    let bounds = $('#user').data().countries.bounds;
    var props = feature.properties;
    var item = $(`
      <div class="cntrys">
        <p class="title">${props.name}</p>
      </div>`);
    item.data("countryLayer", layer);
    item.data("countryName", props.name);
    item.data("user", user);
    let  id = false;
    for(let i = 0; i < countries.length; i++) {
      if(countries[i].name === props.name){
        id = countries[i].id;
        break
      }
    }
    if (id || id === 0){
      item.data("countryID", id);
      let url = `<a href="/users/${item.data().user}/countries/${item.data().countryID}">${props.name}</a>`;
      item.append(`<p class="cntrys-btn">&times</p>`)
      $('#visited').append($(item));
      item.data("countryLayer").setStyle({
        color: '#fff',
        fillOpacity: 1,
      }).bindPopup(url);

    }else{
      item.append(`<p class="cntrys-btn">+</p>`)
      $('#not-visited').append(item);
    }
  }
});
