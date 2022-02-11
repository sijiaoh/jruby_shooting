require "./src/core"

class TestComponent < Component
end

describe GameObject do
  subject(:game_object) { described_class.new }

  let(:child) { described_class.new }
  let(:test_component) { TestComponent.new }

  describe "#parent=" do
    it "changes #parent" do
      child.parent = game_object
      expect(child.parent).to eq game_object
    end

    it "changes parent's children" do
      child.parent = game_object
      expect(game_object.children.first).to eq child
    end

    context "when pass nil" do
      it "removes self from parent's children" do
        child.parent = game_object
        expect do
          child.parent = nil
        end.to change { game_object.children.length }.by(-1)
      end
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

  describe "#update" do
    it "calls components create" do
      game_object.add_component test_component
      game_object.update
      expect(test_component).to be_created
    end
  end

  describe "#dispose" do
    it "removes self from parent's components" do
      child.parent = game_object
      expect do
        child.dispose
      end.to change { game_object.children.length }.by(-1)
    end
  end

  describe "position=" do
    it "sets correct value to local_position" do
      child.parent = game_object
      game_object.position = Vector.new 1, 2
      child.position = Vector.new 3, 4
      expect({ x: child.local_position.x, y: child.local_position.y }).to eq x: 2, y: 2
    end
  end
end
