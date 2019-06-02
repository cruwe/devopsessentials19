# copyright: 2018, Christopher J. Ruwe

title 'Check webserver configuration'

control 'nginx-config-proc?' do
  impact 0.7
  title 'Are nginx webserver processes configured correctly?'
  desc 'An optional description...'

  describe 'nginx worker config properties' do
    subject { nginx_conf.params }


    its(['worker_processes']) { should unwrapped be >= 1 }
    its(['events']) { should unwrapped be >= 512 }

  end
end
