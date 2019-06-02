# copyright: 2018, Christopher J. Ruwe

title 'Check webserver binaries'

control 'nginx-package?' do
  impact 0.7
  title 'Does nginx webserver version from packages have latest patches?'
  desc 'An optional description...'

  describe package('nginx') do
    it { should be_installed }

    its('version') { should have_later_version_than '1.15.5' }
  end
end
