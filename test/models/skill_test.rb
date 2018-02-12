require 'test_helper'

class SkillTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @skill = @user.skills.build(name: "Java")
  end

  test "should be valid" do
    assert @skill.valid?
  end

  test "user id should be present" do
    @skill.user_id = nil
    assert_not @skill.valid?
  end

  test "skill should be present" do
    @skill.name = "   "
    assert_not @skill.valid?
  end

  test "order should be most recent first" do
    assert_equal skills(:four), Skill.first
  end
end
