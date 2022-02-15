require "./src/core"

describe Vector do
  describe "operators" do
    let(:a) { described_class.new 1, 2 }
    let(:b) { described_class.new 3, 4 }

    def expect_slice_equal(a, b)
      expect({ x: a.x, y: a.y }).to eq x: b.x, y: b.y
    end

    describe "+" do
      it "pluses attributes" do
        expect_slice_equal a + b, described_class.new(4, 6)
      end
    end

    describe "-" do
      it "subtracts attributes" do
        expect_slice_equal(a - b, described_class.new(-2, -2))
      end
    end

    describe "*" do
      it "times attributes" do
        expect_slice_equal a * b, described_class.new(3, 8)
      end
    end

    describe "/" do
      it "divides attributes" do
        expect_slice_equal a / b, described_class.new(1.0 / 3, 0.5)
      end
    end
  end
end
