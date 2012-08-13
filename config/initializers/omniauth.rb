Rails.application.config.middleware.use OmniAuth::Builder do
  provider 'dailycred', "fb97a38f-2e09-4edc-a47e-ccd73ed52257", "b15f65c2-22f9-4ccc-bfd4-6f80cc7559a3-b3961bc1-0ad3-4608-9f45-4ad52a145b39", {:client_options => {:ssl => {:ca_file => '/opt/local/share/curl/curl-ca-bundle.crt'}}}
end