require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    @url = Url.create(original: "https://google.com")
  end

  test "should redirect to shortened url" do
    get visit_shortened_url_url(@url.link.identifier)
    assert_redirected_to @url.original
  end

  test "should capture ip address from url" do
    assert_difference("Visit.count") do
      get visit_shortened_url_url(@url.link.identifier)
    end
  end

  test "should not redirect to shortened url" do
    get visit_shortened_url_url("abc")
    assert_redirected_to root_url
  end
end