require "./src/core"

class TestComponent < Component
end

describe GameObject do
  subject(:game_object) { described_class.new }

  let(:child) { described_class.new }
  let(:component) { Component.new }
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
        game_object.add_component component
      end.to change { game_object.components.length }.by 1
    end
  end

  describe "#update" do
    it "calls components create" do
      game_object.add_component component
      game_object.update
      expect(component).to be_created
    end
  end

  describe "#dispose" do
    dispose_count = 0
    dispose_counter_class = Class.new Component do
      define_method :dispose do
        dispose_count += 1
      end
    end

    before { dispose_count = 0 }

    context "when before call update" do
      it "call all component's dispose" do
        component_num = 3
        game_object.add_components Array.new(component_num) { dispose_counter_class.new }
        game_object.dispose
        expect(dispose_count).to eq 0
      end
    end

    context "when after called update" do
      it "call all component's dispose" do
        component_num = 3
        game_object.add_components Array.new(component_num) { dispose_counter_class.new }
        game_object.update
        game_object.dispose
        expect(dispose_count).to eq component_num
      end
    end

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

  describe "#get_component" do
    it "returns first of specified class component" do
      game_object.add_component test_component
      game_object.add_component TestComponent.new
      expect(game_object.get_component(TestComponent)).to eq test_component
    end
  end

  describe "#get_components" do
    it "returns all specified class components" do
      game_object.add_component test_component
      game_object.add_component TestComponent.new
      expect(game_object.get_components(TestComponent).length).to eq 2
    end
  end
end
