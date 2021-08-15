class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  #confirm newからお問い合わせを受け取り、送信でcreateを実行
  def confirm
    @contact = Contact.new(contact_params)
    if @contact.invalid?
      render :new
    end
  end
  
  #back 入力に誤りがあった場合、入力内容を保持したままブラウザバックができる
  def back
    @contact = Contact.new(contact_params)
    render :new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      redirect_to done_path
    else
      render :new
    end
  end
  
  #done 送信完了画面の表示
  def done
  end

  private

  def contact_params
    params.require(:contact)
          .permit(:email,
                  :name,
                  :phone_number,
                  :subject,
                  :message
                 )
  end
end
