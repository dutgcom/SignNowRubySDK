require 'json'
require 'rest-client'
require 'signnow'

module SN
  class Template
    
    # Creates document from a template
    #
    # @param [Hash] params Parameters needed to create a signing link
    # @option params [String] :id the ID of the template in the signing session
    # @option params [String] :access_token the access token of the owner of the {Document}
    # @return [Hash] new document

    def self.copy(params)
      raise ArgumentError, 'Missing options[:access_token]' if params[:access_token].nil?
      raise ArgumentError, 'Missing options[:id]' if params[:id].nil?

      headers = { accept: :json, authorization: "Bearer #{params[:access_token]}" }
      body_params = {}

      if params[:document_name]
        body_params[:document_name] = params[:document_name]
      end
      
      begin
        response = RestClient.post("#{SN.Settings.base_url}/template/#{params[:id]}/copy", body_params, headers)
        puts response
        JSON.parse(response.body)
      rescue Exception => e
        puts e.inspect
        nil
      end
    end
  end
end

