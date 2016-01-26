require 'spec_helper'

describe 'iat-cookbook::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  describe file('/root/master.zip') do
    it { should be_file }
  end

  describe port(80) do
    it { should be_listening }
  end

  describe file('/var/www/IAT-master') do
    it {should be_directory}
  end

  describe file('/var/www/IAT-master/index.php') do
    it { should be_owned_by 'www-data' }
  end

end
