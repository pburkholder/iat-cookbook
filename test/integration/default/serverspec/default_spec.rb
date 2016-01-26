require 'spec_helper'

describe 'iat-cookbook::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  describe file('/root/master.zip') do
    it { should be_file }
  end
end
