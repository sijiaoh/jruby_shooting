require "./src/core"

class TestComponent < Component
  attr_accessor :created

  def create
    self.created = true
  end
end

describe GameObject do
  subject(:game_object) { described_class.new }

  let(:test_component) { TestComponent.new }

  describe "#add_component" do
    it "adds component to components" do
      expect do
        game_object.add_component test_component
      end.to change { game_object.components.length }.by 1
    end
  end

  describe "#create" do
    it "calls components create" do
      game_object.add_component test_component
      game_object.create
      expect(test_component.created).to be_truthy
    end
  end
end
