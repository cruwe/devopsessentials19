RSpec::Matchers.define :have_homedir_matching do |valid_home_regex|
  non_compliant_a = []

  match do |passwd_lines|
    non_compliant_a = passwd_lines.select do |line|
      homedir = line.split(':')[5]
      matching = valid_home_regex.select { |regex| homedir =~ regex}
      matching.empty?
    end.map do |line|
      user, *_rest, dir, _shell = line.split(':')
      {user => dir}
    end
    non_compliant_a.empty?
  end

  failure_message do
    error_s = RSpec::Matchers::EnglishPhrasing.list(non_compliant_a)
    "User/Directory combos #{error_s} have non-compliant home director[y/ies]."
  end

  match_when_negated do # |actual_obj|
    false
  end

  failure_message_when_negated do
    "There is no sensible semantic for the not_all_of case. Failing.\n"
  end
end
