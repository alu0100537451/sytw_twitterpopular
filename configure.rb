def my_twitter_client
  Twitter::REST::Client.new do |config|
    config.consumer_key        = 'TKpjF2r9gRklBHSAYP4oSa01X'
    config.consumer_secret     = 'Gnux0pO7kAcQh4RcfQn624A5S21Byc11Pauzqdo9SI6wJJRjKX'
    config.access_token        = '251145869-Cczvt4n3AeQ8KC7SZ3p5kGOObftzQI84oS0vaHbB'
    config.access_token_secret = 'p6TT4Rg0FowG2pW480P3DA6iADj0AmsL9YziNsmPEFprT'
  end
end
