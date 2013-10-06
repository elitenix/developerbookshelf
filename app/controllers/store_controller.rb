require 'rubygems'
require 'prawn'

class StoreController < ApplicationController

  def index  	
  	generatePDF('inventory.pdf', Product.all)

  	@products = Product.all
  end

  def generatePDF(filename, products)
 	  Prawn::Document.generate(filename) do |pdf|
	  products.each do |product|
	  	pdf.text(product.title)
	  	pdf.text(ActionController::Base.helpers.strip_tags(product.description))
	  	pdf.horizontal_rule
	  	pdf.move_down 10
	  end  
	end
  end

end
