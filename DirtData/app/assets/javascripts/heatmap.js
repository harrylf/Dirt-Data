
      var map, heatmap;

      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          zoom: 20,
          center: {lat: 41.663934, lng: -91.580702}, 
          mapTypeId: 'satellite'
        });

        heatmap = new google.maps.visualization.HeatmapLayer({
          data: getPoints(),
          map: map
        });
      }

      function toggleHeatmap() {
        heatmap.setMap(heatmap.getMap() ? null : map);
      }

      function changeGradient() {
        var gradient = [
          'rgba(0, 255, 255, 0)',
          'rgba(0, 255, 255, 1)',
          'rgba(0, 191, 255, 1)',
          'rgba(0, 127, 255, 1)',
          'rgba(0, 63, 255, 1)',
          'rgba(0, 0, 255, 1)',
          'rgba(0, 0, 223, 1)',
          'rgba(0, 0, 191, 1)',
          'rgba(0, 0, 159, 1)',
          'rgba(0, 0, 127, 1)',
          'rgba(63, 0, 91, 1)',
          'rgba(127, 0, 63, 1)',
          'rgba(191, 0, 31, 1)',
          'rgba(255, 0, 0, 1)'
        ]
        heatmap.set('gradient', heatmap.get('gradient') ? null : gradient);
      }
      changeGradient();

      function changeRadius() {
        heatmap.set('radius', heatmap.get('radius') ? null : 50);
      }

      function changeOpacity() {
        heatmap.set('opacity', heatmap.get('opacity') ? null : 0.2);
      }

      // Heatmap data: 8 Points
      function getPoints() {
        return [
            {location: new google.maps.LatLng(41.663978, -91.580580), weight: 40}, 
            {location: new google.maps.LatLng(41.663992, -91.580635), weight: 30},  
            {location: new google.maps.LatLng(41.663999, -91.580807), weight: 35}, 
            {location: new google.maps.LatLng(41.663987, -91.580862), weight: 40}, 
            {location: new google.maps.LatLng(41.663895, -91.580858), weight: 32},  
            {location: new google.maps.LatLng(41.663900, -91.580804), weight: 36}, 
            {location: new google.maps.LatLng(41.663897, -91.580690), weight: 41},
            {location: new google.maps.LatLng(41.663882, -91.580580), weight: 50},  
        ];
      }
