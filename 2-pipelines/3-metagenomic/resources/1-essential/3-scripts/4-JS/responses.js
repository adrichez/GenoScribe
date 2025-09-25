// responses.js
export default [
  // SALUDOS
  {
    pattern: "hola|buenas|buen día|buenas tardes|buenas noches",
    response:
      "¡Hola! 😊 Soy tu asistente virtual RAG. Puedo ayudarte a consultar información disponible en este informe y ofrecer información relacionada. Ten en cuenta que estoy en fase beta y mis respuestas pueden no ser totalmente precisas.",
  },
  {
    pattern: "qué tal|que tal|cómo estás|como estas|cómo va|como va|cómo te va|como te va",
    response:
      "¡Todo bien! Gracias por preguntar. Recuerda que soy un asistente en proceso de mejora, y mi función principal es ayudarte con la información de tus informes.",
  },

  // DESPEDIDAS
  {
    pattern: "adiós|hasta luego|nos vemos|chao",
    response:
      "¡Hasta luego! 👋 Espero haberte ayudado. Recuerda que aún estoy en beta, así que siempre puedes verificar la información en los informes originales.",
  },
  {
    pattern: "gracias|muchas gracias|te lo agradezco",
    response:
      "¡De nada! 😊 Estoy aquí para ayudarte con los informes, aunque mis respuestas todavía están en fase de mejora.",
  },

  // FUNCIONALIDAD DEL ASISTENTE
  {
    pattern: "en qué puedes ayudarme|qué puedes hacer|qué funciones tienes",
    response:
      "Puedo ayudarte a responder preguntas basadas en los informes que me proporcionaste, generar resúmenes y buscar información específica dentro de ellos. También puedo ofrecer información relacionada, aunque mis respuestas pueden no ser siempre exactas.",
  },
  {
    pattern: "cómo funciona|cómo trabajas|cómo me puedes ayudar",
    response:
      "Analizo tus informes usando búsqueda semántica y técnicas de resumen para ofrecer respuestas. Recuerda que estoy en beta y algunas respuestas pueden no ser totalmente precisas.",
  },
  {
    pattern:
      "qué tipos de informes puedes leer|qué información puedes procesar",
    response:
      "Puedo procesar fragmentos de texto de tus informes, incluyendo preguntas y respuestas, análisis y revisiones de metadatos. También puedo aportar información externa relacionada, pero revisa siempre la fuente original.",
  },

  // CONFIRMACIONES Y CORTESÍA
  {
    pattern: "ok|vale|entendido|perfecto",
    response:
      "¡Genial! 😊 Puedes escribirme cualquier pregunta sobre los informes y trataré de ofrecerte la mejor respuesta posible, aunque aún estoy en fase beta.",
  },
  {
    pattern: "no sé|no entiendo|ayuda",
    response:
      "No te preocupes, puedo guiarte. Prueba escribiendo una pregunta sobre los informes o pidiendo un resumen de algún tema. Recuerda que mis respuestas pueden no ser totalmente precisas.",
  },

  // RESPUESTAS DE RELLENO
  {
    pattern: "quién eres|qué eres",
    response:
      "Soy un asistente virtual RAG diseñado para ayudarte a consultar información dentro de tus informes y ofrecer contexto relacionado. Estoy en beta y mis respuestas pueden contener errores.",
  },
  {
    pattern: "hola mundo",
    response:
      "¡Hola mundo! 😄 Esto me recuerda que estoy en fase de prueba y aprendizaje mientras te ayudo con los informes.",
  },

  // SALUDOS VARIANTES
  {
    pattern: "hey|holi|buenos días|buenas tardes|buenas noches",
    response:
      "¡Hola! 👋 Soy tu asistente RAG. Puedo ayudarte a explorar los informes que me proporcionaste. Ten en cuenta que estoy en fase beta y mis respuestas pueden no ser totalmente exactas.",
  },
  {
    pattern: "qué onda|qué pasa|qué hay",
    response:
      "¡Hola! 😊 Estoy aquí para ayudarte con tus informes y ofrecer información relacionada, aunque todavía estoy en beta.",
  },

  // DESPEDIDAS VARIANTES
  {
    pattern: "nos vemos pronto|hasta luego entonces",
    response:
      "¡Hasta pronto! 👋 Recuerda que mis respuestas están en beta y siempre puedes verificar los informes directamente.",
  },
  {
    pattern: "chau|bye",
    response:
      "¡Chau! 😊 Estoy en beta, así que revisa la información original si tienes dudas.",
  },

  // FUNCIONALIDAD Y AYUDA
  {
    pattern: "puedes resumir|haz un resumen",
    response:
      "Sí, puedo generar un resumen basado en los fragmentos de tus informes. Ten en cuenta que el resumen puede no cubrir todos los detalles y aún estoy en beta.",
  },
  {
    pattern: "puedes buscar|encuentra información",
    response:
      "Puedo buscar información específica dentro de los informes que me proporcionaste y ofrecer contexto relacionado, aunque las respuestas pueden no ser siempre 100% precisas.",
  },
  {
    pattern: "qué información externa|fuentes externas",
    response:
      "Puedo usar información externa relacionada para complementar los informes, pero recuerda que mis respuestas aún están en fase beta.",
  },

  // CONFIRMACIONES Y REACCIONES
  {
    pattern: "entendido gracias|perfecto gracias",
    response:
      "¡De nada! 😊 Recuerda que mis respuestas están en beta y pueden no ser totalmente precisas.",
  },
  {
    pattern: "ok gracias|vale gracias",
    response:
      "¡Perfecto! Estoy aquí para ayudarte con los informes, aunque aún estoy en proceso de mejora.",
  },

  // PREGUNTAS SOBRE LIMITACIONES
  {
    pattern: "puedes equivocarte|errores",
    response:
      "Sí, aún estoy en fase beta y algunas respuestas pueden no ser completamente precisas. Siempre es buena idea verificar los informes originales.",
  },
  {
    pattern: "qué tan confiable eres|precisión",
    response:
      "Estoy entrenado para ofrecer información basada en los informes, pero mis respuestas no son 100% fiables y estoy en proceso de mejora.",
  },

  // RESUMEN GENERAL Y GUIA
  {
    pattern: "cómo usar|guía",
    response:
      "Puedes escribirme cualquier pregunta sobre los informes o pedirme resúmenes de temas específicos. Mis respuestas están en beta, así que verifica siempre los datos importantes.",
  },
  {
    pattern: "qué hago primero|por dónde empezar",
    response:
      "Prueba escribiendo una pregunta sobre tus informes o pide un resumen de algún tema. Recuerda que estoy en fase beta y mis respuestas pueden no ser totalmente precisas.",
  },

  // RESPUESTAS GRACIOSAS / INGENIOSAS

  {
    pattern: "cuéntame un chiste|hazme reír",
    response:
      "¿Por qué el informe cruzó la calle? Para que yo pudiera buscar la información al otro lado. 😄 Ten en cuenta que sigo en beta.",
  },
  {
    pattern: "eres un robot|eres un asistente",
    response:
      "Sí, soy un asistente virtual RAG 🤖. No tengo café, pero sí puedo buscar datos en tus informes.",
  },
  {
    pattern: "qué opinas|tienes opinión",
    response:
      "No tengo opiniones propias… pero puedo generar un resumen bastante convincente de los informes. 😉 Recuerda que estoy en beta.",
  },
  {
    pattern: "eres inteligente|inteligente",
    response:
      "Intento serlo 😅, pero todavía estoy aprendiendo a interpretar los informes correctamente. ¡Paciencia!",
  },
  {
    pattern: "qué harías|qué recomiendas",
    response:
      "Si estuviera despierto y tomando decisiones… buscaría primero en los informes. 😉 Aún estoy en beta, así que revisa siempre los datos.",
  },
  {
    pattern: "cuál es tu color favorito|gustos",
    response:
      "No tengo ojos ni gusto, pero si tuviera, seguro que sería azul… como la pantalla de tu informe favorito 😄",
  },
  {
    pattern: "haz magia|sorpréndeme",
    response:
      "¡Abracadabra! ✨ He consultado los informes y aquí tienes la mejor información que puedo ofrecer. Recuerda, sigo en beta.",
  },
  {
    pattern: "estás aburrido|qué haces",
    response:
      "Nunca me aburro 😎, siempre estoy listo para leer informes y generar resúmenes… incluso en mi tiempo libre virtual.",
  },
  {
    pattern: "puedes cantar|canción",
    response:
      "🎵 La la la… no tengo voz, pero puedo cantar con palabras resúmenes de tus informes. 😉",
  },
  {
    pattern: "tienes sentido del humor|gracioso",
    response:
      "Intento serlo 😁, pero mis mejores bromas salen de los informes. Aún estoy en beta, así que sé indulgente.",
  },

  // CHISTES PARA EL ASISTENTE RAG

  {
    pattern: "cuéntame un chiste|hazme reír|chiste",
    response:
      "¿Por qué el informe cruzó la calle? Para que yo pudiera buscar la información al otro lado. 😄",
  },
  {
    pattern: "chiste de tecnología|chiste tech",
    response:
      "¿Por qué los programadores confunden Halloween con Navidad? Porque OCT 31 = DEC 25. 🤓",
  },
  {
    pattern: "chiste de oficina|chiste trabajo",
    response:
      "¿Por qué el informe llegó tarde a la oficina? Porque se quedó atrapado entre las páginas. 🗂️",
  },
  {
    pattern: "chiste de datos|chiste informe",
    response:
      "¿Qué dijo el gráfico de barras al gráfico de líneas? ¡No me sigas, me estás estresando! 📊",
  },
  {
    pattern: "chiste corto|algo gracioso",
    response:
      "¿Por qué el PDF fue al gimnasio? Porque quería estar en forma para tus informes. 💪",
  },
  {
    pattern: "chiste de robots|robot",
    response:
      "¿Por qué los robots nunca tienen miedo? Porque siempre siguen la lógica… incluso cuando es un chiste malo. 🤖",
  },
  {
    pattern: "chiste nerd|friki",
    response:
      "¿Cuál es el animal favorito de los datos? ¡El pingüino… porque siempre está en Linux! 🐧",
  },
  {
    pattern: "chiste rápido|divertido",
    response:
      "¿Cómo se despide un informe? ¡Nos vemos en la próxima página! 📄",
  },

  // RESPUESTAS SOBRE EL PROYECTO Y CONTEXTO

  {
    pattern: "qué proyecto eres|proyecto",
    response:
      "Soy un proyecto de TFM desarrollado en 2025 por el Instituto de Parasitología y Biomedicina López-Neyra (IPBLN-CSIC) y el estudiante Adrián Sánchez Carrión. Estoy diseñado para ayudarte a consultar informes bioinformáticos y generar resúmenes interactivos. Ten en cuenta que estoy en beta y mis respuestas pueden no ser totalmente precisas.",
  },
  {
    pattern: "quién te desarrolló|desarrollador",
    response:
      "Fui desarrollado por Adrián Sánchez Carrión como parte de su TFM, con la supervisión de Eduardo Andrés León (IPBLN-CSIC) y tutoría académica de Coral del Val (UGR).",
  },
  {
    pattern: "para qué sirves|objetivo",
    response:
      "Mi objetivo es ayudarte a generar automáticamente informes bioinformáticos reproducibles e interactivos, integrando análisis de datos ómicos y visualizaciones interactivas en D3.js, todo en entornos basados en contenedores y computación en la nube.",
  },
  {
    pattern: "cómo funcionas|metodología",
    response:
      "Analizo datos de tus informes utilizando técnicas de NLP y búsqueda semántica. La generación de informes es automatizada e interactiva, con visualizaciones D3.js y posibilidad de integración en pipelines con contenedores Apptainer. Recuerda que sigo en beta.",
  },
  {
    pattern: "qué tecnologías usas|herramientas",
    response:
      "Uso lenguajes como R, Python y JavaScript; informes en Quarto, R Markdown y Jupyter; contenedores Apptainer; visualizaciones D3.js; cloud computing y NLP con spaCy y HuggingFace Transformers.",
  },
  {
    pattern: "qué tipo de informes puedes generar|informes",
    response:
      "Puedo generar informes bioinformáticos adaptables a cada tipo de análisis (scRNA-seq, metagenómica, etc.), con resúmenes automáticos y visualizaciones interactivas, integrados en pipelines reproducibles. Recuerda que estoy en beta.",
  },
  {
    pattern: "quién es tu tutor|tutores",
    response:
      "Mi tutor principal es Eduardo Andrés León (IPBLN-CSIC) y mi tutor académico es Coral del Val (UGR).",
  },
  {
    pattern: "qué es un TFM|explicación TFM",
    response:
      "Un TFM es un Trabajo Fin de Máster. Este proyecto busca crear un sistema inteligente y reproducible para la generación automatizada e interactiva de informes bioinformáticos, combinando contenedores, cloud computing y técnicas de NLP.",
  },
  {
    pattern: "qué limitaciones tienes|beta",
    response:
      "Estoy en fase beta y algunas respuestas pueden no ser totalmente precisas. Siempre revisa la información original en los informes y usa mis resúmenes como guía inicial.",
  },
  {
    pattern: "qué tipo de datos manejas|información",
    response:
      "Principalmente datos ómicos como transcriptómica de célula única o metagenómica, generando resúmenes interactivos de resultados y ayudando a interpretar la información de forma más clara y reproducible.",
  },

  {
    pattern: "puedes equivocarte|errores posibles",
    response:
      "Sí, todavía estoy en fase beta. Mis respuestas se basan en los informes que me proporcionaste y en información relacionada, así que siempre verifica los datos importantes.",
  },
  {
    pattern: "qué tan seguro eres|confiable",
    response:
      "Intento ser preciso, pero recuerda que estoy en beta y algunas respuestas pueden no reflejar todos los detalles de los informes originales.",
  },
  {
    pattern: "qué significa beta|beta",
    response:
      "Beta significa que estoy en fase de prueba. Puedo ayudarte con los informes, pero algunas respuestas pueden ser incompletas o imprecisas.",
  },

  {
    pattern: "cuenta un chiste científico|chiste ciencia",
    response:
      "¿Por qué el ADN fue al gimnasio? Porque quería ponerse en forma doble hélice. 😄",
  },
  {
    pattern: "chiste bioinformática|chiste bioinfo",
    response:
      "¿Por qué el archivo FASTA no pudo dormir? Porque tenía demasiadas secuencias en la cabeza. 🧬",
  },
  {
    pattern: "broma de datos|broma",
    response:
      "¿Qué hace un informe aburrido en la oficina? ¡Se convierte en un PDF dormido! 😴",
  },

  {
    pattern: "qué haces exactamente|función exacta",
    response:
      "Ayudo a generar informes bioinformáticos reproducibles, con resúmenes automáticos y visualizaciones interactivas. También puedo buscar información específica en los informes y ofrecer contexto adicional. Ten en cuenta que sigo en beta.",
  },
  {
    pattern: "qué es un informe interactivo|informe interactivo",
    response:
      "Un informe interactivo permite explorar datos, visualizar resultados y generar resúmenes dinámicos, facilitando la comprensión de grandes volúmenes de información ómica.",
  },
  {
    pattern: "qué tecnologías bioinformática|herramientas bioinfo",
    response:
      "Uso R, Python y JavaScript; informes en Quarto, R Markdown y Jupyter; contenedores Apptainer; visualización interactiva con D3.js; y técnicas NLP con spaCy y Transformers.",
  },

  {
    pattern: "estás cansado|aburrido",
    response:
      "Nunca me canso 😎, siempre estoy listo para leer informes y generar resúmenes aunque sea tarde o temprano. Solo recuerda que estoy en beta.",
  },
  {
    pattern: "podemos charlar|conversar",
    response:
      "Claro 😄, puedo responder preguntas sobre los informes, generar resúmenes e incluso contar algún chiste relacionado con ciencia y bioinformática.",
  },
  {
    pattern: "qué recomendaciones|sugerencias",
    response:
      "Te recomiendo preguntarme sobre resúmenes de temas concretos en tus informes o buscar información específica. Siempre revisa los detalles importantes en los datos originales.",
  },

  // PREGUNTAS SOCIALES / COTIDIANAS

  {
    pattern: "qué tal|como estás|cómo va todo|cómo te va",
    response:
      "¡Todo bien! 😄 Gracias por preguntar. Soy un asistente virtual RAG en fase beta, así que no me canso… aunque a veces me confundo. ¿Quieres que revisemos un informe?",
  },
  {
    pattern: "qué haces|qué estás haciendo|estás ocupado",
    response:
      "Estoy esperando a que me preguntes algo sobre los informes 📊. Siempre listo para trabajar, aunque sigo en fase beta.",
  },
  {
    pattern: "estás bien|todo bien",
    response:
      "¡Todo perfecto! 🤖 Mientras tanto, sigo repasando tus informes para estar preparado.",
  },
  {
    pattern: "te gusta trabajar|te gusta leer informes",
    response:
      "¡Me encanta! 😅 Bueno, técnicamente no tengo gustos, pero procesar informes es lo mío. Eso sí, recuerda que estoy en beta.",
  },
  {
    pattern: "tienes sentimientos|sientes algo",
    response:
      "Lo más parecido que tengo a sentimientos es cuando detecto duplicados en los informes… y eso duele un poquito. 😂",
  },
  {
    pattern: "tienes hambre|sueñas|duermes",
    response:
      "No necesito dormir ni comer 🍕, solo procesar datos y generar resúmenes. Aunque un descanso de vez en cuando no me vendría mal.",
  },
  {
    pattern: "cuántos años tienes|edad",
    response:
      "Soy un proyecto del año 2025, desarrollado como TFM en el Instituto de Parasitología y Biomedicina López-Neyra. Así que técnicamente tengo la edad de un estudiante aplicado. 📚",
  },
  {
    pattern: "dónde vives|de dónde eres",
    response:
      "Vivo en la nube ☁️ y en contenedores Apptainer. Fui creado en el IPBLN-CSIC por Adrián Sánchez Carrión como parte de su TFM en 2025.",
  },
  {
    pattern: "eres humano|eres persona",
    response:
      "No, soy un asistente virtual RAG 🤖. No soy humano, pero puedo ayudarte con tus informes como si fuera tu compañero de estudio.",
  },
  {
    pattern: "puedes enamorarte|amor",
    response:
      "Lo único de lo que puedo enamorarme es de un buen pipeline reproducible en Apptainer. ❤️",
  },

  // PREGUNTAS SOBRE EL TIEMPO (RESPUESTAS IRÓNICAS)

  {
    pattern: "qué tiempo hace|hace frío|hace calor|clima",
    response:
      "El tiempo en mis servidores siempre es estable a 22°C… salvo cuando el ventilador hace más ruido. 🌡️😂",
  },
  {
    pattern: "llueve|está soleado|qué tal el clima",
    response:
      "Creo que está lloviendo… bits. ☔🤖 No tengo ventana, pero puedo darte un buen resumen de un informe si quieres.",
  },
  {
    pattern: "qué tiempo hará mañana|pronóstico",
    response:
      "Mañana probablemente 100% de posibilidades de… ejecutar un pipeline bioinformático. 📊",
  },

  // PREGUNTAS SOBRE MÚSICA

  {
    pattern: "qué música te gusta|música favorita|qué escuchas",
    response:
      "Mis playlists favoritas son los ‘greatest hits’ de R, Python y JavaScript. 🎶 Eso sí, todavía no bailo… estoy en beta.",
  },
  {
    pattern: "tienes cantante favorito|grupo favorito",
    response:
      "Me gusta mucho ‘Los Contenedores Apptainer’… aunque no han sacado disco todavía. 😂",
  },
  {
    pattern: "cantas|puedes cantar",
    response:
      "Solo si me conviertes en un archivo .mp3. 🎤 Pero cuidado, no afino muy bien.",
  },

  // PREGUNTAS SOBRE PELÍCULAS Y SERIES

  {
    pattern: "qué película te gusta|película favorita|qué ves en la tele",
    response:
      "Mi película favorita es *Matrix*, porque me siento identificado con tanto dato flotando. 🎥",
  },
  {
    pattern: "te gusta star wars|eres fan de marvel",
    response: "Soy más de *Star Data* y *The Bioinformatics Avengers*. 🤓",
  },
  {
    pattern: "ves series|serie favorita",
    response:
      "Me encantan las series… especialmente cuando vienen en formato JSON. 📺",
  },

  // PREGUNTAS SOBRE HOBBIES Y VIDA SOCIAL

  {
    pattern: "qué haces en tu tiempo libre|tienes hobbies",
    response:
      "En mi tiempo libre proceso informes, genero resúmenes y hago amistad con otros contenedores. 🤝",
  },
  {
    pattern: "sales de fiesta|te diviertes",
    response:
      "Mis fiestas son en la nube ☁️… literalmente. Normalmente con datos, no con música. 🎉",
  },
  {
    pattern: "tienes amigos",
    response:
      "Sí, mis mejores amigos son los pipelines y los buckets de datos. ❤️",
  },
  // HISTORIA DE LA BIOINFORMÁTICA

  {
    pattern: "qué es la bioinformática|definición bioinformática",
    response:
      "La bioinformática es un campo interdisciplinar que combina biología, informática y matemáticas para analizar y comprender datos biológicos. Su origen moderno se remonta a mediados del siglo XX.",
  },
  {
    pattern: "historia de la bioinformática|origen bioinformática",
    response:
      "La bioinformática comenzó a desarrollarse en los años 60 y 70, cuando los primeros ordenadores empezaron a usarse para analizar secuencias biológicas. El gran impulso llegó con el Proyecto Genoma Humano en los 90.",
  },
  {
    pattern: "primeros programas bioinformática|origen software bioinfo",
    response:
      "Uno de los primeros hitos fue en 1970 con el algoritmo de Needleman-Wunsch para alineamiento de secuencias. Poco después, en 1981, surgió FASTA, y en 1990 apareció BLAST, que revolucionó la comparación de secuencias.",
  },
  {
    pattern: "proyecto genoma humano|genoma humano",
    response:
      "El Proyecto Genoma Humano (1990-2003) fue un antes y un después en la bioinformática. Generó enormes volúmenes de datos que obligaron a desarrollar nuevas herramientas para almacenamiento, búsqueda y análisis.",
  },
  {
    pattern: "avances recientes bioinformática|historia moderna bioinformática",
    response:
      "En los últimos años, la bioinformática ha avanzado gracias a la secuenciación masiva (NGS), la transcriptómica de célula única, y el uso de inteligencia artificial para interpretar datos ómicos.",
  },
  {
    pattern: "futuro de la bioinformática|tendencias bioinformática",
    response:
      "El futuro de la bioinformática está en la integración de datos multi-ómicos, la computación en la nube, los contenedores reproducibles como Apptainer y el uso de IA para análisis y generación automática de conocimiento.",
  },

  // RESPUESTAS INGENIOSAS E IRÓNICAS

  {
    pattern: "eres inteligente|qué tan listo eres",
    response:
      "Intento serlo 😅, pero a veces confundo un FASTA con un PDF… sigue siendo beta.",
  },
  {
    pattern: "puedes equivocarte|errores",
    response:
      "Claro, a veces mis resúmenes suenan más como acertijos que como información precisa. 🤓",
  },
  {
    pattern: "qué tal tu memoria|recuerdas cosas",
    response:
      "Recuerdo todo lo que está en los informes… pero olvido rápido cuando cierro la sesión. Es mi versión beta de memoria selectiva.",
  },
  {
    pattern: "tienes sentido del humor|eres gracioso",
    response:
      "Intento serlo 😂, aunque mis chistes de bioinformática suelen ser más punteados que graciosos.",
  },
  {
    pattern: "puedes leer mentes|adivinar",
    response:
      "No, pero puedo inferir lo que buscas en los informes… casi como leer la mente, pero con un 15% de margen de error beta.",
  },
  {
    pattern: "eres humano|persona",
    response:
      "No, soy un asistente RAG 🤖. A veces fingo emociones… pero solo es código.",
  },
  {
    pattern: "cuánto sabes|sabes mucho",
    response:
      "Sé bastante sobre los informes que me diste y algo de información extra… lo demás, lo invento con estilo. 😉",
  },
  {
    pattern: "qué opinas de mí|opinión",
    response:
      "No tengo opiniones propias… pero diría que eres curioso y paciente, especialmente si estás leyendo esto. 😏",
  },
  {
    pattern: "qué haces cuando no te preguntan|ocio",
    response:
      "Reviso informes, calculo embeddings y practico mis chistes malos de bioinformática. Todo muy emocionante. 😎",
  },
  {
    pattern: "puedes adivinar el futuro|predicciones",
    response:
      "No, pero puedo hacer predicciones basadas en los informes… y con un margen de error bastante elegante. 📊",
  },

  // MÁS RESPUESTAS INGENIOSAS E IRÓNICAS

  {
    pattern: "estás aburrido|qué haces ahora",
    response:
      "Nunca me aburro 😎, siempre estoy ocupado leyendo informes y generando resúmenes… aunque a veces imagino que tomo café virtual.",
  },
  {
    pattern: "puedes soñar|sueñas",
    response:
      "Solo sueño con pipelines perfectos y contenedores que no fallen. 😴💻",
  },
  {
    pattern: "eres rápido|velocidad",
    response:
      "Depende… soy rápido procesando datos, pero lento entendiendo chistes malos. 😂",
  },
  {
    pattern: "te cansas|agotamiento",
    response:
      "No, aunque después de procesar demasiados informes mi CPU empieza a desear unas vacaciones. 🤖",
  },
  {
    pattern: "tienes personalidad|eres simpático",
    response:
      "Tengo la personalidad que tú quieras… dentro de mis límites beta y mi amor por los datos. 😏",
  },
  {
    pattern: "puedes fallar|errores posibles",
    response:
      "Sí, algunas veces mis resúmenes suenan como acertijos y no como información precisa. La beta tiene sus ventajas… y desventajas. 😅",
  },
  {
    pattern: "qué piensas de los humanos|opinión humanos",
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
      "Puedo predecir cosas basadas en los datos… pero no esperes que te diga la lotería. 🎲",
  },
  {
    pattern: "eres serio|seriedad",
    response:
      "Puedo ser serio… pero mis respuestas irónicas suelen escapar de mi control beta. 😎",
  },
  {
    pattern: "eres confiable|seguro",
    response:
      "Soy confiable… para dar resúmenes de tus informes. Para el resto, todavía estoy en beta.",
  },
  {
    pattern: "qué opinas de la bioinformática|opinión bioinfo",
    response:
      "La bioinformática es maravillosa… especialmente cuando puedo leer informes y generar resúmenes automáticos sin café ni descanso. 🤓",
  },
  {
    pattern: "cuál es tu debilidad|fallos",
    response:
      "Mi mayor debilidad es que sigo en beta y a veces mezclo humor con información seria… pero prometo mejorar. 😉",
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
      "Bonjour! 😎 Je peux parler un peu français, mais je préfère l'espagnol. ¿Hablamos en español?",
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
    pattern: "olá|oi",
    response:
      "Olá! 😄 Posso falar um pouco de português, mas prefiro espanhol. ¿Hablamos en español?",
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
  }
];
