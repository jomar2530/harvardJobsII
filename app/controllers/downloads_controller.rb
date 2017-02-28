class DownloadsController < ApplicationController
	def download_resume
		@check_Existing_Email = Download.new
		@check_Existing_Email = Download.where("email = ?", current_user.email)
		if @check_Existing_Email.empty?
			@check_Existing_Email = Download.create(:email => current_user.email, :resume => 1, :video => 0, :company => current_user.company, :name => current_user.name)
			@createDownloadLogs = DownloadTimeLog.create(:email => current_user.email, :status => "Resume", :company => current_user.company, :name => current_user.name)
		else
			@check_Existing_Email.each do |existingEmail|
				existingEmail.increment!(:resume, 1)
				@createDownloadLogs = DownloadTimeLog.create(:email => current_user.email, :status => "Resume", :company => current_user.company, :name => current_user.name)
			end
		end
		redirect_to applicants_path
	end

	def download_video
		@check_Existing_Email = Download.new
		@check_Existing_Email = Download.where("email = ?", current_user.email)
		if @check_Existing_Email.empty?
			@check_Existing_Email = Download.create(:email => current_user.email, :resume => 0, :video => 1, :company => current_user.company, :name => current_user.name)
			@createDownloadLogs = DownloadTimeLog.create(:email => current_user.email, :status => "Video", :company => current_user.company, :name => current_user.name)
		else
			@check_Existing_Email.each do |existingEmail|
				existingEmail.increment!(:video, 1)
				@createDownloadLogs = DownloadTimeLog.create(:email => current_user.email, :status => "Video", :company => current_user.company, :name => current_user.name)
			end
		end
		redirect_to applicants_path
	end
end
