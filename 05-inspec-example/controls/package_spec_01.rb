# describe command('nmpap -A -T5 localhost') do
#   its('stdout') { should_not match (/services unrecognized/) }
# end

control 'package-01' do
  impact 1.0
  title 'THE ONLY EDITOR MUST BE INSTALLED'
  desc '...'
  describe package('emacs25-bin-common') do
    it {should be_installed }
  end

end
