control 'user-01' do
  impact 1.0
  title 'Check user home directories'
  desc 'Ensure that all home directories start with /home'
  describe 'iterate  passwd lines' do
    subject! { passwd.lines }
    it 'should only have home directories in /home' do
      subject.each { |line| line.split(':')[5].should match /\/home\/.*/ }
    end
  end
end
