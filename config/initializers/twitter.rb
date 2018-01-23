class TwitterApi
  def self.our_public_tweets
    client.user_timeline(@current_user, count: 2, exclude_replies: true, include_rts: true)
  end

  def self.client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = "ptmkRX5UgWQ6N1tyaWVyuSpbt"
      config.consumer_secret     = "0yr9iJHxl2rOVJJhDvOHoPRW5i7fCIueo3uhiWh01ADw36ShI6"
      config.access_token        = "379670699-niKcWhvcLkcJrsfAcAZYSCJlgAGZq8m6pfHABtjI"
      config.access_token_secret = "z9eddjisA7qRinHhELSPthT1u0VIovmLOH3OwbZTz6v01"
    end
  end
end
