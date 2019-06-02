RSpec::Matchers.define :unwrapped do

  unwrap = lambda do |wrapped|
    case wrapped
    when Array
      throw 'unclear unwrapped semantics' unless wrapped.size == 1
      unwrap.call(wrapped.first)
    when Hash
      throw 'unclear unwrapped semantics' unless wrapped.size == 1
      unwrap.call(wrapped.values)
    else
      wrapped
    end
  end

  match do |config|
    unwrap.call(config)
  end
end

RSpec::Matchers.define :have_later_version_than do |comparable|
  match do |version|
    vers, _internal = version.split(/~/)
    Gem::Version.new(vers) > Gem::Version.new(comparable)
  end
end
