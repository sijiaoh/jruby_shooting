require "./src/core"

describe Component do
  subject(:test_component) { TestComponent.new }

  let(:game_object) { GameObject.new }

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
    it "adds self to parent's components" do
      expect do
        test_component.game_object = game_object
      end.to change { game_object.components.length }.by 1
    end

    context "when pass nil" do
      it "removes self from game_object's components" do
        test_component.game_object = game_object
        expect do
          test_component.game_object = nil
        end.to change { game_object.components.length }.by(-1)
      end
    end
  end

  describe "#dispose" do
    it "removes self from game_object's components" do
      test_component.game_object = game_object
      expect do
        test_component.dispose
      end.to change { game_object.components.length }.by(-1)
    end
  end
end
