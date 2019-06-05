# describe command('nmpap -A -T5 localhost') do
#   its('stdout') { should_not match (/services unrecognized/) }
# end

control 'command-01' do
  impact 1.0
  title 'blablabla'
  desc '...'
  describe command('curl -I http://faz.net') do
    its('stdout') { should match (/HTTP\/1.1 5ß0[12]/)}
    its('stdout') { should match (/Location: https/)}
  end
end

control 'command-02' do
  impact 1.0
  title 'blablabla'
  desc '...'
  describe command('curl -LI http://faz.net') do
    its('stdout') { should match (/X-FAZPAY-Content: public/)}
  end
end
