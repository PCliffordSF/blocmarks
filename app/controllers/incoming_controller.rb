class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    # Take a look at these in your server logs
    # to get a sense of what you're dealing with.
    puts '0000000000000000000000000000000000000000000000000000000000'

    puts params.to_yaml

    # You put the message-splitting and business
    # magic here.
      @user = User.where("email = ?", params["sender"])
      @topic = Topic.where("title = ?", params["subject"])
      @Bookmark_url =  params["body-plain"]
      
      if @user.nil?
        @user = User.create(email: params["sender"], password: params["sender"])
      end
      puts 'useruseruseruseruseruseruseruseruseruseruseruser'
      puts @user.email
      
      
      
      if @topic.nil?
        @topic = Topic.create(title: params["subject"], user_id:  @user.id)
      end
      
      puts 'topictopictopictopictopictopictopictopictopictopictopictopictopictopictopic'
      puts @topic.title
      
      
      @bookmark = Bookmark.create(url: @bookmark_url, topic_id: @topic.id, user_id: @user.id)
      puts 'bookmarkbookmarkbookmarkbookmarkbookmarkbookmarkbookmarkbookmarkbookmarkbookmark'
      puts @bookmark
  
    # Assuming all went well.
    head 200
  end
  
  test_params = {
    "recipient"=>"postmaster@appb04370d4582143ba9ed0ecccb5c4178b.mailgun.org", 
    "sender"=>"paulclifford2570@gmail.com", 
    "subject"=>"TOPIC TITILE", 
    "from"=>"Paul Clifford <paulclifford2570@gmail.com>", 
    "X-Mailgun-Incoming"=>"Yes", 
    "X-Envelope-From"=>"<paulclifford2570@gmail.com>", 
    "Received"=>"by 10.12.181.159 with HTTP; Fri, 21 Jul 2017 14:54:34 -0700 (PDT)", 
    "Dkim-Signature"=>"v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com; s=20161025;        h=mime-version:from:date:message-id:subject:to;        bh=srFuAbQ5zl1n42/b6q+O8w7AaZvWLIN421j8nPKVrcw=;        b=dvG4yaNZ5i+NW+GdIChR3erWBinKXCeoI8IEb2znhLggkZbjFmVPrDEVNTMSQiqj/F         nS+d8ETu0hWZ8wLFGLD1ostYvQKtrQQ90RUIXp+QkZKiyW2OM3IWnSwSnxA2AzTdkpXk         J5gH56R5HA+3q6g51hdhLFjTfE+9UzfStQDGEo+n2zhUffAiZDPHGgwdeNkmlkEx1adW         Yq0kbM9+LwgzEIR7uw3u6SSWwMcq8pCHOGnkP+qQPVda7YLQgpe+WiWs5iJynyxZbu+7         8serhfNwy9i44izh9OpDUcim9omi6HPFVdzr657+5aiFAj9yDPc5HVuCazFdufvlfX/x         lXfg==", 
    "X-Google-Dkim-Signature"=>"v=1; a=rsa-sha256; c=relaxed/relaxed;        d=1e100.net; s=20161025;        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;        bh=srFuAbQ5zl1n42/b6q+O8w7AaZvWLIN421j8nPKVrcw=;        b=iC8tpGZwI6KG4Jbb6Sp2doPsZX51Rp9qKiVuyP35pPQYMHSan1C73j/mEA8sz65sG6         WZH8Cy/wkXfAJI5tCeeWjzzoOVC/ob5uf4RWLOU2xPRhC7nogF/+PksP56c0QUnhgf3F         CQI4MBWizOXMqSk+j+1WzQVEZrtdGmvCgbeyI3txf5ohe8ulBXmggFKCQJ6AuX/oZ1XT         bfaI9IhgNg1Ei6uATQeWDEt7Rmp22aCArZui2TDFhJKFB1Wj59h7V5Of5G78oHGLUttL         c5Vc/6jR8Wt1kENhC4GbS92SKUD3ZaNd1YjCdwH6kD6dAARPhAYOOd8SycUECZJmqHBF         irlA==", 
    "X-Gm-Message-State"=>"AIVw113oFEQCYhsSFXhdGSHsBtLN9KPpOX9AQ9imGDkBXIM1YM4xIDIf\tOLVEoqOHKaOi4wSaAIPmxhxv+44W2Q==", 
    "X-Received"=>"by 10.200.44.13 with SMTP id d13mr12560920qta.182.1500674075103; Fri, 21 Jul 2017 14:54:35 -0700 (PDT)", 
    "Mime-Version"=>"1.0", 
    "From"=>"Paul Clifford <paulclifford2570@gmail.com>", 
    "Date"=>"Fri, 21 Jul 2017 14:54:34 -0700", 
    "Message-Id"=>"<CADjADOJ_vmH-PBwobbV9MxdqNSMoX2gyHJu3LySWML9W0+tNBQ@mail.gmail.com>", "Subject"=>"TOPIC TITILE", 
    "To"=>"postmaster@appb04370d4582143ba9ed0ecccb5c4178b.mailgun.org", 
    "Content-Type"=>"multipart/alternative; boundary=\"001a11419b482b94e70554dae952\"", 
    "message-headers"=>"[[\"X-Mailgun-Incoming\", \"Yes\"], [\"X-Envelope-From\", \"<paulclifford2570@gmail.com>\"], [\"Received\", \"from mail-qt0-f176.google.com (mail-qt0-f176.google.com [209.85.216.176]) by mxa.mailgun.org with ESMTP id 5972781c.7fcbb04dadb0-smtp-in-n02; Fri, 21 Jul 2017 21:54:36 -0000 (UTC)\"], [\"Received\", \"by mail-qt0-f176.google.com with SMTP id r14so13864985qte.4        for <postmaster@appb04370d4582143ba9ed0ecccb5c4178b.mailgun.org>; Fri, 21 Jul 2017 14:54:35 -0700 (PDT)\"], [\"Dkim-Signature\", \"v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com; s=20161025;        h=mime-version:from:date:message-id:subject:to;        bh=srFuAbQ5zl1n42/b6q+O8w7AaZvWLIN421j8nPKVrcw=;        b=dvG4yaNZ5i+NW+GdIChR3erWBinKXCeoI8IEb2znhLggkZbjFmVPrDEVNTMSQiqj/F         nS+d8ETu0hWZ8wLFGLD1ostYvQKtrQQ90RUIXp+QkZKiyW2OM3IWnSwSnxA2AzTdkpXk         J5gH56R5HA+3q6g51hdhLFjTfE+9UzfStQDGEo+n2zhUffAiZDPHGgwdeNkmlkEx1adW         Yq0kbM9+LwgzEIR7uw3u6SSWwMcq8pCHOGnkP+qQPVda7YLQgpe+WiWs5iJynyxZbu+7         8serhfNwy9i44izh9OpDUcim9omi6HPFVdzr657+5aiFAj9yDPc5HVuCazFdufvlfX/x         lXfg==\"], [\"X-Google-Dkim-Signature\", \"v=1; a=rsa-sha256; c=relaxed/relaxed;        d=1e100.net; s=20161025;        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;        bh=srFuAbQ5zl1n42/b6q+O8w7AaZvWLIN421j8nPKVrcw=;        b=iC8tpGZwI6KG4Jbb6Sp2doPsZX51Rp9qKiVuyP35pPQYMHSan1C73j/mEA8sz65sG6         WZH8Cy/wkXfAJI5tCeeW zzoOVC/ob5uf4RWLOU2xPRhC7nogF/+PksP56c0QUnhgf3F         CQI4MBWizOXMqSk+j+1WzQVEZrtdGmvCgbeyI3txf5ohe8ulBXmggFKCQJ6AuX/oZ1XT         bfaI9IhgNg1Ei6uATQeWDEt7Rmp22aCArZui2TDFhJKFB1Wj59h7V5Of5G78oHGLUttL         c5Vc/6jR8Wt1kENhC4GbS92SKUD3ZaNd1YjCdwH6kD6dAARPhAYOOd8SycUECZJmqHBF         irlA==\"], [\"X-Gm-Message-State\", \"AIVw113oFEQCYhsSFXhdGSHsBtLN9KPpOX9AQ9imGDkBXIM1YM4xIDIf\\tOLVEoqOHKaOi4wSaAIPmxhxv+44W2Q==\"], [\"X-Received\", \"by 10.200.44.13 with SMTP id d13mr12560920qta.182.1500674075103; Fri, 21 Jul 2017 14:54:35 -0700 (PDT)\"], [\"Mime-Version\", \"1.0\"], [\"Received\", \"by 10.12.181.159 with HTTP; Fri, 21 Jul 2017 14:54:34 -0700 (PDT)\"], [\"From\", \"Paul Clifford <paulclifford2570@gmail.com>\"], [\"Date\", \"Fri, 21 Jul 2017 14:54:34 -0700\"], [\"Message-Id\", \"<CADjADOJ_vmH-PBwobbV9MxdqNSMoX2gyHJu3LySWML9W0+tNBQ@mail.gmail.com>\"], [\"Subject\", \"TOPIC TITILE\"], [\"To\", \"postmaster@appb04370d4582143ba9ed0ecccb5c4178b.mailgun.org\"], [\"Content-Type\", \"multipart/alternative; boundary=\\\"001a11419b482b94e70554dae952\\\"\"]]", 
    "timestamp"=>"1500674077", 
    "token"=>"c1ac4a24e6bceac69522d76b50b594879def40548b2d0ecd43", 
    "signature"=>"9e445da9230deb188b7a84d44d4f864bded425df04795b63de4dbd56aaee879b", 
    "body-plain"=>"Bookmark URL\r\n", 
    "body-html"=>"<div dir=\"ltr\">Bookmark URL</div>\r\n", 
    "stripped-html"=>"<div dir=\"ltr\">Bookmark URL</div>\n", 
    "stripped-text"=>"Bookmark URL",
    "stripped-signature"=>"", 
    "controller"=>"incoming", 
    "action"=>"create"
  }
end