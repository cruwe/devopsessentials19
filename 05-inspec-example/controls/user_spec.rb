# copyright: 2018, Christopher J. Ruwe

title 'Check webserver user'

control 'nginx-user?' do
  impact 0.7
  title 'Does the user for the webserver exist?'
  desc 'An optional description...'

  describe user('www-data') do
    it { should exist }
    its('uid') { should eq 33 }
    its('gid') { should eq 33 }
    its('group') { should eq 'www-data' }
    its('groups') { should eq ['www-data'] }
    its('home') { should eq '/var/www' }
    its('shell') { should eq '/usr/sbin/nologin' }
  end
end
