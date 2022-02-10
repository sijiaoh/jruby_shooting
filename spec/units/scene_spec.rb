require "./src/core"

class TestGameObject < GameObject
  attr_accessor :called_create_count, :called_update_count

  def initialize
    super
    self.called_create_count = 0
    self.called_update_count = 0
  end

  def create
    super
    self.called_create_count += 1
  end

  def update
    super
    self.called_update_count += 1
  end
end

describe Scene do
  subject(:scene) { described_class.new }

  let(:test_game_object) { TestGameObject.new }

  describe "#update" do
    it "calls game_objects create only once" do
      scene.add_game_object test_game_object
      scene.update
      scene.update
      expect(test_game_object.called_create_count).to eq 1
    end

    it "always call game_objects update" do
      scene.add_game_object test_game_object
      scene.update
      scene.update
      expect(test_game_object.called_update_count).to eq 2
    end
  end
end
