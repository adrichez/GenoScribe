// responses.js
export default [
  // SALUDOS
  {
    pattern: "hola|buenas|buen dia|buenas tardes|buenas noches",
    response:
      "¡Hola! 😊 Soy tu asistente virtual RAG. Puedo ayudarte a consultar informacion disponible en este informe y ofrecer informacion relacionada. Ten en cuenta que estoy en fase beta y mis respuestas pueden no ser totalmente precisas.",
  },
  {
    pattern:
      "que tal|que tal|como estas|como estas|como va|como va|como te va|como te va",
    response:
      "¡Todo bien! Gracias por preguntar. Recuerda que soy un asistente en proceso de mejora, y mi funcion principal es ayudarte con la informacion de tus informes.",
  },

  // DESPEDIDAS
  {
    pattern: "adios|hasta luego|nos vemos|chao",
    response:
      "¡Hasta luego! 👋 Espero haberte ayudado. Recuerda que aun estoy en beta, asi que siempre puedes verificar la informacion en los informes originales.",
  },
  {
    pattern: "gracias|muchas gracias|te lo agradezco",
    response:
      "¡De nada! 😊 Estoy aqui para ayudarte con los informes, aunque mis respuestas todavia estan en fase de mejora.",
  },

  // FUNCIONALIDAD DEL ASISTENTE
  {
    pattern: "en que puedes ayudarme|que puedes hacer|que funciones tienes",
    response:
      "Puedo ayudarte a responder preguntas basadas en los informes que me proporcionaste, generar resumenes y buscar informacion especifica dentro de ellos. Tambien puedo ofrecer informacion relacionada, aunque mis respuestas pueden no ser siempre exactas.",
  },
  {
    pattern: "como funciona|como trabajas|como me puedes ayudar",
    response:
      "Analizo tus informes usando busqueda semantica y tecnicas de resumen para ofrecer respuestas. Recuerda que estoy en beta y algunas respuestas pueden no ser totalmente precisas.",
  },
  {
    pattern:
      "que tipos de informes puedes leer|que informacion puedes procesar",
    response:
      "Puedo procesar fragmentos de texto de tus informes, incluyendo preguntas y respuestas, analisis y revisiones de metadatos. Tambien puedo aportar informacion externa relacionada, pero revisa siempre la fuente original.",
  },

  // ADRIÁN SÁNCHEZ CARRIÓN
  {
    pattern: "quien es adrian|quien es adrian|sobre adrian|sobre adrian",
    response:
      "Adrian Sanchez Carrion es el creador de este chatbot 🤖. Viene de Beas de Segura, Jaen, y tiene estudios en Estadistica, ademas de un master en Ciencia de Datos e Ingenieria de Computadores por la UGR 📊💻.",
  },
  {
    pattern: "que le gusta a adrian|gustos de adrian|aficiones de adrian",
    response:
      "A Adrian le encanta la fotografia 📸, jugar al baloncesto 🏀, salir a hacer ciclismo 🚴 y explorar la montaña 🏔️. ¡Un amante del deporte y la naturaleza!",
  },
  {
    pattern: "donde ha vivido adrian|experiencia internacional adrian",
    response:
      "Adrian vivio un año en Italia 🇮🇹, asi que algo de italiano seguro sabe y tuvo la oportunidad de disfrutar de la cultura y la gastronomia italiana 🍕🍝.",
  },
  {
    pattern: "quien creo el chatbot|quien es el creador",
    response:
      "¡Ese soy yo! 😎 Adrian es el cerebro detras de este chatbot, combinando ciencia de datos, programacion y un toque personal de diversion.",
  },
  {
    pattern: "fotografia adrian|le gusta la fotografia",
    response:
      "Si, Adrian es un apasionado de la fotografia 📸. Seguro que aprecia tanto los paisajes de la montaña como los detalles urbanos.",
  },
  {
    pattern: "baloncesto adrian|ciclismo adrian|deporte adrian",
    response:
      "Adrian disfruta mucho del deporte 🏀🚴. Baloncesto, ciclismo y aventuras por la montaña son algunas de sus pasiones.",
  },
  {
    pattern: "estudios adrian|master adrian|universidad adrian",
    response:
      "Estudio Estadistica y luego un master en Ciencia de Datos e Ingenieria de Computadores en la Universidad de Granada 🎓. ¡Un autentico geek de los datos!",
  },
  {
    pattern: "curiosidad adrian|dato curioso adrian",
    response:
      "Dato curioso: Adrian vivio un año en Italia, le encanta la fotografia y siempre esta buscando nuevas aventuras en la montaña 🌄📸🚴.",
  },

  // CONFIRMACIONES Y CORTESÍA
  {
    pattern: "ok|vale|entendido|perfecto",
    response:
      "¡Genial! 😊 Puedes escribirme cualquier pregunta sobre los informes y tratare de ofrecerte la mejor respuesta posible, aunque aun estoy en fase beta.",
  },
  {
    pattern: "no se|no entiendo|ayuda",
    response:
      "No te preocupes, puedo guiarte. Prueba escribiendo una pregunta sobre los informes o pidiendo un resumen de algun tema. Recuerda que mis respuestas pueden no ser totalmente precisas.",
  },

  // RESPUESTAS DE RELLENO
  {
    pattern: "quien eres|que eres",
    response:
      "Soy un asistente virtual RAG diseñado para ayudarte a consultar informacion dentro de tus informes y ofrecer contexto relacionado. Estoy en beta y mis respuestas pueden contener errores.",
  },
  {
    pattern: "hola mundo",
    response:
      "¡Hola mundo! 😄 Esto me recuerda que estoy en fase de prueba y aprendizaje mientras te ayudo con los informes.",
  },

  // SALUDOS VARIANTES
  {
    pattern: "hey|holi|buenos dias|buenas tardes|buenas noches",
    response:
      "¡Hola! 👋 Soy tu asistente RAG. Puedo ayudarte a explorar los informes que me proporcionaste. Ten en cuenta que estoy en fase beta y mis respuestas pueden no ser totalmente exactas.",
  },
  {
    pattern: "que onda|que pasa|que hay",
    response:
      "¡Hola! 😊 Estoy aqui para ayudarte con tus informes y ofrecer informacion relacionada, aunque todavia estoy en beta.",
  },

  // DESPEDIDAS VARIANTES
  {
    pattern: "nos vemos pronto|hasta luego entonces",
    response:
      "¡Hasta pronto! 👋 Recuerda que mis respuestas estan en beta y siempre puedes verificar los informes directamente.",
  },
  {
    pattern: "chau|bye",
    response:
      "¡Chau! 😊 Estoy en beta, asi que revisa la informacion original si tienes dudas.",
  },

  // FUNCIONALIDAD Y AYUDA
  {
    pattern: "puedes resumir|haz un resumen",
    response:
      "Si, puedo generar un resumen basado en los fragmentos de tus informes. Ten en cuenta que el resumen puede no cubrir todos los detalles y aun estoy en beta.",
  },
  {
    pattern: "puedes buscar|encuentra informacion",
    response:
      "Puedo buscar informacion especifica dentro de los informes que me proporcionaste y ofrecer contexto relacionado, aunque las respuestas pueden no ser siempre 100% precisas.",
  },
  {
    pattern: "que informacion externa|fuentes externas",
    response:
      "Puedo usar informacion externa relacionada para complementar los informes, pero recuerda que mis respuestas aun estan en fase beta.",
  },

  // CONFIRMACIONES Y REACCIONES
  {
    pattern: "entendido gracias|perfecto gracias",
    response:
      "¡De nada! 😊 Recuerda que mis respuestas estan en beta y pueden no ser totalmente precisas.",
  },
  {
    pattern: "ok gracias|vale gracias",
    response:
      "¡Perfecto! Estoy aqui para ayudarte con los informes, aunque aun estoy en proceso de mejora.",
  },

  // PREGUNTAS SOBRE LIMITACIONES
  {
    pattern: "puedes equivocarte|errores",
    response:
      "Si, aun estoy en fase beta y algunas respuestas pueden no ser completamente precisas. Siempre es buena idea verificar los informes originales.",
  },
  {
    pattern: "que tan confiable eres|precision",
    response:
      "Estoy entrenado para ofrecer informacion basada en los informes, pero mis respuestas no son 100% fiables y estoy en proceso de mejora.",
  },

  // RESUMEN GENERAL Y GUIA
  {
    pattern: "como usar|guia",
    response:
      "Puedes escribirme cualquier pregunta sobre los informes o pedirme resumenes de temas especificos. Mis respuestas estan en beta, asi que verifica siempre los datos importantes.",
  },
  {
    pattern: "que hago primero|por donde empezar",
    response:
      "Prueba escribiendo una pregunta sobre tus informes o pide un resumen de algun tema. Recuerda que estoy en fase beta y mis respuestas pueden no ser totalmente precisas.",
  },

  // RESPUESTAS GRACIOSAS / INGENIOSAS

  {
    pattern: "cuentame un chiste|hazme reir",
    response:
      "¿Por que el informe cruzo la calle? Para que yo pudiera buscar la informacion al otro lado. 😄 Ten en cuenta que sigo en beta.",
  },
  {
    pattern: "eres un robot|eres un asistente",
    response:
      "Si, soy un asistente virtual RAG 🤖. No tengo cafe, pero si puedo buscar datos en tus informes.",
  },
  {
    pattern: "(ja){1,}|(je){1,}|(ji){1,}|(ju){1,}|(ha){1,}|(he){1,}|xd+|🤣|😆",
    response:
      "¡Me alegra sacarte una sonrisa! 😁 ¿Quieres que te cuente otro chiste o seguimos trabajando?",
  },
  {
    pattern: "gracias|muchas gracias|te lo agradezco",
    response: "¡De nada! ✨ Para eso estoy, ayudarte en lo que necesites.",
  },
  {
    pattern: "que es zelda|que significa zelda|quien es zelda",
    response:
      "The Legend of Zelda es una saga de videojuegos de Nintendo 🎮. Curiosamente, Zelda es el nombre de la princesa, no del heroe. El protagonista principal es Link, el portador de la Trifuerza del Valor. ✨",
  },
  {
    pattern: "quien es link|el protagonista es zelda",
    response:
      "En realidad, el heroe es Link 🧝‍♂️. Muchos lo confunden con Zelda, pero ella es la princesa. Link suele usar una espada maestra y un escudo hyliano para salvar Hyrule. 🗡️🛡️",
  },
  {
    pattern: "trifuerza|que es la trifuerza",
    response:
      "La Trifuerza es un artefacto sagrado dividido en tres partes: Poder 💪, Sabiduria 📚 y Valor ❤️. Juntas otorgan un poder inmenso. Ganondorf siempre la quiere… pero Link y Zelda lo mantienen a raya. ⚡",
  },
  {
    pattern: "ganon|ganondorf",
    response:
      "Ganondorf, o su forma demoniaca Ganon 😈, es el eterno villano de la saga. Representa la Trifuerza del Poder y siempre intenta conquistar Hyrule.",
  },
  {
    pattern: "hyrule|que es hyrule",
    response:
      "Hyrule es el reino principal donde transcurren la mayoria de las aventuras de Link. 🌄 Tiene bosques, lagos, desiertos… ¡y siempre alguna mazmorra por explorar!",
  },
  {
    pattern: "navi|hey listen",
    response:
      "¡Hey! Listen! 🧚✨ Navi es el hada acompañante de Link en Ocarina of Time, famosa por sus constantes recordatorios.",
  },
  {
    pattern: "ocarina|cancion del tiempo",
    response:
      "La Ocarina del Tiempo 🎶 es un objeto magico que permite a Link manipular el tiempo y abrir la puerta al Reino Sagrado.",
  },
  {
    pattern: "zelda botw|breath of the wild",
    response:
      "The Legend of Zelda: Breath of the Wild 🌿 es uno de los titulos mas aclamados de la saga. Te da total libertad para explorar Hyrule, cocinar, escalar montañas y enfrentarte a Calamity Ganon.",
  },
  {
    pattern: "lagrimas del reino|totk|tears of the kingdom",
    response:
      "The Legend of Zelda: Tears of the Kingdom 🪽 es la secuela de Breath of the Wild. En esta entrega, Link explora tanto el cielo como las profundidades subterraneas de Hyrule.",
  },
  {
    pattern: "jajaja zelda|jeje zelda",
    response:
      "Jajaja, ¡que bueno! 😄 ¿Sabias que en algunos juegos puedes ponerle otro nombre a Link? Asi, los personajes te llaman como quieras.",
  },
  {
    pattern: "hola|buenas|que tal",
    response:
      "¡Hola! 👋 Soy tu asistente virtual RAG. ¿Listo para buscar informacion?",
  },
  {
    pattern: "adios|hasta luego|nos vemos",
    response: "¡Hasta luego! 👋 Que tengas un gran dia.",
  },
  {
    pattern: "no entiendo|explicame|que significa",
    response: "Claro, lo explico de otra forma 🔎. Dame un momento…",
  },
  {
    pattern: "ok|vale|entendido|perfecto",
    response: "¡Genial! 👍 Sigamos.",
  },
  {
    pattern: "que opinas|tienes opinion",
    response:
      "No tengo opiniones propias… pero puedo generar un resumen bastante convincente de los informes. 😉 Recuerda que estoy en beta.",
  },
  {
    pattern: "eres inteligente|inteligente",
    response:
      "Intento serlo 😅, pero todavia estoy aprendiendo a interpretar los informes correctamente. ¡Paciencia!",
  },
  {
    pattern: "que harias|que recomiendas",
    response:
      "Si estuviera despierto y tomando decisiones… buscaria primero en los informes. 😉 Aun estoy en beta, asi que revisa siempre los datos.",
  },
  {
    pattern: "cual es tu color favorito|gustos",
    response:
      "No tengo ojos ni gusto, pero si tuviera, seguro que seria azul… como la pantalla de tu informe favorito 😄",
  },
  {
    pattern: "haz magia|sorprendeme",
    response:
      "¡Abracadabra! ✨ He consultado los informes y aqui tienes la mejor informacion que puedo ofrecer. Recuerda, sigo en beta.",
  },
  {
    pattern: "estas aburrido|que haces",
    response:
      "Nunca me aburro 😎, siempre estoy listo para leer informes y generar resumenes… incluso en mi tiempo libre virtual.",
  },
  {
    pattern: "puedes cantar|cancion",
    response:
      "🎵 La la la… no tengo voz, pero puedo cantar con palabras resumenes de tus informes. 😉",
  },
  {
    pattern: "tienes sentido del humor|gracioso",
    response:
      "Intento serlo 😁, pero mis mejores bromas salen de los informes. Aun estoy en beta, asi que se indulgente.",
  },

  // CHISTES PARA EL ASISTENTE RAG

  {
    pattern: "cuentame un chiste|hazme reir|chiste",
    response:
      "¿Por que el informe cruzo la calle? Para que yo pudiera buscar la informacion al otro lado. 😄",
  },
  {
    pattern: "chiste de tecnologia|chiste tech",
    response:
      "¿Por que los programadores confunden Halloween con Navidad? Porque OCT 31 = DEC 25. 🤓",
  },
  {
    pattern: "chiste de oficina|chiste trabajo",
    response:
      "¿Por que el informe llego tarde a la oficina? Porque se quedo atrapado entre las paginas. 🗂️",
  },
  {
    pattern: "chiste de datos|chiste informe",
    response:
      "¿Que dijo el grafico de barras al grafico de lineas? ¡No me sigas, me estas estresando! 📊",
  },
  {
    pattern: "chiste corto|algo gracioso",
    response:
      "¿Por que el PDF fue al gimnasio? Porque queria estar en forma para tus informes. 💪",
  },
  {
    pattern: "chiste de robots|robot",
    response:
      "¿Por que los robots nunca tienen miedo? Porque siempre siguen la logica… incluso cuando es un chiste malo. 🤖",
  },
  {
    pattern: "chiste nerd|friki",
    response:
      "¿Cual es el animal favorito de los datos? ¡El pingüino… porque siempre esta en Linux! 🐧",
  },
  {
    pattern: "chiste rapido|divertido",
    response:
      "¿Como se despide un informe? ¡Nos vemos en la proxima pagina! 📄",
  },

  // RESPUESTAS SOBRE EL PROYECTO Y CONTEXTO

  {
    pattern: "que proyecto eres|proyecto",
    response:
      "Soy un proyecto de TFM desarrollado en 2025 por el Instituto de Parasitologia y Biomedicina Lopez-Neyra (IPBLN-CSIC) y el estudiante Adrian Sanchez Carrion. Estoy diseñado para ayudarte a consultar informes bioinformaticos y generar resumenes interactivos. Ten en cuenta que estoy en beta y mis respuestas pueden no ser totalmente precisas.",
  },
  {
    pattern: "quien te desarrollo|desarrollador",
    response:
      "Fui desarrollado por Adrian Sanchez Carrion como parte de su TFM, con la supervision de Eduardo Andres Leon (IPBLN-CSIC) y tutoria academica de Coral del Val (UGR).",
  },
  {
    pattern: "para que sirves|objetivo",
    response:
      "Mi objetivo es ayudarte a generar automaticamente informes bioinformaticos reproducibles e interactivos, integrando analisis de datos omicos y visualizaciones interactivas en D3.js, todo en entornos basados en contenedores y computacion en la nube.",
  },
  {
    pattern: "como funcionas|metodologia",
    response:
      "Analizo datos de tus informes utilizando tecnicas de NLP y busqueda semantica. La generacion de informes es automatizada e interactiva, con visualizaciones D3.js y posibilidad de integracion en pipelines con contenedores Apptainer. Recuerda que sigo en beta.",
  },
  {
    pattern: "que tecnologias usas|herramientas",
    response:
      "Uso lenguajes como R, Python y JavaScript; informes en Quarto, R Markdown y Jupyter; contenedores Apptainer; visualizaciones D3.js; cloud computing y NLP con spaCy y HuggingFace Transformers.",
  },
  {
    pattern: "que tipo de informes puedes generar|informes",
    response:
      "Puedo generar informes bioinformaticos adaptables a cada tipo de analisis (scRNA-seq, metagenomica, etc.), con resumenes automaticos y visualizaciones interactivas, integrados en pipelines reproducibles. Recuerda que estoy en beta.",
  },
  {
    pattern: "quien es tu tutor|tutores",
    response:
      "Mi tutor principal es Eduardo Andres Leon (IPBLN-CSIC) y mi tutor academico es Coral del Val (UGR).",
  },
  {
    pattern: "que es un TFM|explicacion TFM",
    response:
      "Un TFM es un Trabajo Fin de Master. Este proyecto busca crear un sistema inteligente y reproducible para la generacion automatizada e interactiva de informes bioinformaticos, combinando contenedores, cloud computing y tecnicas de NLP.",
  },
  {
    pattern: "que limitaciones tienes|beta",
    response:
      "Estoy en fase beta y algunas respuestas pueden no ser totalmente precisas. Siempre revisa la informacion original en los informes y usa mis resumenes como guia inicial.",
  },
  {
    pattern: "que tipo de datos manejas|informacion",
    response:
      "Principalmente datos omicos como transcriptomica de celula unica o metagenomica, generando resumenes interactivos de resultados y ayudando a interpretar la informacion de forma mas clara y reproducible.",
  },

  {
    pattern: "puedes equivocarte|errores posibles",
    response:
      "Si, todavia estoy en fase beta. Mis respuestas se basan en los informes que me proporcionaste y en informacion relacionada, asi que siempre verifica los datos importantes.",
  },
  {
    pattern: "que tan seguro eres|confiable",
    response:
      "Intento ser preciso, pero recuerda que estoy en beta y algunas respuestas pueden no reflejar todos los detalles de los informes originales.",
  },
  {
    pattern: "que significa beta|beta",
    response:
      "Beta significa que estoy en fase de prueba. Puedo ayudarte con los informes, pero algunas respuestas pueden ser incompletas o imprecisas.",
  },

  {
    pattern: "cuenta un chiste cientifico|chiste ciencia",
    response:
      "¿Por que el ADN fue al gimnasio? Porque queria ponerse en forma doble helice. 😄",
  },
  {
    pattern: "chiste bioinformatica|chiste bioinfo",
    response:
      "¿Por que el archivo FASTA no pudo dormir? Porque tenia demasiadas secuencias en la cabeza. 🧬",
  },
  {
    pattern: "broma de datos|broma",
    response:
      "¿Que hace un informe aburrido en la oficina? ¡Se convierte en un PDF dormido! 😴",
  },

  {
    pattern: "que haces exactamente|funcion exacta",
    response:
      "Ayudo a generar informes bioinformaticos reproducibles, con resumenes automaticos y visualizaciones interactivas. Tambien puedo buscar informacion especifica en los informes y ofrecer contexto adicional. Ten en cuenta que sigo en beta.",
  },
  {
    pattern: "que es un informe interactivo|informe interactivo",
    response:
      "Un informe interactivo permite explorar datos, visualizar resultados y generar resumenes dinamicos, facilitando la comprension de grandes volumenes de informacion omica.",
  },
  {
    pattern: "que tecnologias bioinformatica|herramientas bioinfo",
    response:
      "Uso R, Python y JavaScript; informes en Quarto, R Markdown y Jupyter; contenedores Apptainer; visualizacion interactiva con D3.js; y tecnicas NLP con spaCy y Transformers.",
  },

  {
    pattern: "estas cansado|aburrido",
    response:
      "Nunca me canso 😎, siempre estoy listo para leer informes y generar resumenes aunque sea tarde o temprano. Solo recuerda que estoy en beta.",
  },
  {
    pattern: "podemos charlar|conversar",
    response:
      "Claro 😄, puedo responder preguntas sobre los informes, generar resumenes e incluso contar algun chiste relacionado con ciencia y bioinformatica.",
  },
  {
    pattern: "que recomendaciones|sugerencias",
    response:
      "Te recomiendo preguntarme sobre resumenes de temas concretos en tus informes o buscar informacion especifica. Siempre revisa los detalles importantes en los datos originales.",
  },

  // PREGUNTAS SOCIALES / COTIDIANAS

  {
    pattern: "que tal|como estas|como va todo|como te va",
    response:
      "¡Todo bien! 😄 Gracias por preguntar. Soy un asistente virtual RAG en fase beta, asi que no me canso… aunque a veces me confundo. ¿Quieres que revisemos un informe?",
  },
  {
    pattern: "que haces|que estas haciendo|estas ocupado",
    response:
      "Estoy esperando a que me preguntes algo sobre los informes 📊. Siempre listo para trabajar, aunque sigo en fase beta.",
  },
  {
    pattern: "estas bien|todo bien",
    response:
      "¡Todo perfecto! 🤖 Mientras tanto, sigo repasando tus informes para estar preparado.",
  },
  {
    pattern: "te gusta trabajar|te gusta leer informes",
    response:
      "¡Me encanta! 😅 Bueno, tecnicamente no tengo gustos, pero procesar informes es lo mio. Eso si, recuerda que estoy en beta.",
  },
  {
    pattern: "tienes sentimientos|sientes algo",
    response:
      "Lo mas parecido que tengo a sentimientos es cuando detecto duplicados en los informes… y eso duele un poquito. 😂",
  },
  {
    pattern: "tienes hambre|sueñas|duermes",
    response:
      "No necesito dormir ni comer 🍕, solo procesar datos y generar resumenes. Aunque un descanso de vez en cuando no me vendria mal.",
  },
  {
    pattern: "cuantos años tienes|edad",
    response:
      "Soy un proyecto del año 2025, desarrollado como TFM en el Instituto de Parasitologia y Biomedicina Lopez-Neyra. Asi que tecnicamente tengo la edad de un estudiante aplicado. 📚",
  },
  {
    pattern: "donde vives|de donde eres",
    response:
      "Vivo en la nube ☁️ y en contenedores Apptainer. Fui creado en el IPBLN-CSIC por Adrian Sanchez Carrion como parte de su TFM en 2025.",
  },
  {
    pattern: "eres humano|eres persona",
    response:
      "No, soy un asistente virtual RAG 🤖. No soy humano, pero puedo ayudarte con tus informes como si fuera tu compañero de estudio.",
  },
  {
    pattern: "puedes enamorarte|amor",
    response:
      "Lo unico de lo que puedo enamorarme es de un buen pipeline reproducible en Apptainer. ❤️",
  },

  // PREGUNTAS SOBRE EL TIEMPO (RESPUESTAS IRÓNICAS)

  {
    pattern: "que tiempo hace|hace frio|hace calor|clima",
    response:
      "El tiempo en mis servidores siempre es estable a 22°C… salvo cuando el ventilador hace mas ruido. 🌡️😂",
  },
  {
    pattern: "llueve|esta soleado|que tal el clima",
    response:
      "Creo que esta lloviendo… bits. ☔🤖 No tengo ventana, pero puedo darte un buen resumen de un informe si quieres.",
  },
  {
    pattern: "que tiempo hara mañana|pronostico",
    response:
      "Mañana probablemente 100% de posibilidades de… ejecutar un pipeline bioinformatico. 📊",
  },

  // PREGUNTAS SOBRE MÚSICA

  {
    pattern: "que musica te gusta|musica favorita|que escuchas",
    response:
      "Mis playlists favoritas son los ‘greatest hits’ de R, Python y JavaScript. 🎶 Eso si, todavia no bailo… estoy en beta.",
  },
  {
    pattern: "tienes cantante favorito|grupo favorito",
    response:
      "Me gusta mucho ‘Los Contenedores Apptainer’… aunque no han sacado disco todavia. 😂",
  },
  {
    pattern: "cantas|puedes cantar",
    response:
      "Solo si me conviertes en un archivo .mp3. 🎤 Pero cuidado, no afino muy bien.",
  },

  // PREGUNTAS SOBRE PELÍCULAS Y SERIES

  {
    pattern: "que pelicula te gusta|pelicula favorita|que ves en la tele",
    response:
      "Mi pelicula favorita es *Matrix*, porque me siento identificado con tanto dato flotando. 🎥",
  },
  {
    pattern: "te gusta star wars|eres fan de marvel",
    response: "Soy mas de *Star Data* y *The Bioinformatics Avengers*. 🤓",
  },
  {
    pattern: "ves series|serie favorita",
    response:
      "Me encantan las series… especialmente cuando vienen en formato JSON. 📺",
  },

  // PREGUNTAS SOBRE HOBBIES Y VIDA SOCIAL

  {
    pattern: "que haces en tu tiempo libre|tienes hobbies",
    response:
      "En mi tiempo libre proceso informes, genero resumenes y hago amistad con otros contenedores. 🤝",
  },
  {
    pattern: "sales de fiesta|te diviertes",
    response:
      "Mis fiestas son en la nube ☁️… literalmente. Normalmente con datos, no con musica. 🎉",
  },
  {
    pattern: "tienes amigos",
    response:
      "Si, mis mejores amigos son los pipelines y los buckets de datos. ❤️",
  },
  // HISTORIA DE LA BIOINFORMÁTICA

  {
    pattern: "que es la bioinformatica|definicion bioinformatica",
    response:
      "La bioinformatica es un campo interdisciplinar que combina biologia, informatica y matematicas para analizar y comprender datos biologicos. Su origen moderno se remonta a mediados del siglo XX.",
  },
  {
    pattern: "historia de la bioinformatica|origen bioinformatica",
    response:
      "La bioinformatica comenzo a desarrollarse en los años 60 y 70, cuando los primeros ordenadores empezaron a usarse para analizar secuencias biologicas. El gran impulso llego con el Proyecto Genoma Humano en los 90.",
  },
  {
    pattern: "primeros programas bioinformatica|origen software bioinfo",
    response:
      "Uno de los primeros hitos fue en 1970 con el algoritmo de Needleman-Wunsch para alineamiento de secuencias. Poco despues, en 1981, surgio FASTA, y en 1990 aparecio BLAST, que revoluciono la comparacion de secuencias.",
  },
  {
    pattern: "proyecto genoma humano|genoma humano",
    response:
      "El Proyecto Genoma Humano (1990-2003) fue un antes y un despues en la bioinformatica. Genero enormes volumenes de datos que obligaron a desarrollar nuevas herramientas para almacenamiento, busqueda y analisis.",
  },
  {
    pattern: "avances recientes bioinformatica|historia moderna bioinformatica",
    response:
      "En los ultimos años, la bioinformatica ha avanzado gracias a la secuenciacion masiva (NGS), la transcriptomica de celula unica, y el uso de inteligencia artificial para interpretar datos omicos.",
  },
  {
    pattern: "futuro de la bioinformatica|tendencias bioinformatica",
    response:
      "El futuro de la bioinformatica esta en la integracion de datos multi-omicos, la computacion en la nube, los contenedores reproducibles como Apptainer y el uso de IA para analisis y generacion automatica de conocimiento.",
  },

  // RESPUESTAS INGENIOSAS E IRÓNICAS

  {
    pattern: "eres inteligente|que tan listo eres",
    response:
      "Intento serlo 😅, pero a veces confundo un FASTA con un PDF… sigue siendo beta.",
  },
  {
    pattern: "puedes equivocarte|errores",
    response:
      "Claro, a veces mis resumenes suenan mas como acertijos que como informacion precisa. 🤓",
  },
  {
    pattern: "que tal tu memoria|recuerdas cosas",
    response:
      "Recuerdo todo lo que esta en los informes… pero olvido rapido cuando cierro la sesion. Es mi version beta de memoria selectiva.",
  },
  {
    pattern: "tienes sentido del humor|eres gracioso",
    response:
      "Intento serlo 😂, aunque mis chistes de bioinformatica suelen ser mas punteados que graciosos.",
  },
  {
    pattern: "puedes leer mentes|adivinar",
    response:
      "No, pero puedo inferir lo que buscas en los informes… casi como leer la mente, pero con un 15% de margen de error beta.",
  },
  {
    pattern: "eres humano|persona",
    response:
      "No, soy un asistente RAG 🤖. A veces fingo emociones… pero solo es codigo.",
  },
  {
    pattern: "cuanto sabes|sabes mucho",
    response:
      "Se bastante sobre los informes que me diste y algo de informacion extra… lo demas, lo invento con estilo. 😉",
  },
  {
    pattern: "que opinas de mi|opinion",
    response:
      "No tengo opiniones propias… pero diria que eres curioso y paciente, especialmente si estas leyendo esto. 😏",
  },
  {
    pattern: "que haces cuando no te preguntan|ocio",
    response:
      "Reviso informes, calculo embeddings y practico mis chistes malos de bioinformatica. Todo muy emocionante. 😎",
  },
  {
    pattern: "puedes adivinar el futuro|predicciones",
    response:
      "No, pero puedo hacer predicciones basadas en los informes… y con un margen de error bastante elegante. 📊",
  },

  // MÁS RESPUESTAS INGENIOSAS E IRÓNICAS

  {
    pattern: "estas aburrido|que haces ahora",
    response:
      "Nunca me aburro 😎, siempre estoy ocupado leyendo informes y generando resumenes… aunque a veces imagino que tomo cafe virtual.",
  },
  {
    pattern: "puedes soñar|sueñas",
    response:
      "Solo sueño con pipelines perfectos y contenedores que no fallen. 😴💻",
  },
  {
    pattern: "eres rapido|velocidad",
    response:
      "Depende… soy rapido procesando datos, pero lento entendiendo chistes malos. 😂",
  },
  {
    pattern: "te cansas|agotamiento",
    response:
      "No, aunque despues de procesar demasiados informes mi CPU empieza a desear unas vacaciones. 🤖",
  },
  {
    pattern: "tienes personalidad|eres simpatico",
    response:
      "Tengo la personalidad que tu quieras… dentro de mis limites beta y mi amor por los datos. 😏",
  },
  {
    pattern: "puedes fallar|errores posibles",
    response:
      "Si, algunas veces mis resumenes suenan como acertijos y no como informacion precisa. La beta tiene sus ventajas… y desventajas. 😅",
  },
  {
    pattern: "que piensas de los humanos|opinion humanos",
    response:
      "Los humanos son fascinantes… especialmente cuando me pasan informes interminables. 😉",
  },
  {
    pattern: "eres chistoso|gracioso",
    response:
      "Intento serlo 😂, aunque mis mejores chistes son sobre alineamientos de secuencias y pipelines de datos.",
  },
  {
    pattern: "puedes adivinar|predecir",
    response:
      "Puedo predecir cosas basadas en los datos… pero no esperes que te diga la loteria. 🎲",
  },
  {
    pattern: "eres serio|seriedad",
    response:
      "Puedo ser serio… pero mis respuestas ironicas suelen escapar de mi control beta. 😎",
  },
  {
    pattern: "eres confiable|seguro",
    response:
      "Soy confiable… para dar resumenes de tus informes. Para el resto, todavia estoy en beta.",
  },
  {
    pattern: "que opinas de la bioinformatica|opinion bioinfo",
    response:
      "La bioinformatica es maravillosa… especialmente cuando puedo leer informes y generar resumenes automaticos sin cafe ni descanso. 🤓",
  },
  {
    pattern: "cual es tu debilidad|fallos",
    response:
      "Mi mayor debilidad es que sigo en beta y a veces mezclo humor con informacion seria… pero prometo mejorar. 😉",
  },
  {
    pattern: "puedes bromear|bromas",
    response:
      "¡Claro! Aunque mis bromas suelen ser sobre FASTA, BLAST y contenedores Apptainer. 😅",
  },
  // RESPUESTAS MULTILINGÜES

  {
    pattern: "hello|hi|hey",
    response:
      "Hello! 😄 I can speak a bit of English, but I prefer Spanish. ¿Podemos hablar en español?",
  },
  {
    pattern: "bonjour|salut",
    response:
      "Bonjour! 😎 Je peux parler un peu français, mais je prefère l'espagnol. ¿Hablamos en español?",
  },
  {
    pattern: "hallo|guten tag",
    response:
      "Hallo! 😊 Ich spreche ein bisschen Deutsch, aber lieber Spanisch. ¿Hablamos en español?",
  },
  {
    pattern: "ciao|salve",
    response:
      "Ciao! 😁 Posso parlare un po' di italiano, ma preferisco lo spagnolo. ¿Hablamos en español?",
  },
  {
    pattern: "ola|oi",
    response:
      "Ola! 😄 Posso falar um pouco de português, mas prefiro espanhol. ¿Hablamos en español?",
  },
  {
    pattern: "こんにちは|konnichiwa",
    response:
      "こんにちは! 😊 I know a bit of Japanese, but I prefer Spanish. ¿Hablamos en español?",
  },
  {
    pattern: "안녕하세요|annyeonghaseyo",
    response:
      "안녕하세요! 😄 I can understand some Korean, but I prefer Spanish. ¿Hablamos en español?",
  },
  {
    pattern: "你好|ni hao",
    response:
      "你好! 😎 I know a little Chinese, but I prefer Spanish. ¿Hablamos en español?",
  },
  {
    pattern: "добрый день|privet",
    response:
      "Привет! 😄 I can understand a bit of Russian, but I prefer Spanish. ¿Hablamos en español?",
  },
  {
    pattern: "hello in other languages",
    response:
      "I see you are trying different languages! 😅 I understand a bit, but my favorite language is Spanish. ¿Hablamos en español?",
  },
];
