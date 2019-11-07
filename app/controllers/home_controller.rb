class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'



    @url = 'https://api.waqi.info/feed/beijing/?token=5bc9d9e4e31f41d07c589fae2cf23b4e2dfbbe90'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)

    if @output.empty?
        @final_output = "Error"
    else
        @final_output = @output['data']['aqi']
    end

    if @final_output == "Error"
      @api_color = "gray"
    elsif @final_output <= 50
      @api_color = "green"
      @api_description = "Air is clean, perfect for drinking coffee"
    elsif @final_output >= 51 && @final_output <= 100
      @api_color = "yellow"
      @api_description = "Air is ok, perfect for drinking coffee"
    elsif @final_output >= 101 && @final_output <= 150
      @api_color = "orange"
      @api_description = "Air is a bit shit, perfect for drinking coffee"
    elsif @final_output >= 151 && @final_output <= 200
      @api_color = "red"
      @api_description = "Air is getting dirty, perfect for drinking coffee"
    elsif @final_output >= 201 && @final_output <= 300
      @api_color = "purple"
      @api_description = "Air is real bad, perfect for drinking coffee"
    elsif @final_output >= 301 && @final_output <= 500
      @api_color = "maroon"
      @api_description = "Air is total shite, perfect for drinking coffee"
    end
  end

  def zipcode
    @zip_query = params[:zipcode]
    if params[:zipcode] === ""
      @final_output = "Empty search field"
    elsif params[:zipcode]
      #do API stuff


      require 'net/http'
      require 'json'

      @url = 'https://api.waqi.info/feed/'+ @zip_query + '/?token=5bc9d9e4e31f41d07c589fae2cf23b4e2dfbbe90'
      @uri = URI(@url)
      @response = Net::HTTP.get_response(@uri)

      @output = JSON.parse(@response.body)

      if @output['status'] === "ok"
        @final_output = @output['data']['aqi']
        @city = @output['data']['city']['name']  
      else
        @final_output = "Error"
        @city = "Please enter a city or location"  
      end

      if @final_output == "Error"
        @api_color = "gray"
      elsif @final_output <= 50
        @api_color = "green"
        @api_description = "Air is clean, perfect for drinking coffee"
      elsif @final_output >= 51 && @final_output <= 100
        @api_color = "yellow"
        @api_description = "Air is ok, perfect for drinking coffee"
      elsif @final_output >= 101 && @final_output <= 150
        @api_color = "orange"
        @api_description = "Air is a bit shit, perfect for drinking coffee"
      elsif @final_output >= 151 && @final_output <= 200
        @api_color = "red"
        @api_description = "Air is getting dirty, perfect for drinking coffee"
      elsif @final_output >= 201 && @final_output <= 300
        @api_color = "purple"
        @api_description = "Air is real bad, perfect for drinking coffee"
      elsif @final_output >= 301 && @final_output <= 500
        @api_color = "maroon"
        @api_description = "Air is total shite, perfect for drinking coffee"
      end


    end
  end
end
