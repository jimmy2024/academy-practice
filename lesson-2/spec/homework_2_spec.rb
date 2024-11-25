# frozen_string_literal: true
require_relative '../homework_2'
RSpec.describe "#greeting" do
  name = "Ivan"
  surname = "Ivan"
  it "right boundary value" do
    age = "19"
    allow($stdin).to receive(:gets).and_return("#{name}", "#{surname}", "#{age}")
    expect { greeting }.to output("Привет, #{name} #{surname}. Самое время заняться делом!\n").to_stdout
  end
  it "boundary value" do
    age = "18"
    allow($stdin).to receive(:gets).and_return("#{name}", "#{surname}", "#{age}")
    expect { greeting }.to output("Привет, #{name} #{surname}. Самое время заняться делом!\n").to_stdout
  end
  it "left boundary value" do
    age = "17"
    allow($stdin).to receive(:gets).and_return("#{name}", "#{surname}", "#{age}")
    expect { greeting }.to output("Привет, #{name} #{surname}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано\n").to_stdout
  end

end

RSpec.describe "#foobar" do
  it "returns 20 if first argument is 20" do
    expect(foobar(20, 1)).to eq(1)
  end
  it "return 20 if second argument is 20" do
    expect(foobar(1, 20)).to eq(20)
  end
  it "return sum of arguments if no 20" do
    expect(foobar(5, 7)).to eq(12)
  end
end
