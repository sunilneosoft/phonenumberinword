class PhoneNumberInWordController < ApplicationController
  def index
  	if $dictionarywords.blank?
  		$dictionarywords = {}

		File.open("/usr/share/dict/words") do |file|
		  file.each do |line|
		    $dictionarywords[line.strip] = true
		  end
		end
	end
  end

  def create
  	index
  	starttime = Time.now
  	if params[:phonenumber].present?
  		if params[:phonenumber] =~ /^\d+$/
  	        @output = SearchWord.start(params[:phonenumber])
  	    else
  	    	@error = "is not a phone number"
  	    end
  	else
  		@error = "Please Enter 10 digit phone number."
  	end
  	endtime = Time.now
  	@totaltime = endtime - starttime
  	render :index
  end
end
