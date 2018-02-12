require 'test_helper'

class SkillsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @skill = skills(:one)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Skill.count' do
      post skills_path, params: { skill: { name: "MyString1" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Skill.count' do
      delete skill_path(@skill)
    end
    assert_redirected_to login_url
  end
end
