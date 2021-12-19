class CallbackController < ApplicationController
  protect_from_forgery with: :null_session
  require 'dino'

  def index
    if params["hub.verify_token"] == "asd"
      render json: params["hub.challenge"]
    end
  end

  def received_data
    therequest = request.body.read
    data = JSON.parse(therequest)
    parse_data(data)
    render "received_data"
  end

  def light_up_led text
    board = Dino::Board.new(Dino::TxRx.new)
    led = Dino::Components::Led.new(pin: 13, board: board)
    
    if text.include? "gay"
      led.send(:on)
      sleep 0.5
      led.send(:off)
      sleep 0.5
      led.send(:on)
      sleep 0.5
      led.send(:off)
    elsif text.include? "no"
      led.send(:on)
      sleep 0.5
      led.send(:off)
    else
      led.send(:on)
      sleep 0.5
      led.send(:off)
    end
  end

  def parse_data(data)
    enteries = data["entry"]
    enteries.each do |entry|
      entry["messaging"].each do |messaging|
        sender = messaging["sender"]["id"]
        text = messaging["message"]["text"]
        Rails.logger.info("+++++++++++++++++++++++++")
        Rails.logger.info(messaging)
        Rails.logger.info("+++++++++++++++++++++++++")
        # analysis(sender, text)
        myjson = {"recipient": {"id": "#{sender}"},"message": {"text": "#{text}\n\nTime is: #{Time.now.strftime('%I:%M:%S %p')}"}}
        puts HTTP.post(url, json: myjson)

        light_up_led(text)
      end
    end
  end

  def analysis(sender, text)
    message = FbMessage.where(:received => text).first
    if message
      reply = message.reply
    else
      reply = "Sorry not found"
    end
    send_message(sender,reply)
  end

  def send_message(sender, text)
    myjson = {"recipient": {"id": "#{sender}"},"message": {"text": "#{text}"}}
    puts HTTP.post(url, json: myjson)
  end

  def url
    "https://graph.facebook.com/v12.0/me/messages?access_token=x"
  end
end
