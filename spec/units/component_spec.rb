require "./src/core"

describe Component do
  subject(:component) { described_class.new }

  let(:game_object) { GameObject.new }

  describe "#update" do
    it "does nothing" do
      expect { component.update }.not_to raise_error
    end
  end

  describe "#foo" do
    it "raises error" do
      expect { component.foo }.to raise_error NoMethodError
    end
  end

  describe "#respond_to?" do
    it "returns true with update" do
      expect(component).to respond_to(:update)
    end

    it "returns false with foo" do
      expect(component).not_to respond_to(:foo)
    end
  end

  describe "#game_object=" do
    it "adds self to parent's components" do
      expect do
        component.game_object = game_object
      end.to change { game_object.components.length }.by 1
    end

    context "when pass nil" do
      it "removes self from game_object's components" do
        component.game_object = game_object
        expect do
          component.game_object = nil
        end.to change { game_object.components.length }.by(-1)
      end
    end
  end

  describe "#dispose" do
    it "removes self from game_object's components" do
      component.game_object = game_object
      expect do
        component.dispose
      end.to change { game_object.components.length }.by(-1)
    end
  end
end
