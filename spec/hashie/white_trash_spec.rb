require 'spec_helper'

class Foo < Hashie::WhiteTrash
  property :bar, :from => :Bar
end

describe Hashie::WhiteTrash do
  let(:foo) { Foo.new(:Bar => 'baz', :quz => 'ignore me') }

  it 'acts like a trash for defined properties' do
    expect(foo.bar).to eql('baz')
  end  

  it 'ignores properties that are not defined' do
    expect {foo.quz }.to raise_error(NoMethodError)
  end
end
