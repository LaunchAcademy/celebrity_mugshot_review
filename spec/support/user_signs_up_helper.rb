module UserSignsUpHelper
  def sign_up_as(user)
    visit new_user_registration_path
    fill_in "First name",   with: user.first_name
    fill_in "Last name",    with: user.last_name
    fill_in 'Email',        with: user.email
    fill_in 'Password',     with: user.password
    click_on "Sign up"
  end
end
