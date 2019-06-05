# describe command('nmpap -A -T5 localhost') do
#   its('stdout') { should_not match (/services unrecognized/) }
# end

control 'http-01' do
  impact 1.0
  title 'blablabla'
  desc '...'

  describe http(
               'http://faz.net',
               open_timeout: 60,
               read_timeout: 60,
               ssl_verify: true,
               max_redirects: 3
           ) do
    its('status') { should eq 200 }
    its('body') { should match (/Offenbacher Allgemeine Zeitung/) }
    its('headers.Connection') { should eq 'keep-alive' }
    its('headers.Cache-Control') { should match (/public/) }

  end

end
