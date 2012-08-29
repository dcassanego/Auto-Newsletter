AutoNewsletter::Application.config.middleware.use ExceptionNotifier,
  :email_prefix => "[Exception] ",
  :sender_address => %{"Auto Newsletter" <mitsloannetimpactmarketing@gmail.com>},
  :exception_recipients => %w{dante.cassanego@gmail.com}