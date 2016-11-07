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
      content: ['Interesante pregunta, hermosa', 
        'Proba con este video',
        'Que te explica paso a paso como hacerlo'],
      video: 'https://www.youtube.com/embed/vbdwF5DCAUw'
    },
    'crear blog' => {
      content: ['Si queres crear un blog existe un programa que te puede ayudar.',
        'Se llama Bloger', 
        'Ahi debes completar el casillero del Titulo del blog',
        'El proximo casillero es la direccion a la cual se va a acceder',
        'Despues hacer clic en el boton crear que esta en la parte inferior izquierda'
      ],
      image: 'https://norfipc.com/img/otros2/crear-nuevo-blog-blogger-1.jpeg'
      },
    'crear juego' => {
      content: ['Me emociona que hagas preguntas de tecnologia',
        'En este enlace te muestra como hacerlo en sencillos pasos',
        ],
      video: 'https://www.youtube.com/embed/hgApDIMI4Z0'
    },
    'crear portal administrar cartera proyectos forma dinamica' => {
      content: ['Muy bueno que te intereses en este tema',
          'Te paso algunos links que te van a ser de mucha utilidad',
          'Proba, si te sirve: https://products.office.com/es-cl/project/enterprise-project-server',
          'Este tambien es interesante: https://juandomingofarnos.wordpress.com/2011/02/28/100-herramientas-de-la-web-2-0-para-el-aula/',
        ],
    },
    'herramientas programar' => {
      content: ['Te gusta este tema?, a mi tambien',
        'Las herramientas mas conocidas y necesarias son los IDE',
        'Las partes que todos tienen son:',
        'Navegador de proyecto: muestra las carpetas',
        'Barra de herramientas: contiene herramientas para programadores',
        'Te muestro una imagen con las partes'],
      image: 'https://www.panasonic-electric-works.com/pew/es/images/plc/gr_x634_es_fpwinpro.jpg'
    },
    'hacen pruebas testing' => {
      content: ['De la curiosidad nacen grandes ideas, asi que adelante!!',
        'Tengo esta imagen que te ayudara en tus dudas'],
      image: 'http://image.slidesharecdn.com/pruebasunitarias-110921232512-phpapp02/95/pruebas-unitarias-3-728.jpg?cb=1316648099'
    },
    'memoria ram' => {
      content: ['Muy lindo tema',
        'Es el corazon de la computadora',
        'Te muestro una imagen de como es y un resumen de ella',
        ],
      image: 'http://www.definicionabc.com/wp-content/uploads/memoria-ram.jpg'
    },
    'compuesta computadora' => {
      content: ['Muy interesante',
      'Te explicare y mostrare los componentes',
      ],
      image:'http://2.bp.blogspot.com/-PXnns6VqGTE/Tcq7i9G8L8I/AAAAAAAAACA/V-cI-kggLU4/s1600/urru+careee.jpg'
    },
    'crear robot' => {
      content: ['Es un tema muy interesante',
        'Hay varios tipos de robot',
        'Te dare un link para hacer uno en simples pasos: http://es.wikihow.com/construir-un-robot-de-control-remoto'
      ],
    },

    'crear aplicacion celular' => {
      content: ['Sabias que este tema se llama aplicacion mobile?, interesante, no?',
      'Aca te muestro un video explicativo',
      ],
      video: 'https://www.youtube.com/embed/d8j-P9QdSi4'
    },

    'crear carrito electronico' => {
      content: ['Muy lindo e interesante',
        'Te muestro varios links que te pueden ayudar',
        'Por ejemplo: https://www.uno-de-piera.com/carrito-de-compras-con-php/',
        'https://www.godaddy.com/es/ecommerce/shopping-cart.aspx',
      ]
    },
    'sirve office' => {
      content: ['Es una serie de herramientas destinadas a realizar todas las funciones que abarcan:', 
      'Procesador de texto',
      'Procesador de tablas',
      'Entre otras funcionalidades, aqui te muestro todas las aplicaciones que contiene'
      ],
      image:'data:image/png;base64,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'
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
      message.image = answer[:image] unless answer[:image].nil?
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
      'crear' => ['hacer', 'herramientas', 'herramienta'],
      'portal' => ['pagina','aplicacion']
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