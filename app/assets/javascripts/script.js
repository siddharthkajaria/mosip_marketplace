$(document).ready(function(){
    $('.filter-checkbox').on('change', function() {
      var selectedFilters = {};
  
      $('.filter-checkbox').each(function() {
        if ($(this).is(':checked')) {
          var name = $(this).attr('name');
          if (!selectedFilters[name]) {
            selectedFilters[name] = [];
          }
          selectedFilters[name].push($(this).val());
        }
      });
  
      fetchFilteredProducts(selectedFilters);
    });
  
    function fetchFilteredProducts(filters) {
      $.ajax({
        url: '/products',
        type: 'GET',
        data: filters,
        dataType: 'script',
        
      });
    }
  });