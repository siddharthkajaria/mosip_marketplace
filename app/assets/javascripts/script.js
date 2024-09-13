// $(document).ready(function(){

//     $(document).ready(function () {
//       $('.thumbnail').click(function () {
//         var newSrc = $(this).attr('src');
//         $('#main-product-image').attr('src', newSrc);
//       });
//     });

//     $(document).ready(function () {
//       $(document).ready(function () {
//         $('.select2').select2({
//           minimumResultsForSearch: Infinity
//         });
//       });
  
//       $('#grid-view-icon').click(function () {
//         $('#grid-view').show();
//         $('#list-view').hide();
//         $(this).removeClass('inactive-icon').addClass('active-icon');
//         $('#list-view-icon').removeClass('active-icon').addClass('inactive-icon');
//       });
  
//       $('#list-view-icon').click(function () {
//         $('#grid-view').hide();
//         $('#list-view').show();
//         $(this).removeClass('inactive-icon').addClass('active-icon');
//         $('#grid-view-icon').removeClass('active-icon').addClass('inactive-icon');
//       });
  
//     });
  
//     $(document).ready(function () {
       
  
//         $('#filterSelectAll1').click(function () {
//           var isChecked = $(this).is(':checked');
//           $('#filterCollapseOne .custom-control-input').not(this).prop('checked', isChecked);
//         });
//         $('#filterSelectAll2').click(function () {
//           var isChecked = $(this).is(':checked');
//           $('#filterCollapseTwo .custom-control-input').not(this).prop('checked', isChecked);
//         });
//         $('#filterSelectAll3').click(function () {
//           var isChecked = $(this).is(':checked');
//           $('#filterCollapseThree .custom-control-input').not(this).prop('checked', isChecked);
//         });
//         $('#filterSelectAll4').click(function () {
//           var isChecked = $(this).is(':checked');
//           $('#filterCollapseFour .custom-control-input').not(this).prop('checked', isChecked);
//         });
//         // Filter search functionality
//         $('#filterSearch').on('input', function () {
//           var searchText = $(this).val().toLowerCase();
//           $('#filterCollapseFive .custom-control').each(function () {
//             var optionText = $(this).text().toLowerCase();
//             if (optionText.includes(searchText)) {
//               $(this).show();
//             } else {
//               $(this).hide();
//             }
//           });
//         });
//       });
  
//       $(document).ready(function () {
//         $('#toggleOpen').on('click', function () {
//           $('.sticky-sidebar').addClass('show');
//           $('#toggleOpen').addClass('d-none');
//           $('#toggleClose').removeClass('d-none');
//         });
  
//         $('#toggleClose').on('click', function () {
//           $('.sticky-sidebar').removeClass('show');
//           $('#toggleClose').addClass('d-none');
//           $('#toggleOpen').removeClass('d-none');
//         });
  
//         // Close sidebar when clicking outside
//         $(document).on('click', function (event) {
//           if (!$(event.target).closest('.sticky-sidebar, #toggleOpen').length) {
//             $('.sticky-sidebar').removeClass('show');
//             $('#toggleClose').addClass('d-none');
//             $('#toggleOpen').removeClass('d-none');
//           }
//         });
//       });
  

//       // ------------Filter Js start---------------

     
//         // Handle filter change
//         $('.filter-checkbox').on('change', function() {
//           var selectedFilters = getSelectedFilters();
//           updateURL(selectedFilters);
//           fetchFilteredProducts(selectedFilters);
//         });
      
//         // Toggle sidebar
//         $('#toggleOpen').on('click', function() {
//           $('.sticky-sidebar').removeClass('d-none');
//           $('#toggleOpen').addClass('d-none');
//           $('#toggleClose').removeClass('d-none');
//         });
      
//         $('#toggleClose').on('click', function() {
//           $('.sticky-sidebar').addClass('d-none');
//           $('#toggleOpen').removeClass('d-none');
//           $('#toggleClose').addClass('d-none');
//         });
      
        
//         // Get selected filters
//         function getSelectedFilters() {
//           var selectedFilters = {};
//           $('.filter-checkbox').each(function() {
//             if ($(this).is(':checked')) {
//               var name = $(this).attr('name');
//               if (!selectedFilters[name]) {
//                 selectedFilters[name] = [];
//               }
//               selectedFilters[name].push($(this).val());
//             }
//           });
//           return selectedFilters;
//         }
      
//         var url = (window.location.pathname + window.location.search)

//         // Update URL with selected filters
//         function updateURL(filters) {
//           var queryString = $.param(filters);
//           if (queryString) {
//             var newUrl = url + '&' + queryString;
//           }else{
//             var newUrl = url 
//           }
          
//           history.replaceState(null, '', newUrl);
//         }
      
//         // Fetch filtered products
//         function fetchFilteredProducts(filters, url = window.location.pathname + window.location.search) {
//           $.ajax({
//             url: url,
//             type: 'GET',
//             data: filters,
//             dataType: 'script',
//             success: function(data) {
//               // Successfully loaded filtered products
//             },
//             error: function(xhr, status, error) {
//               console.error('Error fetching filtered products:', error);
//             }
//           });
//         }
      
      
//       // ============Filter Js End-----------

//       // Search script


//       const searchInput = document.getElementById('search-input');

//       searchInput.addEventListener('input', function() {
//         const query = searchInput.value;
//         $.ajax({
//           url: window.location.pathname + window.location.search,
//           type: 'GET',
//           data: {search_query:query},
//           dataType: 'script',
//           success: function(data) {
//             // Successfully loaded filtered products
//           },
//           error: function(xhr, status, error) {
//             console.error('Error fetching filtered products:', error);
//           }
//         });
//       });


//       // ==========Search ended=============

//       // owl-carousel
  
// });


$(document).ready(function () {
  // Thumbnail click event
  $('.thumbnail').click(function () {
    var newSrc = $(this).attr('src');
    $('#main-product-image').attr('src', newSrc);
  });

  // Initialize Select2
  $('.select2').select2({
    minimumResultsForSearch: Infinity
  });

  // Grid and List view toggle
  $('#grid-view-icon').click(function () {
    $('#grid-view').show();
    $('#list-view').hide();
    $(this).removeClass('inactive-icon').addClass('active-icon');
    $('#list-view-icon').removeClass('active-icon').addClass('inactive-icon');
  });

  $('#list-view-icon').click(function () {
    $('#grid-view').hide();
    $('#list-view').show();
    $(this).removeClass('inactive-icon').addClass('active-icon');
    $('#grid-view-icon').removeClass('active-icon').addClass('inactive-icon');
  });

  // Select all checkboxes in filters
  $('#filterSelectAll1').click(function () {
    var isChecked = $(this).is(':checked');
    $('#filterCollapseOne .custom-control-input').not(this).prop('checked', isChecked);
  });

  $('#filterSelectAll2').click(function () {
    var isChecked = $(this).is(':checked');
    $('#filterCollapseTwo .custom-control-input').not(this).prop('checked', isChecked);
  });

  $('#filterSelectAll3').click(function () {
    var isChecked = $(this).is(':checked');
    $('#filterCollapseThree .custom-control-input').not(this).prop('checked', isChecked);
  });

  $('#filterSelectAll4').click(function () {
    var isChecked = $(this).is(':checked');
    $('#filterCollapseFour .custom-control-input').not(this).prop('checked', isChecked);
  });

  // Filter search functionality
  $('#filterSearch').on('input', function () {
    var searchText = $(this).val().toLowerCase();
    $('#filterCollapseFive .custom-control').each(function () {
      var optionText = $(this).text().toLowerCase();
      if (optionText.includes(searchText)) {
        $(this).show();
      } else {
        $(this).hide();
      }
    });
  });

  // Toggle sidebar
  $('#toggleOpen').on('click', function () {
    $('.sticky-sidebar').addClass('show');
    $('#toggleOpen').addClass('d-none');
    $('#toggleClose').removeClass('d-none');
  });

  $('#toggleClose').on('click', function () {
    $('.sticky-sidebar').removeClass('show');
    $('#toggleClose').addClass('d-none');
    $('#toggleOpen').removeClass('d-none');
  });

  // Close sidebar when clicking outside
  $(document).on('click', function (event) {
    if (!$(event.target).closest('.sticky-sidebar, #toggleOpen').length) {
      $('.sticky-sidebar').removeClass('show');
      $('#toggleClose').addClass('d-none');
      $('#toggleOpen').removeClass('d-none');
    }
  });

  // Filter functionality
  $('.filter-checkbox').on('change', function () {
    var selectedFilters = getSelectedFilters();
    updateURL(selectedFilters);
    fetchFilteredProducts(selectedFilters);
  });

  // Toggle sidebar
  $('#toggleOpen').on('click', function () {
    $('.sticky-sidebar').removeClass('d-none');
    $('#toggleOpen').addClass('d-none');
    $('#toggleClose').removeClass('d-none');
  });

  $('#toggleClose').on('click', function () {
    $('.sticky-sidebar').addClass('d-none');
    $('#toggleOpen').removeClass('d-none');
    $('#toggleClose').addClass('d-none');
  });

  // Get selected filters
  function getSelectedFilters() {
    var selectedFilters = {};
    $('.filter-checkbox').each(function () {
      if ($(this).is(':checked')) {
        var name = $(this).attr('name');
        if (!selectedFilters[name]) {
          selectedFilters[name] = [];
        }
        selectedFilters[name].push($(this).val());
      }
    });

    

    return selectedFilters;
  }

  
  
  var url = (window.location.pathname + window.location.search)

  // Update URL with selected filters
  function updateURL(filters) {
    var queryString = $.param(filters);
    if (queryString) {
      var newUrl = url + '&' + queryString;
    } else {
      var newUrl = url
    }

    history.replaceState(null, '', newUrl);
  }

  // Fetch filtered products
  function fetchFilteredProducts(filters, url = window.location.pathname + window.location.search) {
    $.ajax({
      url: url,
      type: 'GET',
      data: filters,
      dataType: 'script',
      success: function (data) {
        // Successfully loaded filtered products
      },
      error: function (xhr, status, error) {
        console.error('Error fetching filtered products:', error);
      }
    });
  }

  // Search functionality
  const searchInput = document.getElementById('search-input');
  if (searchInput) {
    searchInput.addEventListener('input', function () {
      const query = searchInput.value;
      $.ajax({
        url: window.location.pathname + window.location.search,
        type: 'GET',
        data: { search_query: query },
        dataType: 'script',
        success: function (data) {
          // Successfully loaded filtered products
        },
        error: function (xhr, status, error) {
          console.error('Error fetching filtered products:', error);
        }
      });
    });
  }

  // Owl carousel 
  $('.custom-carousel-1').owlCarousel({
    items: 4, // Web view items
    nav: true, // Enable navigation
    dots: false, // Disable dots
    loop: true,
    margin: 10,
    navText: [
      '<img src="images/home/home-car-arrow2.png" style="width:20px" alt="Previous" />', // Custom previous arrow
      '<img src="images/home/home-car-arrow1.png" style="width:20px" alt="Next" />'    // Custom next arrow
    ],
    responsive: {
      0: {
        items: 2.5, // Mobile view items
        nav: false, // Disable navigation on mobile
        dots: false
      },
      768: {
        items: 4, // Web view items
        nav: true,
        dots: false
      }
    }
  });

  // partner-owl-carousel

  $('.partners-carousel').owlCarousel({
    loop: true,
    margin: 10,
    nav: false,
    dots: false,
    responsive: {
      0: {
        items: 1
      },
      600: {
        items: 1
      },
      1000: {
        items: 2.5
      }
    }
  });

  // zoom-functionality

  var zoomFactor = 1.2;

  var set_zoom = function () {
    var zoom_value = 1;
    var windowWidth = window.innerWidth;

    // Define your zoom logic here based on screen size
    if (windowWidth > 2000) {
      zoom_value = windowWidth / 2000;
    } else {
      zoom_value = 1; // Default zoom for smaller screens
    }

    // Apply the zoom to elements with the "zoom" class
    $(".zoom").css("zoom", zoom_value * zoomFactor);
  }

  // Call set_zoom on page load
  $(document).ready(function () {
    set_zoom();
  });

  // Call set_zoom when the window size changes
  $(window).on("resize", function () {
    set_zoom();
  });
  
  // height-functionality

  // Function to set equal heights for elements with a given class name
  function setEqualHeight(className) {
    var elements = $('.' + className);
    var maxHeight = 0;

    elements.each(function () {
      maxHeight = Math.max(maxHeight, $(this).outerHeight());
    });

    elements.height(maxHeight);
  }

  // Function to handle resizing and apply equal heights if screen width > 767px
  function handleResize() {
    if ($(window).width() > 767) {
      setEqualHeight('solution-1');
      setEqualHeight('partner-h1');
      setEqualHeight('partner-h2');
      setEqualHeight('product-1');
      setEqualHeight('product-2');
      setEqualHeight('product-3');
      setEqualHeight('product-4');
      setEqualHeight('product-5');
      setEqualHeight('partner-h3');
      setEqualHeight('partner-h4');
      setEqualHeight('img-h1');
      setEqualHeight('solutions-1');
    } else {
      // Reset heights to 'auto' when screen width is 767px or less
      $('.solution-1, .partner-h1, .partner-h2, .product-1, .product-2, .product-3, .product-4, product-5, .partner-h3, .img-h1, .partner-h4, .solutions-1').css('height', 'auto');
    }
  }

  // Ensure that heights are set only after the window has fully loaded
  $(window).on('load', function () {
    handleResize();

    // Re-run height adjustment on window resize
    $(window).resize(handleResize);
  });


  // ============ Si Integrator Filter =================

  $(document).ready(function () {
    // Handle filter change
    $('.filter-checkbox').on('change', function () {
      var selectedFilters = getSelectedFilters();
      updateURL(selectedFilters);
      fetchFilteredProducts(selectedFilters);
    });
  
    // Toggle sidebar
    $('#toggleOpen').on('click', function () {
      $('.sticky-sidebar').removeClass('d-none');
      $('#toggleOpen').addClass('d-none');
      $('#toggleClose').removeClass('d-none');
    });
  
    $('#toggleClose').on('click', function () {
      $('.sticky-sidebar').addClass('d-none');
      $('#toggleOpen').removeClass('d-none');
      $('#toggleClose').addClass('d-none');
    });
  
    // Get selected filters
    function getSelectedFilters() {
      var selectedFilters = {};
      $('.filter-checkbox').each(function () {
        if ($(this).is(':checked')) {
          var name = $(this).attr('name');
          if (!selectedFilters[name]) {
            selectedFilters[name] = [];
          }
          selectedFilters[name].push($(this).val());
        }
      });
      return selectedFilters;
    }
  
    var url = (window.location.pathname + window.location.search);
  
    // Update URL with selected filters
    function updateURL(filters) {
      var queryString = $.param(filters);
      var newUrl = queryString ? url + '&' + queryString : url;
      history.replaceState(null, '', newUrl);
    }
  
    // Fetch filtered products
    function fetchFilteredProducts(filters, url = window.location.pathname + window.location.search) {
      $.ajax({
        url: url,
        type: 'GET',
        data: filters,
        dataType: 'script',
        success: function (data) {
          // Successfully loaded filtered products
        },
        error: function (xhr, status, error) {
          console.error('Error fetching filtered products:', error);
        }
      });
    }
  
    // Handle SI Partnership filter select all functionality
    $('#siFilterSelectAll').on('click', function () {
      var isChecked = $(this).is(':checked');
      $('#filterCollapseSix .custom-control-input').not(this).prop('checked', isChecked);
      var selectedFilters = getSelectedFilters();
      updateURL(selectedFilters);
      fetchFilteredProducts(selectedFilters);
    });
  
    // Handle search within SI Partnership filter
    $('#siFilterSearch').on('input', function () {
      var searchText = $(this).val().toLowerCase();
      $('#filterCollapseSix .custom-control').each(function () {
        var optionText = $(this).text().toLowerCase();
        if (optionText.includes(searchText)) {
          $(this).show();
        } else {
          $(this).hide();
        }
      });
    });
  
    // Search script
    const searchInput = document.getElementById('search-input');
  
    if (searchInput) {
      searchInput.addEventListener('input', function () {
        const query = searchInput.value;
        $.ajax({
          url: window.location.pathname + window.location.search,
          type: 'GET',
          data: { search_query: query },
          dataType: 'script',
          success: function (data) {
            // Successfully loaded filtered products
          },
          error: function (xhr, status, error) {
            console.error('Error fetching filtered products:', error);
          }
        });
      });
    }
  });
  

  // ==============Si filter End==========




// ==================scrolling-section=============

  const images = [
    "images/partner/part-1.png",
    "images/partner/part-2.png",
    "images/partner/part-3.png",
    "images/partner/part-4.png",
    "images/partner/part-5.png",
    "images/partner/part-6.png"
  ];

  // Shuffle the images array
  const shuffledImages = images.sort(() => Math.random() - 0.5);

  const imageContainer = document.getElementById("imageContainer");

  // Clear previous images (if any)
  imageContainer.innerHTML = '';

  // Function to add images to the container
  function addImages(images) {
    images.forEach(src => {
      const img = document.createElement("img");
      img.src = src;
      img.alt = "home-partner";
      img.loading = "lazy";
      imageContainer.appendChild(img);
    });
  }

  // Add the randomized images to the container
  addImages(shuffledImages);

  // Duplicate the randomized images to create a seamless loop
  addImages(shuffledImages);



  // ==================scrolling-section end=============

  // ------------Sorting  product js--------------
  $(document).on('change', '#sort-options', function() {
      // Get the selected sort option
      var sortOption = $(this).val();
    
      // Get the current URL parameters and parse them
      var currentParams = new URLSearchParams(window.location.search);
      
      // Add/Update the sort_option in the URL parameters
      if (sortOption) {
        currentParams.set('sort_option', sortOption);
      } else {
        currentParams.delete('sort_option');  // If no option is selected, remove the sort_option
      }
    
      // Perform an AJAX GET request
      $.ajax({
        url: window.location.pathname + '?' + currentParams.toString(),  // Preserve current params and append sort_option
        type: 'GET',
        dataType: 'script',  // Rails will respond with a JS template
        success: function() {
          console.log('Sorted products successfully fetched');
        },
        error: function(xhr, status, error) {
          console.error('Error fetching sorted products:', error);
        }
      });
    });
  
  // -------------End Sorting-------------------------

});