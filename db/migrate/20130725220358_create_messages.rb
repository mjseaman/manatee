class CreateMessages < ActiveRecord::Migration
  def change
  	create_table :messages do |t|
    	t.string :sid, unique: true							#A 34 character string that uniquely identifies this resource.
			t.string :date_created									#The date that this resource was created, given in RFC 2822 format.
			t.string :date_updated									#The date that this resource was last updated, given in RFC 2822 format.
			t.string :date_sent											#The date that the SMS was sent. For incoming messages, this is the date that Twilio received the SMS. The date is given in RFC 2822 format.
			t.string :account_sid										#The unique id of the Account that sent this SMS message.
			t.string :from													#The phone number that initiated the message in E.164 format. For incoming messages, this will be the remote phone. For outgoing messages, this will be one of your Twilio phone numbers.
			t.string :to														#The phone number that received the message in E.164 format. For incoming messages, this will be one of your Twilio phone numbers. For outgoing messages, this will be the remote phone.
			t.string :body													#The text body of the SMS message. Up to 160 characters long.
			t.string :status												#The status of this SMS message. Either queued, sending, sent,failed, or received.
			t.string :direction											#The direction of this SMS message. inbound for incoming messages, outbound-api for messages initiated via the REST API, outbound-call for messages initiated during a call or outbound-reply for messages initiated in response to an incoming SMS.
			t.string :price													#The amount billed for the message, in the currency associated with the account.
			t.string :price_unit										#The currency in which Price is measured, in ISO 4127 format (e.g. usd, eur, jpy).
			t.string :api_version										#The version of the Twilio API used to process the SMS message.
			t.string :uri														#The URI for this resource, relative to https://api.twilio.com
			t.belongs_to :user
			t.timestamps
		end
  end
end
