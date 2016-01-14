require 'rails_helper'

RSpec.describe Rpn, type: :model do
  
  before(:each) do
      @calculator = Rpn.new
  end
    
  it "can validate number" do
    expect( @calculator.is_number?('1') ).to be_truthy
    expect( @calculator.is_number?('1.3') ).to be_truthy    
    expect( @calculator.is_number?('123.23') ).to be_truthy   
    expect( @calculator.is_number?('1asdf') ).to be_falsey 
  end
  
  it "can validate basic operators" do
    expect( @calculator.is_operator?('+') ).to be_truthy
    expect( @calculator.is_operator?('-') ).to be_truthy
    expect( @calculator.is_operator?('/') ).to be_truthy
    expect( @calculator.is_operator?('*') ).to be_truthy
    expect( @calculator.is_operator?('a') ).to be_falsey
    expect( @calculator.is_operator?('c') ).to be_falsey
    expect( @calculator.is_operator?('e') ).to be_falsey
    expect( @calculator.is_operator?('z') ).to be_falsey
  end
  
  it "can evaluate two numbers" do
    expect( @calculator.evaluate("+", [2.5,2.6]) ).to eq 5.1
    expect( @calculator.evaluate("-", [123,23]) ).to eq 100
    expect( @calculator.evaluate("*", [3,3]) ).to eq 9
    expect( @calculator.evaluate("/", [100,10]) ).to eq 10
    
  end
  
  it "will raise error if not enough inputs to do operation" do
    expect{@calculator.enter("*")}.to raise_error "Insufficient inputs"
    @calculator.enter("2")
    expect{@calculator.enter("*")}.to raise_error "Insufficient inputs"
  end

  it "will raise error on invalid input" do
    expect{@calculator.enter("asdf")}.to raise_error "Invalid Input"
    expect{@calculator.enter("23asd")}.to raise_error "Invalid Input"
  end
    
  it "can calculate numbers" do
    expect(@calculator.enter("2")).to eq '2'
    expect(@calculator.enter("4")).to eq '4'
    expect(@calculator.enter("*")).to eq 8
    expect(@calculator.enter("4.3")).to eq '4.3'
    expect(@calculator.enter("+")).to eq 12.3
    expect(@calculator.enter("3")).to eq "3"
    expect(@calculator.enter("/")).to eq 4.1
    
  end
  
end
