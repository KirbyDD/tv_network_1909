require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/character.rb'
require_relative '../lib/show.rb'

class ShowTest < Minitest::Test 
  def setup
    @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    @michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    @show = Show.new("Knight Rider", "Glen Larson", [@michael_knight, @kitt])
  end

  def test_it_exist
    assert_instance_of Show, @show 
  end

  def test_it_has_a_name
    assert_equal "Knight Rider", @show.name
  end

  def test_it_has_a_creator
    assert_equal "Glen Larson", @show.creator
  end

  def test_it_has_characters
    assert_equal [@michael_knight, @kitt], @show.characters
  end

  def test_total_salary_method
    assert_equal 2600000, @show.total_salary
  end
end