class Marie
  GREETINGS = [
    'Hola! Como estas?', 
    'Hola! Como andas?'
  ]
  HAPPY_EMOJIS = [
    '😁',
    '😃',
    '😊'
  ]
  INITIAL_QUESTIONS = [
    'Que estas necesitando?',
    'Que queres aprender?',
    'Tenes alguna duda?',
    'Si queres escribime tus preguntas, puedo ayudarte' + HAPPY_EMOJIS.sample
  ]
  ANSWERS = {
    'crear portal web' => {
      content: 'Sos hermosa'
    },
    'crear blog' => {
      content: 'Anda a wordpress!',
      video: 'https://www.youtube.com/watch?v=jUAB_XosSt8'
    },
    'hacer juego' => {
      content: 'Ehm preguntale a tu corazon',
    },
    'crear portal administrar cartera proyectos forma dinamica' => {
      content: 'Preguntale a vanessa :)',
    },
    'herramientas programar' => {
      content: 'Sublime!',
    },
    'hacen pruebas testing' => {
      content: 'Cucumber!',
    },
    'herramientas hacer pruebas testing' => {
      content: 'Mi mama me mima',
    },
    'memoria ram' => {
      content: 'Mi mama me mima',
    },
    'compuesta computadora' => {
      content: 'Mi mama me mima',
    },
    'crear robot' => {
      content: 'Mi mama me mima',
    },
    'crear aplicacion celular' => {
      content: 'Mi mama me mima',
    },
    'crear carrito electronico' => {
      content: 'Mi mama me mima',
    },
    'sirve office' => {
      content: 'Mi mama me mima',
    },
    'word' => {
      content: 'Mi mama me mima',
    },
    'sirve word' => {
      content: 'Mi mama me mima',
    },
  }
  

  DIDNT_UNDERSTAND = [
    'No te entendi, me lo repetis?',
    'No te entendi, me lo volverias a preguntar?'
  ]

  SAD_EMOJIS = [
    '😢'
  ]

  GOODBYES = [
    'Chau hermosa',
    'Chau linda',
    'Espero te haya servido',
    'Espero te haya sido de utilidad',
    'Espero te haya sido de utilidad, cualquier cosa decime ' + HAPPY_EMOJIS.sample
  ]

  LISTENING = [
    'Te escucho ' + HAPPY_EMOJIS.sample,
    'Decime ' + HAPPY_EMOJIS.sample
  ]

  YOU_ARE_BEATIFUL = '😍'

  UNKNOWN_LANG = {
    'german' => 'Sprichst du Deutsch? Versuch  diesen link',
    'english' => 'Do you speak English? Try with this link'
  }
  def self.welcome conversation
    Message.create(
      type: :marie,
      content: "#{GREETINGS.sample} #{HAPPY_EMOJIS.sample}",
      conversation: conversation,
      created_at: (Time.now + 1.seconds)
    )
    Message.create(
      type: :marie,
      content: INITIAL_QUESTIONS.sample,
      conversation: conversation,
      created_at: (Time.now + 2.seconds)
    )
  end

  def self.talk conversation
    lang = detect_lang(conversation.lady_messages.last.content)
    if lang != 'unknown' && lang != 'spanish'
      Message.create(
        type: :marie,
        content: UNKNOWN_LANG[lang],
        conversation: conversation
      )
    elsif MessageCorrector.check(conversation.lady_messages.last.content, 'hola')
      Message.create(
        type: :marie,
        content: "#{LISTENING.sample} #{HAPPY_EMOJIS.sample}",
        conversation: conversation
      )
      Message.create(
        type: :marie,
        content: INITIAL_QUESTIONS.sample,
        conversation: conversation
      )
    elsif MessageCorrector.is_question?(conversation.lady_messages.last.content)
      answer = ANSWERS[
        MessageCorrector.process_question(conversation.lady_messages.last.content)
      ]
      delay = 1
      [*answer[:content]].each do |message|
        message = Message.new(
          type: :marie,
          content: message,
          conversation: conversation,
          created_at: (Time.now + delay.seconds)
        )
        message.save
        delay+=1
      end
      message = Message.new(
          type: :marie,
          content: 'non',
          conversation: conversation
        )
      message.video = answer[:video] unless answer[:video].nil?
      message.save
    elsif MessageCorrector.check(conversation.lady_messages.last.content, 'chau')
      Message.create(
        type: :marie,
        content: "#{GOODBYES.sample} #{YOU_ARE_BEATIFUL}",
        conversation: conversation
      )
    else
      Message.create(
        type: :marie,
        content: "#{DIDNT_UNDERSTAND.sample} #{SAD_EMOJIS.sample}",
        conversation: conversation
      )
    end
  end

  def self.detect_lang msg
    MessageTranslator.detect_lang(msg)
  end

  class MessageTranslator
    def self.detect_lang msg
      if count_words(msg) >= 5
        require "unirest"
        require "havenondemand"
        client = HODClient.new('271302e4-4d4d-43ce-8990-699c369e10d5', 'v1')
        r = client.post('identifylanguage', {:text => msg})
        r.response.body['language']
      else
        'unknown'
      end
    end

    def self.count_words msg
      msg.split(' ').length
    end
  end
  class MessageCorrector
    USELESS_WORDS = [
      'como',
      'que',
      'puedo',
      'me',
      'un',
      'una',
      'qué',
      'de',
      'se',
      'el',
      'la',
      'para',
      'usan',
      'usa',
      'usar',
      'permita',
      'quiero',
      'existen',
      'existe',
      'gracias',
    ]

    SINONIMS = {
      'crear' => ['hacer']
    }

    def self.is_question? msg
      msg = process_question msg
      ANSWERS.key?(msg)
    end

    def self.process_question msg
      msg = msg.downcase
      msg = remove_special(msg)
      msg = replace_sinonims(msg)
    end

    def self.replace_sinonims msg
      SINONIMS.each do |key,sinonims|
        sinonims.each do |sinonim|
          msg = msg.gsub(sinonim, key)
        end
      end
      msg
    end

    def self.remove_special msg
      msg = remove_question(msg)
      msg = remove_exclamation(msg)
      msg = remove_commas(msg)
      msg = remove_useless_words(msg)
    end

    def self.check message1, message2
      remove_useless_words(proccess_text(message1.to_s.downcase)) == proccess_text(message2.to_s.downcase)
    end

    def self.proccess_text msg
      remove_commas(remove_exclamation(msg.strip))
    end

    def self.remove_commas msg
      msg.gsub(',', '')
    end

    def self.remove_exclamation msg
      msg.gsub('!', '')
    end

    def self.remove_useless_words msg
      USELESS_WORDS.inject(msg) do |acumulated, useless_word|
        acumulated.gsub(" #{useless_word}", '')
        acumulated.gsub("#{useless_word} ", '')
      end
    end

    def self.remove_question msg
      msg.gsub('?', '')
    end
  end
end