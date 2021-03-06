module SignHelper

  def ellobor_link
    "https://#{Secrets.app_url}"
  end

  def verification_link(lookup_token)
    "https://#{Secrets.app_url}#{verify_signatory_path(lookup_token)}"
  end

  def ello_link
    "https://#{Secrets.parent_url}"
  end

  def ios_app_link
    Secrets.ios_app_link
  end

  def unsubscribe_link(lookup_token)
    "https://#{Secrets.app_url}#{unsubscribe_email_path(lookup_token)}"
  end

end
