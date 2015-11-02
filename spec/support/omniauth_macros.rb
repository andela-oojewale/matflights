module OmniauthMacros
  def mock_auth_hash
    # The mock_auth configuration allows you to set per-provider (or default)
    # authentication hashes to return during integration testing.
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
          provider: 'google_oauth2',
          uid: '123456789',
          info: {
              name: 'James Dummy',
              email: 'johndummy@example.com',
              first_name: 'James',
              last_name: 'Dummy',
              image: 'https://lh3.googleusercontent.com/url/photo.jpg'
          },
          credentials: {
              token: 'token',
              refresh_token: 'another_token',
              expires_at: 1354920555,
              expires: true
          },
          extra: {
              raw_info: {
                  sub: '123456789',
                  email: 'dummy@domain.example.com',
                  email_verified: true,
                  name: 'James Dummy',
                  given_name: 'James',
                  family_name: 'Dummy',
                  profile: 'https://plus.google.com/123456789',
                  picture: 'https://lh3.googleusercontent.com/url/photo.jpg',
                  gender: 'male',
                  birthday: '1968-06-25',
                  locale: 'en',
                  hd: 'example.com'
              }
          }
      })
  end
end