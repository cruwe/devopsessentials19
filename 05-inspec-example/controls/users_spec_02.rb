control 'user-02' do
  impact 1.0
  title 'Check user home directories'
  desc 'Ensure that all home directories start with /home'
  describe 'iterate  passwd lines' do
    let!(:passwd_lines) { passwd.lines }
    it 'should only have home directories in /home' do
      passwd_lines.each do |line|
        line.split(':')[5].should match /var/
      end
    end
  end
end
