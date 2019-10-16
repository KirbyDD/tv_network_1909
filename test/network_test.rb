require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/character.rb'
require_relative '../lib/show.rb'
require_relative '../lib/network.rb'

class NetworkTest < Minitest::Test 
  def setup
    @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    @michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    @knight_rider = Show.new("Knight Rider", "Glen Larson", [@michael_knight, @kitt])
    @leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    @ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    @parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [@leslie_knope, @ron_swanson])
    @nbc = Network.new("NBC")
  end

  def test_it_exist
    assert_instance_of Network, @nbc 
  end

  def test_it_has_a_name
    assert_equal "NBC", @nbc.name
  end

  def test_it_has_no_shows_by_default
    assert_equal [], @nbc.shows
  end

  def test_add_show_method
    @nbc.add_show(@knight_rider)
    assert_equal [@knight_rider], @nbc.shows
    @nbc.add_show(@parks_and_rec)
    assert_equal [@knight_rider, @parks_and_rec], @nbc.shows
  end

  def test_highest_paid_actor_method
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)
    assert_equal "Amy Poehler", @nbc.highest_paid_actor
  end
end