class VisitorsController < ApplicationController
   def index
  	@ip_address = request.remote_ip
  	@ip_store = cookies[:company_ip] = @ip_address
  	@check_Existing_Ip_Address = Visitor.new

  	#check existing ip address in visitor model
  	@check_Existing_Ip_Address = Visitor.where("ip_address = ?", @ip_store)

  	#if ip address is not existing in the records, it will add the current ip address
  	if @check_Existing_Ip_Address.empty?
  		@check_Existing_Ip_Address = Visitor.create(:ip_address => @ip_store, :visits => 1)
  	#if ip address is existing it will update the visit field and add one
  	else
	  	@check_Existing_Ip_Address.each do |existingIp|
	  		existingIp.increment!(:visits, 1)
	  	end
  	end

  	#check existing ip address in visitor time logs
	@check_Existing_Ip_Address = Visitor.where("ip_address = ?", @ip_store)
	if @check_Existing_Ip_Address.empty?
		@check_Existing_Ip_Address.each do |existingIp|
	  		@check_Existing_Ip_Address = VisitorTimeLog.create(:ip_address => @ip_store)
		end
	else
		@check_Existing_Ip_Address.each do |existingIp|
	  		@check_Existing_Ip_Address = VisitorTimeLog.create(:ip_address => @ip_store, :email => existingIp.email, :company => existingIp.company, :name => existingIp.name)
		end
	end
  	redirect_to users_path
  end
end
