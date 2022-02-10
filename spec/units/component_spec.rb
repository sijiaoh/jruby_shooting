require "./src/core"

describe Component do
  subject(:test_component) { TestComponent.new }

  describe "#update" do
    it "does nothing" do
      expect { test_component.update }.not_to raise_error
    end
  end

  describe "#foo" do
    it "raises error" do
      expect { test_component.foo }.to raise_error NoMethodError
    end
  end

  describe "#respond_to?" do
    it "returns true with update" do
      expect(test_component).to respond_to(:update)
    end

    it "returns false with foo" do
      expect(test_component).not_to respond_to(:foo)
    end
  end

  describe "#game_object=" do
    let(:game_object) { GameObject.new }

    it "adds self to parent's components" do
      expect do
        test_component.game_object = game_object
      end.to change { game_object.components.length }.by 1
    end
  end
end
