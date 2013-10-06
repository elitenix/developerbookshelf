require 'rubygems'
require 'prawn'

class StoreController < ApplicationController

  def index  	
  	@products = Product.all
  end

  def generatePDF(filename, contents)
 	  Prawn::Document.generate(filename) do |pdf|
	  pdf.text(contents)
	end
  end

end
