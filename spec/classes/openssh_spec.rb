require 'spec_helper'

describe 'openssh' do

  context 'on unsupported distributions' do
    let(:facts) {{ :osfamily => 'Unsupported' }}

    it 'we fail' do
      expect { subject }.to raise_error(/Unsupported platform: Unsupported/)
    end
  end

  ['Archlinux'].each do |distro|
    context "on #{distro}" do
      let(:facts) {{
          :osfamily => distro,
          :ipaddresses => '192.10.50.1',
          :fqdn => 'test.example.com',
          :hostname => 'test',
        }}

      it { should contain_class('openssh::params') }
      it { should contain_class('openssh::install') }
      it { should contain_class('openssh::config') }
      it { should contain_class('openssh::service') }
      it { should contain_class('openssh::hostkeys') }
      it { should contain_class('openssh::knownhosts') }

      ##
      ## openssh server config file
      ##
      describe 'server config file with default params' do
        it { should contain_file('/etc/openssh/sshd_config')}
      end
      ##
      ## openssh server client file
      ##
      describe 'server config file with default params' do
        it { should contain_file('/etc/openssh/ssh_config')}
      end

      ##
      ## openssh service
      ##
      describe 'openssh service with default params' do
        it { should contain_service('sshd').with(
          'ensure'     => 'running',
          'enable'     => 'true',
          'hasstatus'  => 'true',
          'hasrestart' => 'true'
          )}
      end
      ##
      ## openssh::install
      ##
      it 'installs the openssh package' do
        should contain_package('openssh').with(
        'ensure'   => 'present',
        'name'     => 'openssh'
        )
      end
    end
  end
end

