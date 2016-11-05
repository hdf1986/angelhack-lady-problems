class Marie
  GREETINGS = [
    'Hola! Como estas?', 
    'Hola! Como andas?'
  ]
  INITIAL_QUESTIONS = [
    'Que estas necesitando?',
    'Que queres aprender?',
    'Tenes alguna duda?'
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
  
  HAPPY_EMOJIS = [
    '😁',
    '😃',
    '😊'
  ]

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

  YOU_ARE_BEATIFUL = '😍'

  def self.talk conversation
    if MessageCorrector.check(conversation.lady_messages.last.content, 'hola')
      Message.create(
        type: :marie,
        content: "#{GREETINGS.sample} #{HAPPY_EMOJIS.sample}",
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
      message = Message.new(
        type: :marie,
        content: answer[:content],
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
    def self.is_question? msg
      msg = process_question msg
      ANSWERS.key?(msg)
    end

    def self.process_question msg
      msg = msg.downcase
      msg = remove_special(msg)
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