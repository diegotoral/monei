Given("current precision is the default") do
  expect(Monei.precision).to eq 4
end

When("I set precision to {int}") do |int|
  Monei.precision = int
end

Then("I should have it set to {int}") do |int|
  expect(Monei.precision).to eq int
end
