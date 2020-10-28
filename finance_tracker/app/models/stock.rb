class Stock < ApplicationRecord
    def self.new_lookup(ticker_symbol)
        client = IEX::Api::Client.new(
            # publishable_token: 'Tpk_ad837ee37b45409d845fdae8a3a207cb',
            # secret_token: 'Tsk_6ad7bf9a45ad42e287afa468ec3ae000',
            publishable_token:Rails.application.credentials.iex_client[:sandbox_api_key],
            secret_token:Rails.application.credentials.iex_client[:secret_access_key],
            endpoint: 'https://sandbox.iexapis.com/v1'
          )
    #client.price(ticker_symbol)
    #make stock object , the value of each field find in iex documentation 
    
      begin
         new(ticker:ticker_symbol ,name:client.company(ticker_symbol).company_name  ,last_price:client.price(ticker_symbol))
     rescue => exception 
         return nil
      end
    end
end
