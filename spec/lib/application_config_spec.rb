require "spec_helper"

describe ApplicationConfig do
  context "with default values" do
    subject(:app_config) do
      described_class.new do
        config_key :foo, default: :bar
      end
    end

    its(:foo) { should eq :bar }

    context 'when default value is equal false and mandatory' do
      subject(:app_config) do
        described_class.new do
          config_key :foo, mandatory: true, default: false
        end
      end

      its(:foo) { should eq  false }
    end
  end

  context "without default values" do
    subject(:app_config) do
      described_class.new do
        config_key :foo
      end
    end

    its(:foo) { should eq nil }
  end

  context "with mandatory values" do
    subject(:app_config) do
      described_class.new do
        config_key :foo, mandatory: true
      end
    end

    it "raises error" do
      expect { app_config }.to raise_error(ArgumentError)
    end
  end
end
