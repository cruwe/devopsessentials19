control 'user-03' do
  impact 1.0
  title 'Check user home directories'
  desc 'Ensure that all home directories start with /home'
  describe 'all users in /etc/passwd should have homedir matching' do
    subject! { passwd.lines }
    it { should have_homedir_matching [%r{/home/.*}, %r{/var/lib/.*}] }
  end
end
