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

  describe "#parent=" do
    let(:child) { described_class.new }

    it "changes #parent" do
      child.parent = game_object
      expect(child.parent).to eq game_object
    end

    it "changes parent's children" do
      child.parent = game_object
      expect(game_object.children.first).to eq child
    end
  end

  describe "#add_child" do
    let(:child) { described_class.new }

    it "adds child to children" do
      game_object.add_child child
      expect(game_object.children.first).to eq child
    end

    it "changes child's parent" do
      game_object.add_child child
      expect(child.parent).to eq game_object
    end
  end

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
