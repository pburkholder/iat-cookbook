#
# Cookbook Name:: iat-cookbook
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'iat-cookbook::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '14.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs unzip' do
      expect(chef_run).to install_package('unzip')
    end

    it 'fetches master.zip' do
      expect(chef_run).to create_remote_file('/root/master.zip')
        .with_source('https://github.com/winteram/IAT/archive/master.zip')
    end

    it 'installs php module' do
      expect(chef_run).to create_httpd_module('php5')
    end

    it 'runs http service' do
      expect(chef_run).to create_httpd_service('default')
        .with_mpm('prefork')
    end
  end
end
