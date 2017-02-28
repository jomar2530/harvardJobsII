require 'test_helper'

class DownloadsControllerTest < ActionDispatch::IntegrationTest
  test "should get download_resume" do
    get downloads_download_resume_url
    assert_response :success
  end

  test "should get download_video" do
    get downloads_download_video_url
    assert_response :success
  end

end
