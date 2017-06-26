module Ahoy
  class CookieJar
    def initialize(cookies)
      @cookies = cookies
    end

    def set_cookie(name, value, duration = nil, use_domain = true)
      # safety net
      return unless Ahoy.cookies

      cookie = {
        value: value
      }
      cookie[:expires] = duration.from_now if duration
      domain = Ahoy.cookie_domain
      cookie[:domain] = domain if domain && use_domain
      cookies[name] = cookie
    end

    protected

    attr_reader :cookies
  end
end
