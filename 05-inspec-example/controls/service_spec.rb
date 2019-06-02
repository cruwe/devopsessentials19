# copyright: 2018, Christopher J. Ruwe

title 'Check webserver service'

control 'nginx-service?' do
  impact 1
  title 'Is the webserver service enabled and running?'
  desc 'An optional description...'

  describe service('nginx') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end

end

control 'nginx-service-aux?' do
  impact 0.5
  title 'Is the webserver service correctly registered with the OS?'
  desc 'An optional description...'

  describe 'service is registered per pid-file' do
    subject { nginx_conf.params }

    its(['pid']) { should unwrapped be eq '/var/run/nginx.pid' }

  end
end
