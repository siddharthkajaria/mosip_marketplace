class SearchController < ApplicationController
    def search
        per_page = 12
      
        if params[:query].present?
          # Perform the search across both models
          product_results = Product.search(params[:query]).records
          si_results = SystemIntegrator.search(params[:query]).records
      
          # Merge results from both models
          @products = product_results + si_results
        else
          @products = []
        end
      
        @products = @products
      
        add_breadcrumb("Searched Results")
      
        respond_to do |format|
          format.html                     
          format.js   # Handles AJAX if you're using JavaScript
        end
    end
end
