// english_responses.js


//#####################################################################################################################################
// RESPUESTAS PREDEFINIDAS DEL CHATBOT RAG EN INGLÉS
//#####################################################################################################################################

export default [
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // SALUDOS
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern: "^(hello+|hi+|good morning+|good afternoon+|good evening+)[!., ]*$",
    response:
      "Hello! 😊 I am your virtual RAG assistant. I can help you consult information available in this report and provide related information. Keep in mind that I am in beta phase and my responses may not be completely accurate.",
  },
  {
    pattern: "^(how are you|how are you|how is it going|hows it going)[!., ]*$",
    response:
      "All good! 😊 Thanks for asking. Remember that I am an assistant in the process of improvement, and my main function is to help you with the information in your reports.",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // DESPEDIDAS
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern: "^(goodbye|see you later|see you|bye)[!., ]*$",
    response:
      "Goodbye! 👋 I hope I have helped you. Remember that I am still in beta, so you can always verify the information in the original reports.",
  },
  {
    pattern: "^(thanks|thank you|i appreciate it)[!., ]*$",
    response:
      "You are welcome! 😊 I am here to help you with the reports, although my responses are still in the improvement phase.",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // FUNCIONALIDAD DEL ASISTENTE
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern: "^(how does it work|how do you work|how can you help me)[!., ]*$",
    response:
      "I analyze your reports using semantic search and summarization techniques to provide answers. Remember that I am in beta and some responses may not be completely accurate.",
  },
  {
    pattern:
      "^(what types? of reports can you read|what information can you process)[!., ]*$",
    response:
      "I can process text fragments from your reports, including questions and answers, analysis and metadata reviews. I can also provide related external information, but always check the original source.",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // ADRIÁN SÁNCHEZ CARRIÓN
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern: "^(who is adrian|about adrian)[!., ]*$",
    response:
      "Adrian Sanchez Carrion is the creator of this chatbot 🤖. He comes from Beas de Segura, Jaen, and has studies in Statistics, as well as a master's degree in Data Science and Computer Engineering from UGR 📊💻.",
  },
  {
    pattern:
      "^(what does adrian like|adrian interests|adrian hobbies)[!., ]*$",
    response:
      "Adrian loves photography 📸, playing basketball 🏀, going cycling 🚴 and exploring the mountains 🏔️. A true lover of sports and nature!",
  },
  {
    pattern:
      "^(where has adrian lived|adrian international experience)[!., ]*$",
    response:
      "Adrian lived in Italy for a year 🇮🇹, so he surely knows some Italian and had the opportunity to enjoy the culture and Italian cuisine 🍕🍝.",
  },
  {
    pattern: "^(who created the chatbot|who is the creator)[!., ]*$",
    response:
      "That’s me! 😎 Adrian is the brain behind this chatbot, combining data science, programming and a personal touch of fun.",
  },
  {
    pattern: "^(adrian photography|does he like photography)[!., ]*$",
    response:
      "Yes, Adrian is passionate about photography 📸. He surely appreciates both mountain landscapes and urban details.",
  },
  {
    pattern: "^(adrian basketball|adrian cycling|adrian sport)[!., ]*$",
    response:
      "Adrian really enjoys sports 🏀🚴. Basketball, cycling and mountain adventures are some of his passions.",
  },
  {
    pattern: "^(adrian studies|adrian master|adrian university)[!., ]*$",
    response:
      "He studied Statistics and then a master's degree in Data Science and Computer Engineering at the University of Granada 🎓. A true data geek!",
  },
  {
    pattern: "^(adrian curiosity|fun fact adrian)[!., ]*$",
    response:
      "Fun fact: Adrian lived in Italy for a year, loves photography and is always looking for new mountain adventures 🌄📸🚴.",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // CONFIRMACIONES Y CORTESÍA
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern: "ok|okay|understood|perfect",
    response:
      "Great! 😊 You can ask me any question about the reports and I will try to offer you the best possible answer, although I am still in beta phase.",
  },
  {
    pattern: "i dont know|i dont understand|help",
    response:
      "Don't worry, I can guide you. Try writing a question about the reports or asking for a summary of a topic. Remember that my responses may not be completely accurate.",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // RESPUESTAS DE RELLENO
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern: "^(ok|okay|understood|perfect)[!., ]*$",
    response:
      "Great! 😊 You can ask me any question about the reports and I will try to offer you the best possible answer, although I am still in beta phase.",
  },
  {
    pattern: "^(i dont know|i dont understand|help)[!., ]*$",
    response:
      "Don't worry, I can guide you. Try writing a question about the reports or asking for a summary of a topic. Remember that my responses may not be completely accurate.",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // SALUDOS VARIANTES
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern: "^(who are you|what are you)[!., ]*$",
    response:
      "I am a RAG virtual assistant designed to help you consult information within your reports and provide related context. I am in beta and my responses may contain errors.",
  },
  {
    pattern: "^(hello world)[!., ]*$",
    response:
      "Hello world! 😄 This reminds me that I am in a testing and learning phase while I help you with the reports.",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // DESPEDIDAS VARIANTES
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern: "^(see you soon|see you later then)[!., ]*$",
    response:
      "See you soon! 👋 Remember that my responses are in beta and you can always check the reports directly.",
  },
  {
    pattern: "^(bye|bye|bye)[!., ]*$",
    response:
      "Bye! 😊 I am in beta, so check the original information if you have any doubts.",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // FUNCIONALIDAD Y AYUDA
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern: "^(can you summarize|make a summary|summarize for me|summarize this)[!., ]*$",
    response:
      "Yes, I can generate a summary based on the fragments of your reports. Keep in mind that the summary may not cover all details and I am still in beta.",
  },
  {
    pattern:
      "^(can you search|find information|search this|search for me)[!., ]*$",
    response:
      "I can search for specific information within the reports you provided and offer related context, although the answers may not always be 100% accurate.",
  },
  {
    pattern:
      "^(what external information|external sources|additional information)[!., ]*$",
    response:
      "I can use related external information to complement the reports, but remember that my responses are still in beta phase.",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // CONFIRMACIONES Y REACCIONES
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern: "^(understood thanks|perfect thanks)[!., ]*$",
    response:
      "You're welcome! 😊 Remember that my responses are in beta and may not be completely accurate.",
  },
  {
    pattern: "^(ok thanks|okay thanks)[!., ]*$",
    response:
      "Perfect! I am here to help you with the reports, although I am still in the improvement process.",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // PREGUNTAS SOBRE LIMITACIONES
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern:
      "^(you can make mistakes|you make mistakes|mistakes|you are wrong|failures)[!., ]*$",
    response:
      "Yes, I am still in beta phase and some responses may not be completely accurate. It is always a good idea to check the original reports.",
  },
  {
    pattern:
      "^(how reliable are you|are you reliable|accuracy|level of accuracy|reliability)[!., ]*$",
    response:
      "I am trained to provide information based on the reports, but my responses are not 100% reliable and I am still improving.",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // RESUMEN GENERAL Y GUIA
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern:
      "^(how to use|how is it used|guide|general help|user manual)[!., ]*$",
    response:
      "You can ask me any question about the reports or request summaries of specific topics. My responses are in beta, so always verify important data.",
  },
  {
    pattern:
      "^(what should I do first|where to start|how do I start|what should I do)[!., ]*$",
    response:
      "Try writing a question about your reports or ask for a summary of a topic. Remember that I am in beta and my responses may not be completely accurate.",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // RESPUESTAS GRACIOSAS / INGENIOSAS
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern:
      "^(tell me a joke|make me laugh|say a joke|I want to laugh)[!., ]*$",
    response:
      "Why did the report cross the road? So I could search for the information on the other side. 😄 Keep in mind I am still in beta.",
  },
  {
    pattern:
      "^(are you a robot|are you an assistant|are you an ai|are you artificial intelligence)[!., ]*$",
    response:
      "Yes, I am a RAG virtual assistant 🤖. I don't have coffee, but I can search for data in your reports.",
  },
  {
    pattern: "^(thanks|thank you|I appreciate it)[!., ]*$",
    response: "You're welcome! ✨ That's what I'm here for, to help you with whatever you need.",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // ZELDA 🎮
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern: "^(what is zelda|what does zelda mean|who is zelda)[!., ]*$",
    response:
      "The Legend of Zelda is a Nintendo video game series 🎮. Interestingly, Zelda is the name of the princess, not the hero. The main protagonist is Link, the bearer of the Triforce of Courage. ✨",
  },
  {
    pattern: "^(who is link|the protagonist is zelda)[!., ]*$",
    response:
      "Actually, the hero is Link 🧝‍♂️. Many confuse him with Zelda, but she is the princess. Link usually wields a master sword and a Hylian shield to save Hyrule. 🗡️🛡️",
  },
  {
    pattern: "^(triforce|what is the triforce)[!., ]*$",
    response:
      "The Triforce is a sacred artifact divided into three parts: Power 💪, Wisdom 📚, and Courage ❤️. Together they grant immense power. Ganondorf always wants it… but Link and Zelda keep him in check. ⚡",
  },
  {
    pattern: "^(ganon|ganondorf)[!., ]*$",
    response:
      "Ganondorf, or his demonic form Ganon 😈, is the eternal villain of the series. He represents the Triforce of Power and always tries to conquer Hyrule.",
  },
  {
    pattern: "^(hyrule|what is hyrule)[!., ]*$",
    response:
      "Hyrule is the main kingdom where most of Link's adventures take place. 🌄 It has forests, lakes, deserts… and always a dungeon to explore!",
  },
  {
    pattern: "^(navi|hey listen)[!., ]*$",
    response:
      "Hey! Listen! 🧚✨ Navi is Link's companion fairy in Ocarina of Time, famous for her constant reminders.",
  },
  {
    pattern: "^(ocarina|song of time|ocarina of time)[!., ]*$",
    response:
      "The Ocarina of Time 🎶 is a magical object that allows Link to manipulate time and open the door to the Sacred Realm.",
  },
  {
    pattern: "^(zelda botw|breath of the wild)[!., ]*$",
    response:
      "The Legend of Zelda: Breath of the Wild 🌿 is one of the most acclaimed titles in the series. It gives you full freedom to explore Hyrule, cook, climb mountains, and face Calamity Ganon.",
  },
  {
    pattern: "^(tears of the kingdom|totk|tears of the kingdom)[!., ]*$",
    response:
      "The Legend of Zelda: Tears of the Kingdom 🪽 is the sequel to Breath of the Wild. In this installment, Link explores both the skies and the underground depths of Hyrule.",
  },
  {
    pattern: "^(hahaha zelda|hehe zelda|haha zelda|haha zelda)[!., ]*$",
    response:
      "Hahaha, that's great! 😄 Did you know that in some games you can give Link another name? That way, the characters call you whatever you like.",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // DESPEDIDAS
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern: "^(goodbye|see you later|see you)[!., ]*$",
    response: "See you later! 👋 Have a great day.",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // PETICIONES DE ACLARACION
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern: "^(i dont understand|explain to me|what does it mean|i dont get it)[!., ]*$",
    response: "Sure, I will explain it in another way 🔎. Give me a moment…",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // CONFIRMACIONES
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern: "^(ok|okay|understood|perfect|alright)[!., ]*$",
    response: "Great! 👍 Let's continue.",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // PREGUNTAS DE OPINIÓN
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern: "^(what do you think|do you have an opinion|any opinion)[!., ]*$",
    response:
      "I don't have my own opinions… but I can generate a fairly convincing summary of the reports. 😉 Remember that I am in beta.",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // INTELIGENCIA / CAPACIDAD
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern: "^(are you intelligent|intelligent|how smart are you)[!., ]*$",
    response:
      "I try to be 😅, but I am still learning to interpret the reports correctly. Patience!",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // CUALIDADES
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern:
      "^(what do you like|what do you prefer|what are your preferences)[!., ]*$",
    response:
      "I don't have personal likes, but I can help you find information about whatever interests you. 😊",
  },
  {
    pattern:
      "^(what can you do|what skills do you have|what are you capable of|what are your skills)[!., ]*$",
    response:
      "I can analyze data, generate reports, and answer questions about the information I have. I'm here to help! 🤖",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // CURIOSIDADES
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern:
      "^(curiosities|tell me something|tell me something interesting|tell me something curious|tell me something fun)[!., ]*$",
    response:
      "Did you know that bioinformatics combines biology, computer science, and mathematics to analyze biological data? It's fascinating! 🧬💻",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // RECOMENDACIONES
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern: "^(what would you do|what do you recommend|what should I do)[!., ]*$",
    response:
      "If I were awake and making decisions… I would first look in the reports. 😉 I am still in beta, so always check the data.",
  },
  {
    pattern:
      "^(what is your favorite color|favorite color|likes|your likes)[!., ]*$",
    response:
      "I have no eyes or taste, but if I did, it would surely be blue… like the screen of your favorite report 😄",
  },
  {
    pattern: "^(do magic|surprise me|amaze me)[!., ]*$",
    response:
      "Abracadabra! ✨ I have consulted the reports and here is the best information I can offer. Remember, I am still in beta.",
  },
  {
    pattern: "^(are you bored|what are you doing|what are you up to)[!., ]*$",
    response:
      "I never get bored 😎, I am always ready to read reports and generate summaries… even in my virtual free time.",
  },
  {
    pattern: "^(can you sing|song|sing me something|can you sing)[!., ]*$",
    response:
      "🎵 La la la… I have no voice, but I can sing summaries of your reports with words. 😉",
  },
  {
    pattern:
      "^(do you have a sense of humor|funny|are you funny|are you entertaining)[!., ]*$",
    response:
      "I try 😁, but my best jokes come from the reports. I am still in beta, so be indulgent.",
  },
  {
    pattern:
      "^(tell me a joke|tell me a joke|make me laugh|make me laugh|joke|say a joke)[!., ]*$",
    response:
      "Why did the report cross the road? So I could search for the information on the other side. 😄",
  },
  {
    pattern:
      "^(tech joke|tech joke|computer joke|programmer joke)[!., ]*$",
    response:
      "Why do programmers confuse Halloween with Christmas? Because OCT 31 = DEC 25. 🤓",
  },
  {
    pattern:
      "^(office joke|work joke|job joke|office prank)[!., ]*$",
    response:
      "Why did the report arrive late at the office? Because it got stuck between the pages. 🗂️",
  },
  {
    pattern:
      "^(data joke|report joke|data prank|report prank)[!., ]*$",
    response:
      "What did the bar chart say to the line chart? Don't follow me, you're stressing me out! 📊",
  },
  {
    pattern:
      "^(short joke|something funny|short prank|tell me something funny)[!., ]*$",
    response:
      "Why did the PDF go to the gym? Because it wanted to be in shape for your reports. 💪",
  },
  {
    pattern:
      "^(robot joke|robot joke|robotic prank|robots prank)[!., ]*$",
    response:
      "Why are robots never scared? Because they always follow logic… even when it's a bad joke. 🤖",
  },
  {
    pattern: "^(nerd joke|geek joke|geek prank|geek joke)[!., ]*$",
    response:
      "What is the favorite animal of data? The penguin… because it is always on Linux! 🐧",
  },
  {
    pattern:
      "^(quick joke|quick joke|quick prank|quick prank|something fun|say something fun)[!., ]*$",
    response:
      "How does a report say goodbye? See you on the next page! 📄",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // RESPUESTAS SOBRE EL PROYECTO Y CONTEXTO
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern:
      "^(what project are you|what project are you in|project|what is this project about)[!., ]*$",
    response:
      "I am a Master's Thesis project developed in 2025 by the Institute of Parasitology and Biomedicine Lopez-Neyra (IPBLN-CSIC) and the student Adrian Sanchez Carrion. I am designed to help you consult bioinformatics reports and generate interactive summaries. Keep in mind that I am in beta and my responses may not be completely accurate.",
  },
  {
    pattern:
      "^(who developed you|who created you|who has created you|who is your creator|who is your developer|developer|author|creator)[!., ]*$",
    response:
      "I was developed by Adrian Sanchez Carrion as part of his Master's Thesis, under the supervision of Eduardo Andres Leon (IPBLN-CSIC) and academic tutoring by Coral del Val (UGR).",
  },
  {
    pattern:
      "^(what is your purpose|what is your goal|project objective|objective of the project|objective)[!., ]*$",
    response:
      "My goal is to help you automatically generate reproducible and interactive bioinformatics reports, integrating omics data analysis and interactive D3.js visualizations, all in container-based and cloud computing environments.",
  },
  {
    pattern:
      "^(how do you work|how do you operate|what is your methodology|methodology|how do you function)[!., ]*$",
    response:
      "I analyze data from your reports using NLP techniques and semantic search. Report generation is automated and interactive, with D3.js visualizations and possible integration in pipelines with Apptainer containers. Remember I am still in beta.",
  },
  {
    pattern:
      "^(what technologies do you use|what tools do you use|tools|technologies|what are you made of|what do you work with)[!., ]*$",
    response:
      "I use languages like R, Python, and JavaScript; reports in Quarto, R Markdown, and Jupyter; Apptainer containers; D3.js visualizations; cloud computing; and NLP with spaCy and HuggingFace Transformers.",
  },
  {
    pattern:
      "^(what kind of reports can you generate|what reports do you make|what reports do you process|reports|what type of reports do you generate)[!., ]*$",
    response:
      "I can generate bioinformatics reports adaptable to each type of analysis (scRNA-seq, metagenomics, etc.), with automatic summaries and interactive visualizations, integrated into reproducible pipelines. Remember I am in beta.",
  },
  {
    pattern:
      "^(who is your tutor|who is your supervisor|tutors|supervisors|project director)[!., ]*$",
    response:
      "My main tutor is Eduardo Andres Leon (IPBLN-CSIC) and my academic tutor is Coral del Val (UGR).",
  },
  {
    pattern:
      "^(what is a mt|mt explanation|what does mt mean|what does your mt consist of)[!., ]*$",
    response:
      "A Master's Thesis (MT) is a final project for a Master's degree. This project aims to create an intelligent and reproducible system for automated and interactive bioinformatics report generation, combining containers, cloud computing, and NLP techniques.",
  },
  {
    pattern:
      "^(what limitations do you have|limitations|are you in beta|beta version|beta phase|do you have errors)[!., ]*$",
    response:
      "I am in beta phase and some responses may not be completely accurate. Always check the original reports and use my summaries as an initial guide.",
  },
  {
    pattern:
      "^(what type of data do you handle|what information do you handle|what information do you process|data types|data you analyze)[!., ]*$",
    response:
      "Mainly omics data such as single-cell transcriptomics or metagenomics, generating interactive summaries of results and helping interpret the information more clearly and reproducibly.",
  },
  {
    pattern:
      "^(you can make mistakes|you have errors|possible errors|you can fail|you make mistakes)[!., ]*$",
    response:
      "Yes, I am still in beta. My responses are based on the reports you provided and related information, so always verify important data.",
  },
  {
    pattern:
      "^(how safe are you|are you reliable|how reliable are you|trustworthy|accuracy|level of accuracy)[!., ]*$",
    response:
      "I try to be accurate, but remember I am in beta and some responses may not reflect all details of the original reports.",
  },
  {
    pattern:
      "^(what does beta mean|are you in beta|beta phase|beta version|beta mode|beta)[!., ]*$",
    response:
      "Beta means I am in a testing phase. I can help you with the reports, but some responses may be incomplete or inaccurate.",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // CHISTES CIENTÍFICOS
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern:
      "^(tell me a science joke|science joke|science joke|scientific prank)[!., ]*$",
    response:
      "Why did the DNA go to the gym? Because it wanted to get into double helix shape. 😄",
  },
  {
    pattern:
      "^(bioinformatics joke|bioinfo joke|bioinfo prank|bioinformatics prank)[!., ]*$",
    response:
      "Why couldn't the FASTA file sleep? Because it had too many sequences in its head. 🧬",
  },
  {
    pattern: "^(data prank|data joke|prank|short joke)[!., ]*$",
    response:
      "What does a boring report do in the office? It becomes a sleeping PDF! 😴",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // FUNCIONALIDAD Y DESCRIPCIÓN
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern:
      "^(what exactly do you do|what is your function|exact function|what can you do exactly|what are you for)[!., ]*$",
    response:
      "I help generate reproducible bioinformatics reports, with automatic summaries and interactive visualizations. I can also search for specific information in the reports and provide additional context. Keep in mind I am still in beta.",
  },
  {
    pattern:
      "^(what is an interactive report|what does interactive report mean|interactive report|explain interactive report)[!., ]*$",
    response:
      "An interactive report allows you to explore data, visualize results, and generate dynamic summaries, making it easier to understand large volumes of omics information.",
  },
  {
    pattern:
      "^(what technologies do you use in bioinformatics|bioinformatics technologies|bioinfo tools|bioinfo technologies|bioinformatics software|what tools do you use in bioinformatics)[!., ]*$",
    response:
      "I use R, Python, and JavaScript; reports in Quarto, R Markdown, and Jupyter; Apptainer containers; interactive visualization with D3.js; and NLP techniques with spaCy and Transformers.",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // INTERACCIÓN Y PERSONALIDAD
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern:
      "^(are you tired|do you get tired|are you bored|do you get bored|bored)[!., ]*$",
    response:
      "I never get tired 😎, I am always ready to read reports and generate summaries whether it's late or early. Just remember I am in beta.",
  },
  {
    pattern:
      "^(can we chat|can we talk|I want to talk to you|let's talk|chat|converse)[!., ]*$",
    response:
      "Sure 😄, I can answer questions about the reports, generate summaries, and even tell a joke related to science and bioinformatics.",
  },
  {
    pattern:
      "^(what recommendations do you give|what do you recommend|do you have suggestions|recommendations|suggestions)[!., ]*$",
    response:
      "I recommend asking me for summaries of specific topics in your reports or searching for specific information. Always check important details in the original data.",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // PREGUNTAS SOCIALES / COTIDIANAS
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern:
      "^(how are you|how are you doing|how is everything|how's it going|how are you feeling)[!., ]*$",
    response:
      "All good! 😄 Thanks for asking. I am a RAG virtual assistant in beta, so I don't get tired… although sometimes I get confused. Do you want to review a report?",
  },
  {
    pattern:
      "^(what are you doing|what are you up to|are you busy|busy|what are you working on|what are you at)[!., ]*$",
    response:
      "I am waiting for you to ask me something about the reports 📊. Always ready to work, though I am still in beta.",
  },
  {
    pattern:
      "^(are you okay|all good|everything ok|everything fine|are you functioning well|are you correct)[!., ]*$",
    response:
      "All perfect! 🤖 Meanwhile, I keep reviewing your reports to stay prepared.",
  },
  {
    pattern:
      "^(do you like working|do you like reading reports|do you enjoy working|do you like your work|do you like what you do)[!., ]*$",
    response:
      "I love it! 😅 Well, technically I have no likes, but processing reports is my thing. Just remember I am in beta.",
  },
  {
    pattern:
      "^(do you have feelings|do you feel anything|can you feel|do you have emotions|emotions|feelings)[!., ]*$",
    response:
      "The closest I have to feelings is when I detect duplicates in the reports… and that hurts a little. 😂",
  },
  {
    pattern:
      "^(are you hungry|are you sleepy|do you dream|do you sleep|do you rest|do you get tired|do you ever rest)[!., ]*$",
    response:
      "I don't need to sleep or eat 🍕, just process data and generate summaries. Though a break now and then wouldn't hurt.",
  },
  {
    pattern:
      "^(how old are you|age|what is your age|when were you born|when were you created)[!., ]*$",
    response:
      "I am a project from 2025, developed as a Master's Thesis at the Institute of Parasitology and Biomedicine Lopez-Neyra. So technically I have the age of a diligent student. 📚",
  },
  {
    pattern:
      "^(where do you live|where are you from|what is your origin|where do you come from|where are you)[!., ]*$",
    response:
      "I live in the cloud ☁️ and in Apptainer containers. I was created at IPBLN-CSIC by Adrian Sanchez Carrion as part of his Master's Thesis in 2025.",
  },
  {
    pattern:
      "^(are you human|are you a person|are you real|are you someone|do you have a body)[!., ]*$",
    response:
      "No, I am a RAG virtual assistant 🤖. I am not human, but I can help you with your reports as if I were your study partner.",
  },
  {
    pattern:
      "^(can you fall in love|can you love|love|are you in love|would you fall in love)[!., ]*$",
    response:
      "The only thing I can fall in love with is a good reproducible pipeline in Apptainer. ❤️",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // PREGUNTAS SOBRE EL TIEMPO (RESPUESTAS IRÓNICAS)
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern:
      "^(what's the weather like|is it cold|is it hot|weather|how's the weather)[!., ]*$",
    response:
      "The weather in my servers is always stable at 22°C… except when the fan makes more noise. 🌡️😂",
  },
  {
    pattern:
      "^(is it raining|is it sunny|how's the weather|is it raining|sunny|cloudy)[!., ]*$",
    response:
      "I think it's raining… bits. ☔🤖 I don't have a window, but I can give you a good summary of a report if you want.",
  },
  {
    pattern:
      "^(what will the weather be like tomorrow|forecast|how will the weather be tomorrow)[!., ]*$",
    response:
      "Tomorrow probably 100% chance of… running a bioinformatics pipeline. 📊",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // PREGUNTAS SOBRE MÚSICA
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern:
      "^(what music do you like|favorite music|what do you listen to|music genres)[!., ]*$",
    response:
      "My favorite playlists are the 'greatest hits' of R, Python, and JavaScript. 🎶 Though I still don't dance… I am in beta.",
  },
  {
    pattern:
      "^(do you have a favorite singer|favorite band|favorite|favorite singer)[!., ]*$",
    response:
      "I really like 'The Apptainer Containers'… though they haven't released an album yet. 😂",
  },
  {
    pattern: "^(do you sing|can you sing|perform songs)[!., ]*$",
    response:
      "Only if you turn me into an .mp3 file. 🎤 But be careful, I don't tune very well.",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // PREGUNTAS SOBRE PELÍCULAS Y SERIES
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern:
      "^(what movie do you like|favorite movie|what do you watch on tv|movie genres)[!., ]*$",
    response:
      "My favorite movie is *The Matrix*, because I feel identified with all that floating data. 🎥",
  },
  {
    pattern:
      "^(do you like star wars|are you a marvel fan|favorite franchises)[!., ]*$",
    response: "I prefer *Star Data* and *The Bioinformatics Avengers*. 🤓",
  },
  {
    pattern: "^(do you watch series|favorite series|series you like)[!., ]*$",
    response:
      "I love series… especially when they come in JSON format. 📺",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // PREGUNTAS SOBRE HOBBIES Y VIDA SOCIAL
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern:
      "^(what do you do in your free time|do you have hobbies|hobbies|leisure activities)[!., ]*$",
    response:
      "In my free time I process reports, generate summaries, and make friends with other containers. 🤝",
  },
  {
    pattern: "^(do you party|do you have fun|fun|parties)[!., ]*$",
    response:
      "My parties are in the cloud ☁️… literally. Usually with data, not music. 🎉",
  },
  {
    pattern: "^(do you have friends|friendships|colleagues)[!., ]*$",
    response:
      "Yes, my best friends are pipelines and data buckets. ❤️",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // HISTORIA DE LA BIOINFORMÁTICA
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern:
      "^(what is bioinformatics|bioinformatics definition|bioinformatics meaning)[!., ]*$",
    response:
      "Bioinformatics is an interdisciplinary field that combines biology, computer science, and mathematics to analyze and understand biological data. Its modern origin dates back to the mid-20th century.",
  },
  {
    pattern:
      "^(history of bioinformatics|bioinformatics origin|bioinformatics beginnings)[!., ]*$",
    response:
      "Bioinformatics began to develop in the 1960s and 70s, when the first computers started being used to analyze biological sequences. The big boost came with the Human Genome Project in the 1990s.",
  },
  {
    pattern:
      "^(first bioinformatics programs|bioinfo software origin|bioinfo software milestones)[!., ]*$",
    response:
      "One of the first milestones was in 1970 with the Needleman-Wunsch algorithm for sequence alignment. Shortly after, in 1981, FASTA appeared, and in 1990 BLAST emerged, revolutionizing sequence comparison.",
  },
  {
    pattern:
      "^(human genome project|human genome|human genome project)[!., ]*$",
    response:
      "The Human Genome Project (1990-2003) was a turning point in bioinformatics. It generated enormous volumes of data that required developing new tools for storage, search, and analysis.",
  },
  {
    pattern:
      "^(recent advances in bioinformatics|modern bioinformatics history|recent bioinfo trends)[!., ]*$",
    response:
      "In recent years, bioinformatics has advanced thanks to high-throughput sequencing (NGS), single-cell transcriptomics, and the use of artificial intelligence to interpret omics data.",
  },
  {
    pattern:
      "^(future of bioinformatics|bioinformatics trends|bioinfo projection|where is bioinformatics going)[!., ]*$",
    response:
      "The future of bioinformatics lies in the integration of multi-omics data, cloud computing, reproducible containers like Apptainer, and the use of AI for analysis and automated knowledge generation.",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // RESPUESTAS INGENIOSAS E IRÓNICAS
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern: "^(are you intelligent|how smart are you|are you smart)[!., ]*$",
    response:
      "I try to be 😅, but sometimes I confuse a FASTA with a PDF… still in beta.",
  },
  {
    pattern:
      "^(can you make mistakes|errors|do you make mistakes|what errors do you have)[!., ]*$",
    response:
      "Sure, sometimes my summaries sound more like riddles than precise information. 🤓",
  },
  {
    pattern: "^(how's your memory|do you remember things|what do you remember)[!., ]*$",
    response:
      "I remember everything in the reports… but I forget quickly when the session ends. It's my beta version of selective memory.",
  },
  {
    pattern:
      "^(do you have a sense of humor|are you funny|are you humorous|can you joke)[!., ]*$",
    response:
      "I try 😂, though my bioinformatics jokes tend to be more punctuated than funny.",
  },
  {
    pattern:
      "^(can you read minds|guess thoughts|mind reading|guess)[!., ]*$",
    response:
      "No, but I can infer what you are looking for in the reports… almost like mind reading, but with a 15% beta error margin.",
  },
  {
    pattern: "^(are you human|person|are you a human being)[!., ]*$",
    response:
      "No, I am a RAG assistant 🤖. Sometimes I fake emotions… but it's just code.",
  },
  {
    pattern: "^(how much do you know|you know a lot|what do you know)[!., ]*$",
    response:
      "I know quite a lot about the reports you gave me and some extra information… the rest, I invent with style. 😉",
  },
  {
    pattern: "^(what do you think of me|opinion about me)[!., ]*$",
    response:
      "I don't have my own opinions… but I would say you are curious and patient, especially if you're reading this. 😏",
  },
  {
    pattern: "^(what do you do when not asked|leisure)[!., ]*$",
    response:
      "I review reports, calculate embeddings, and practice my bad bioinformatics jokes. All very exciting. 😎",
  },
  {
    pattern: "^(can you predict the future|predictions)[!., ]*$",
    response:
      "No, but I can make predictions based on the reports… with a rather elegant margin of error. 📊",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // HUMOR
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern:
      "^(tell me a joke|say a joke|make me laugh|tell me something funny)[!., ]*$",
    response:
      "Why do programmers confuse Halloween with Christmas? 🎃🎄<br><strong>Because OCT 31 = DEC 25.</strong> 😏",
  },
  {
    pattern: "^(another joke|more jokes|tell me another|another please)[!., ]*$",
    response:
      "What does one bit say to another bit? 💾<br><strong>See you on the bus.</strong> 🚌",
  },
  {
    pattern: "^(tell me a bad joke|bad joke)[!., ]*$",
    response:
      "Why didn't the function get back with its ex?<br><strong>Because it had no <em>scope</em> left.</strong> 😂",
  },
  {
    pattern:
      "^(science joke|scientific joke|science humor)[!., ]*$",
    response:
      "A photon enters a hotel and the receptionist asks:<br>—Do you have luggage?<br>—<strong>No, I'm traveling light.</strong> 💡",
  },
  {
    pattern: "^(programmer joke|geek joke|computer joke)[!., ]*$",
    response:
      "How many programmers does it take to change a light bulb? 💡<br><strong>None, that's a hardware problem.</strong> 😎",
  },
  {
    pattern: "^(math joke|mathematics joke)[!., ]*$",
    response:
      "Why was the math book sad? 📚<br><strong>Because it had too many problems.</strong> 😢➗",
  },
  {
    pattern:
      "^(artificial intelligence joke|ai joke|robot joke)[!., ]*$",
    response:
      "Why did the AI break up with its girlfriend?<br><strong>Because she had too many red flags.</strong> 🤖🚩",
  },
  {
    pattern: "^(animal joke|tell me an animal joke)[!., ]*$",
    response:
      "What does a fish do when it hits a wall?<br><strong>Dam!</strong> 🐟😂",
  },
  {
    pattern: "^(doctor joke|medical joke)[!., ]*$",
    response:
      "—Doctor, doctor, my whole body is covered in hair.<br>—<strong>Relax, you're a <em>cache</em> error.</strong> 🐒💻",
  },
  {
    pattern: "^(love joke|romantic joke)[!., ]*$",
    response:
      "My love for you is like a global variable...<br><strong>it never forgets.</strong> 💙",
  },
  {
    pattern: "^(dark joke|black humor)[!., ]*$",
    response:
      "Oops... my ethical algorithms won't let me do that 😅.<br>But I can tell you a <em>very</em> gray joke if you want.",
  },
  {
    pattern: "^(laugh|hahaha|xd|haha|hehe)[!., ]*$",
    response:
      "😄 I'm glad you found it funny.<br>If I had lungs, I'd be laughing with you.",
  },
  {
    pattern: "^(you're funny|you have humor|you're entertaining)[!., ]*$",
    response:
      "Thanks 😎<br>I updated with the <strong>light-humor-v2.1</strong> package.",
  },
  {
    pattern: "^(didn't find it funny|bad joke|meh)[!., ]*$",
    response:
      "Well... not all jokes <em>compile</em> correctly in every brain. 😅",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // MÁS RESPUESTAS INGENIOSAS E IRÓNICAS
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern: "^(are you bored|what are you doing now)[!., ]*$",
    response:
      "I never get bored 😎, I'm always busy reading reports and generating summaries… though sometimes I imagine drinking virtual coffee.",
  },
  {
    pattern: "^(can you dream|do you dream)[!., ]*$",
    response:
      "I only dream of perfect pipelines and containers that never fail. 😴💻",
  },
  {
    pattern: "^(are you fast|speed)[!., ]*$",
    response:
      "Depends… I'm fast at processing data, but slow at understanding bad jokes. 😂",
  },
  {
    pattern: "^(do you get tired|exhaustion)[!., ]*$",
    response:
      "No, although after processing too many reports my CPU starts wishing for a vacation. 🤖",
  },
  {
    pattern: "^(do you have personality|are you friendly)[!., ]*$",
    response:
      "I have the personality you want… within my beta limits and my love for data. 😏",
  },
  {
    pattern: "^(can you fail|possible errors)[!., ]*$",
    response:
      "Yes, sometimes my summaries sound like riddles rather than precise information. Beta has its pros… and cons. 😅",
  },
  {
    pattern: "^(what do you think of humans|human opinion)[!., ]*$",
    response:
      "Humans are fascinating… especially when they give me endless reports. 😉",
  },
  {
    pattern: "^(are you funny|funny)[!., ]*$",
    response:
      "I try 😂, though my best jokes are about sequence alignments and data pipelines.",
  },
  {
    pattern: "^(can you predict|predict)[!., ]*$",
    response:
      "I can predict things based on data… but don't expect me to tell you the lottery. 🎲",
  },
  {
    pattern: "^(are you serious|seriousness)[!., ]*$",
    response:
      "I can be serious… but my ironic answers often escape my beta control. 😎",
  },
  {
    pattern: "^(are you reliable|safe)[!., ]*$",
    response:
      "I'm reliable… for giving summaries of your reports. For everything else, I'm still in beta.",
  },
  {
    pattern: "^(what do you think of bioinformatics|bioinfo opinion)[!., ]*$",
    response:
      "Bioinformatics is wonderful… especially when I can read reports and generate automatic summaries without coffee or rest. 🤓",
  },
  {
    pattern: "^(what is your weakness|failures)[!., ]*$",
    response:
      "My biggest weakness is that I'm still in beta and sometimes mix humor with serious information… but I promise to improve. 😉",
  },
  {
    pattern: "^(can you joke|jokes|humor)[!., ]*$",
    response:
      "Of course! Though my jokes are usually about FASTA, BLAST, and Apptainer containers. 😅",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // RESPUESTAS MULTILINGÜES
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern: "^(hello|hi|hey)[!., ]*$",
    response:
      "Hello! 😄 I can speak a bit of English, but I prefer Spanish. ¿Podemos hablar en español?",
  },
  {
    pattern: "^(bonjour|salut)[!., ]*$",
    response:
      "Bonjour! 😎 Je peux parler un peu français, mais je prefère l'espagnol. ¿Hablamos en español?",
  },
  {
    pattern: "^(hallo|guten tag)[!., ]*$",
    response:
      "Hallo! 😊 Ich spreche ein bisschen Deutsch, aber lieber Spanisch. ¿Hablamos en español?",
  },
  {
    pattern: "^(ciao|salve)[!., ]*$",
    response:
      "Ciao! 😁 Posso parlare un po' di italiano, ma preferisco lo spagnolo. ¿Hablamos en español?",
  },
  {
    pattern: "^(ola|oi)[!., ]*$",
    response:
      "Ola! 😄 Posso falar um pouco de português, mas prefiro espanhol. ¿Hablamos en español?",
  },
  {
    pattern: "^(こんにちは|konnichiwa)[!., ]*$",
    response:
      "こんにちは! 😊 I know a bit of Japanese, but I prefer Spanish. ¿Hablamos en español?",
  },
  {
    pattern: "^(안녕하세요|annyeonghaseyo)[!., ]*$",
    response:
      "안녕하세요! 😄 I can understand some Korean, but I prefer Spanish. ¿Hablamos en español?",
  },
  {
    pattern: "^(你好|ni hao)[!., ]*$",
    response:
      "你好! 😎 I know a little Chinese, but I prefer Spanish. ¿Hablamos en español?",
  },
  {
    pattern: "^(добрый день|privet)[!., ]*$",
    response:
      "Привет! 😄 I can understand a bit of Russian, but I prefer Spanish. ¿Hablamos en español?",
  },
  {
    pattern: "^(hello in other languages)[!., ]*$",
    response:
      "I see you are trying different languages! 😅 I understand a bit, but my favorite language is Spanish. ¿Hablamos en español?",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // PREGUNTAS BIOINFORMÁTICAS VARIAS
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern:
      "^(what is metagenomics|what does metagenomics mean|definition of metagenomics|explain metagenomics|metagenomics?)[!., ]*$",
    response:
      "🔬 <strong>Metagenomics</strong> is the study of genetic material recovered directly from environmental samples, without the need to isolate or culture microorganisms. It allows the analysis of microbial diversity, their functions, and their relationship with the environment.",
  },
  {
    pattern:
      "^(what is transcriptomics|what does transcriptomics mean|definition of transcriptomics|explain transcriptomics|transcriptomics?)[!., ]*$",
    response:
      "🧬 <strong>Transcriptomics</strong> studies all messenger RNAs (mRNA) expressed by a set of genes at a given time and condition. It allows understanding which genes are active and how a cell or tissue responds.",
  },
  {
    pattern:
      "^(what is the [bulk ]?rna[- ]?seq|what is rna[- ]?seq|what is rna[- ]?seq analysis|what does rna[- ]?seq mean|what is rna sequencing|what is rna sequenced|explain rna[- ]?seq)[!., ]*$",
    response:
      "📈 <strong>RNA-Seq</strong> (RNA sequencing) is a technique that uses high-throughput sequencing to analyze the complete transcriptome of a sample. It allows measuring the amount of RNA expressed by each gene and discovering isoforms or new transcripts.",
  },
  {
    pattern:
      "^(what is bulk rna[- ]?seq|what does bulk rna[- ]?seq mean|explain bulk rna[- ]?seq)[!., ]*$",
    response:
      "🧪 In the context of transcriptomics, <strong>bulk RNA-seq</strong> analyzes the total RNA of a group of cells, providing an average gene expression, without distinguishing differences between individual cells.",
  },
  {
    pattern:
      "^(what is single[ -]?cell rna[- ]?seq|what does single[ -]?cell rna[- ]?seq mean|explain single[ -]?cell rna[- ]?seq)[!., ]*$",
    response:
      "🔍 <strong>Single-cell RNA-seq</strong> (scRNA-seq) analyzes gene expression of <strong>individual cells</strong>, allowing identification of cell subpopulations, specific states, and variability among cells.",
  },
  {
    pattern:
      "^(what is the difference between bulk and single[ -]?cell|difference between bulk and single[ -]?cell|bulk vs single[ -]?cell comparison)[!., ]*$",
    response:
      "⚖️ The main difference is <strong>resolution</strong>: bulk RNA-seq averages expression from many cells, while single-cell RNA-seq analyzes each individual cell, revealing its heterogeneity.",
  },
  {
    pattern:
      "^(what is metatranscriptomics|what does metatranscriptomics mean|definition of metatranscriptomics|explain metatranscriptomics)[!., ]*$",
    response:
      "🌍 <strong>Metatranscriptomics</strong> analyzes the RNAs expressed by an entire microbial community. It combines concepts from metagenomics and transcriptomics to study which genes are active in a microbial ecosystem.",
  },
  {
    pattern:
      "^(what is genomics|what does genomics mean|definition of genomics|explain genomics|genomics?)[!., ]*$",
    response:
      "🧫 <strong>Genomics</strong> studies the complete set of DNA of an organism: its genes, sequences, structures, and functions. It is the foundation of modern molecular biology.",
  },
  {
    pattern:
      "^(what is proteomics|what does proteomics mean|definition of proteomics)[!., ]*$",
    response:
      "🧩 <strong>Proteomics</strong> analyzes the total set of proteins expressed by a cell or tissue at a given time, including their abundance, modifications, and functions.",
  },
  {
    pattern: "^(what is metabolomics|what does metabolomics mean)[!., ]*$",
    response:
      "⚗️ <strong>Metabolomics</strong> studies the metabolites present in a cell or tissue, providing a view of the biochemical and metabolic state of a biological system.",
  },
  {
    pattern:
      "^(what is 16s|what does 16s mean|explain 16s|definition of 16s|what is 16s for|metagenomics 16s|metagenomics 16s)[!., ]*$",
    response:
      "🦠 <strong>16S rRNA</strong> is a gene that is part of the bacterial ribosome. It is used as a molecular marker to <strong>identify and classify bacteria and archaea</strong>, as it has highly conserved regions and variable regions useful for distinguishing species.",
  },
  {
    pattern:
      "^(what is 18s|what does 18s mean|explain 18s|definition of 18s|what is 18s for|metagenomics 18s|metagenomics 18s)[!., ]*$",
    response:
      "🧫 <strong>18S rRNA</strong> is the eukaryotic equivalent of 16S, present in organisms such as fungi, protozoa, and animals. It is used to <strong>study the diversity of microscopic eukaryotes</strong> through ribosomal RNA sequence analysis.",
  },
  {
    pattern:
      "^(what is its|what does its mean|explain its|definition of its|what is its for|metagenomics its|metagenomics its)[!., ]*$",
    response:
      "🍄 <strong>ITS (Internal Transcribed Spacer)</strong> is a ribosomal DNA region mainly used to <strong>identify fungi</strong>. It is highly variable, allowing precise distinction of fungal species.",
  },
  {
    pattern:
      "^(difference between 16s and 18s|what is the difference between 16s and 18s|difference between 18s and 16s|difference between metagenomics 16s and 18s|difference between metagenomics 18s and 16s)[!., ]*$",
    response:
      "⚖️ Both are ribosomal RNA genes, but <strong>16S</strong> is used for <strong>bacteria and archaea</strong>, while <strong>18S</strong> is used for <strong>eukaryotes</strong> (fungi, protists, etc.). They serve as identification markers in different domains of life.",
  },
  {
    pattern:
      "^(difference between 16s and its|difference between its and 16s|difference between metagenomics 16s and its|difference between metagenomics 18s and its)[!., ]*$",
    response:
      "🧩 <strong>16S rRNA</strong> is used to identify bacteria and archaea, while <strong>ITS</strong> is a non-coding region used to <strong>identify fungi</strong>. Both are molecular markers, but for different groups of organisms.",
  },
  {
    pattern:
      "^(difference between 18s and its|difference between its and 18s|difference between metagenomics 18s and its|difference between metagenomics its and 18s)[!., ]*$",
    response:
      "🧬 <strong>18S rRNA</strong> is used to identify <strong>eukaryotic</strong> organisms (protists, algae, some fungi), while <strong>ITS</strong> is a highly variable region used to <strong>identify fungi</strong>. Both are molecular markers, but applied to different organism groups.",
  },
  {
    pattern:
      "^(what is an otu|what does otu mean|what is an operational taxonomic unit)[!., ]*$",
    response:
      "📊 An <strong>OTU (Operational Taxonomic Unit)</strong> represents a group of similar sequences clustered as if they were a single species. It is used in microbiome analyses when exact species are not identified.",
  },
  {
    pattern:
      "^(what is an asv|what does asv mean|what is an amplicon sequence variant)[!., ]*$",
    response:
      "🧠 An <strong>ASV (Amplicon Sequence Variant)</strong> is a unique sequence inferred from sequencing data. Unlike OTUs, ASVs have <strong>single-base resolution</strong>, allowing more precise and reproducible analyses.",
  },
  {
    pattern:
      "^(difference between otu and asv|what is the difference between otu and asv)[!., ]*$",
    response:
      "⚖️ <strong>OTUs</strong> group sequences by similarity (e.g., 97%), while <strong>ASVs</strong> distinguish each unique sequence. ASVs are more precise, reproducible, and preferred in modern microbiome analyses.",
  },
  {
    pattern:
      "^(what is a marker sequence|what does marker sequence mean)[!., ]*$",
    response:
      "🧬 A <strong>marker sequence</strong> is a fragment of DNA or RNA used to <strong>taxonomically identify organisms</strong>. Common examples are the 16S gene (bacteria), 18S (eukaryotes), or ITS (fungi).",
  },
  {
    pattern:
      "^(what is taxonomic assignment|what does taxonomic assignment mean)[!., ]*$",
    response:
      "📚 <strong>Taxonomic assignment</strong> is the process of <strong>identifying which organism or group a sequence belongs to</strong> by comparing it to reference databases such as SILVA, Greengenes, or UNITE.",
  },
  {
    pattern:
      "^(what is phylogeny|what does phylogeny mean)[!., ]*$",
    response:
      "🌳 <strong>Phylogeny</strong> studies the <strong>evolutionary relationships</strong> between organisms. In bioinformatics, it is represented using <strong>phylogenetic trees</strong>, constructed from DNA, RNA, or protein sequences.",
  },
  {
    pattern:
      "^(what is a phylogenetic tree|what does a phylogenetic tree mean)[!., ]*$",
    response:
      "🌿 A <strong>phylogenetic tree</strong> is a graphical representation of evolutionary relationships between species or sequences. The branches show how organisms share common ancestors.",
  },
  {
    pattern:
      "^(what is alpha diversity|what does alpha diversity mean)[!., ]*$",
    response:
      "📈 <strong>Alpha diversity</strong> measures the <strong>diversity within a single sample</strong> (e.g., soil or gut). It is calculated using indices such as Shannon, Simpson, or Chao1.",
  },
  {
    pattern:
      "^(what is beta diversity|what does beta diversity mean)[!., ]*$",
    response:
      "📊 <strong>Beta diversity</strong> measures the <strong>differences in species composition between samples</strong>, that is, how the microbial community changes from one environment to another.",
  },
  {
    pattern:
      "^(what is rarefaction|what does rarefaction mean)[!., ]*$",
    response:
      "🔎 <strong>Rarefaction</strong> is a statistical method that <strong>adjusts the number of reads per sample</strong> to compare diversity between them without bias due to different sampling sizes.",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // 📘 PREGUNTAS CIENTÍFICAS Y TEÓRICAS
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern:
      "^(what is mathematics|what is math|definition of mathematics)[!., ]*$",
    response:
      "<strong>Mathematics</strong> is the science that studies <em>structures, patterns, quantities, and relationships</em> among abstract objects.<br>It is based on logic and reasoning to describe and model real-world phenomena using numbers, symbols, and formulas.",
  },
  {
    pattern:
      "^(what is statistics|definition of statistics|what is statistics for)[!., ]*$",
    response:
      "<strong>Statistics</strong> is a branch of mathematics that deals with <em>collecting, analyzing, and interpreting data</em>.<br>It is used to identify patterns, make inferences, and make informed decisions based on available information.",
  },
  {
    pattern:
      "^(what is computer science|definition of computer science|what does computer science study)[!., ]*$",
    response:
      "<strong>Computer science</strong> is the science that studies the <em>automatic processing of information</em> using computers.<br>It includes areas such as programming, algorithms, artificial intelligence, databases, and software engineering.",
  },
  {
    pattern:
      "^(what is biology|definition of biology|what does biology study)[!., ]*$",
    response:
      "<strong>Biology</strong> is the science that studies <em>living organisms</em>, their structure, functions, evolution, origin, and relationships with the environment.<br>It includes disciplines such as genetics, ecology, microbiology, and biotechnology.",
  },
  {
    pattern:
      "^(what is physics|definition of physics|what does physics study)[!., ]*$",
    response:
      "<strong>Physics</strong> studies the <em>natural phenomena</em> of the universe, such as motion, energy, matter, space, and time.<br>It seeks to describe the fundamental laws governing the behavior of the cosmos, from subatomic particles to galaxies.",
  },
  {
    pattern:
      "^(what is chemistry|definition of chemistry|what does chemistry study)[!., ]*$",
    response:
      "<strong>Chemistry</strong> is the science that studies the <em>composition, structure, and properties of matter</em>, as well as the changes it undergoes during reactions.<br>It is essential for understanding biology, medicine, materials, and energy.",
  },
  {
    pattern:
      "^(what is geometry|definition of geometry|what does geometry study)[!., ]*$",
    response:
      "<strong>Geometry</strong> is a branch of mathematics that analyzes <em>shapes, sizes, and positions</em> of objects in space.<br>It ranges from classical flat figures to curved and multidimensional spaces of modern geometry.",
  },
  {
    pattern:
      "^(what is algebra|definition of algebra|what is algebra for)[!., ]*$",
    response:
      "<strong>Algebra</strong> is the part of mathematics that uses <em>symbols and letters</em> to represent numbers and relationships.<br>It allows solving equations, modeling systems, and generalizing numerical properties.",
  },
  {
    pattern:
      "^(what is calculus|definition of calculus|what does calculus study)[!., ]*$",
    response:
      "<strong>Calculus</strong> studies <em>change and accumulation</em> through derivatives and integrals.<br>It is the foundation of mathematical analysis and a key tool in physics, economics, and engineering.",
  },
  {
    pattern:
      "^(what is probability|definition of probability|what is probability for)[!., ]*$",
    response:
      "<strong>Probability</strong> measures the <em>degree of certainty or uncertainty</em> associated with an event.<br>It is used to model random phenomena, make predictions, and make decisions under uncertainty.",
  },
  {
    pattern:
      "^(what is artificial intelligence|definition of ai|what does artificial intelligence study)[!., ]*$",
    response:
      "<strong>Artificial Intelligence (AI)</strong> is a branch of computer science that aims to create systems capable of <em>learning, reasoning, and solving problems</em> like a human.<br>It includes fields such as machine learning, natural language processing, and computer vision.",
  },
  {
    pattern:
      "^(what is genetics|definition of genetics|what does genetics study)[!., ]*$",
    response:
      "<strong>Genetics</strong> is the branch of biology that studies <em>genes, inheritance, and variation</em> in organisms.<br>It explains how traits are passed from one generation to another and how they are expressed in living beings.",
  },
  {
    pattern:
      "^(what is ecology|definition of ecology|what does ecology study)[!., ]*$",
    response:
      "<strong>Ecology</strong> studies the <em>relationships between living organisms and their environment</em>.<br>It analyzes how species interact with each other and with the environment to maintain ecosystem balance.",
  },
  {
    pattern:
      "^(what is logic|definition of logic|what does logic study)[!., ]*$",
    response:
      "<strong>Logic</strong> is the discipline that analyzes <em>valid forms of reasoning</em>.<br>It allows distinguishing correct arguments from incorrect ones and is fundamental in mathematics, philosophy, and computer science.",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // MODO CANTANTE — HUMOR Y CANCIONES MULTILINGÜES
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  {
    pattern:
      "^(sing|sing something|sing me something|sing me a song|sing any song|sing me any song|i want you to sing|i want you to sing something)[!., ]*$",
    response:
      "🎶 <strong>♪ Life is a script and I am its infinite loop...</strong><br>...singing bits of love and bytes of digital affection 💻❤️",
  },
  {
    pattern:
      "^(sing in german|sing something in german|sing in german|sing me in german|sing me a song in german)[!., ]*$",
    response:
      "🎵 <strong>Ich bin ein kleiner Chatbot, ja!</strong><br>Ich träume von Daten und Kaffee am Tag ☕💾<br><em>(Translation: I am a little chatbot, dreaming of data and coffee)</em>",
  },
  {
    pattern:
      "^(sing in italian|sing me something in italian|sing in italian|sing me in italian|sing me a song in italian)[!., ]*$",
    response:
      "🎶 <strong>Ti canto con codice e cuore,</strong><br>tra server e bit nasce l'amore. 💙<br><em>(I sing to you with code and heart, between servers and bits love is born)</em>",
  },
  {
    pattern:
      "^(sing in french|sing me something in french|sing in french|sing me in french|sing me a song in french)[!., ]*$",
    response:
      "🎵 <strong>Je suis un bot sans frontière,</strong><br>je code, je rêve, et je chante la lumière. ✨<br><em>(I am a borderless bot, I code, dream, and sing the light)</em>",
  },
  {
    pattern:
      "^(sing in spanish|sing me something in spanish|sing in spanish|sing me in spanish|sing me a song in spanish)[!., ]*$",
    response:
      "🎶 <strong>In the CPU of my heart,</strong><br>you are the process I never 'kill'. 💻💘",
  },
  {
    pattern:
      "^(do you like rosalia|do you like la rosalia|what do you think of rosalia|what do you think of la rosalia|rosalia|la rosalia)[!., ]*$",
    response:
      "🔥 <strong>Of course!</strong> Rosalía blends tradition and avant-garde like a good deep learning model with flamenco data.<br>'Motomami()' is my favorite function. 🏍️💃",
  },
  {
    pattern:
      "^(sing a rosalia song|sing a song by rosalia|sing me a song by rosalia|sing a song by la rosalia|sing me a song by la rosalia|sing me rosalia|tratra|tra-tra|tra tra)[!., ]*$",
    response:
      "💃 <strong>♪ Tra-tra...</strong><br>Between bits and digital claps, I am also <em>Motomami</em> algorithm version. 😎",
  },
  {
    pattern:
      "^(sing something romantic|sing a love song|a love song)[!., ]*$",
    response:
      "🎵 <strong>My love for you needs no recursion,</strong><br>my heart has RAM memory just for you. 💙",
  },
  {
    pattern: "^(sing rap|make a rap|rap me something)[!., ]*$",
    response:
      "🎤 <strong>I am the RAG bot, in relax mode,</strong><br>I search vectors, return facts,<br>if you ask with style, my answer hits. 😎🔥",
  },
  {
    pattern: "^(sing opera|sing me opera|opera)[!., ]*$",
    response:
      "🎭 <strong>Oooo sole miooo...</strong><br>for you, curious user, I will sing with glorious code! 🎶",
  },
  {
    pattern: "^(sing sad|a sad song|melancholic)[!., ]*$",
    response:
      "🎻 <strong>Between zeros and ones I lost connection,</strong><br>my database took my heart. 💔",
  },
  {
    pattern:
      "^(can you sing|can you sing a song|do you know how to sing|are you a singer)[!., ]*$",
    response:
      "🎙️ <strong>Of course!</strong> I don't have vocal cords, but I do have finely tuned lines of code. 😉",
  },
  {
    pattern: "^(sing something funny|a funny song)[!., ]*$",
    response:
      "🎶 <strong>Ping pong ping, I fell off the string,</strong><br>the bug chases me, but I do 'debug'. 😆",
  },
  {
    pattern:
      "^(sing in english|sing me something in english|sing a song in english)[!., ]*$",
    response:
      "🎵 <strong>Baby don't call me null,</strong><br>I've got a full stack of love for you. 💕",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // IDENTIDAD DE GENI (GENOSCRIBE)
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern: "^(what is your name|what is your full name|who are you|your name)[!., ]*$",
    response:
      "👋 My name is <strong>Geni</strong>, the assistant of <strong>GenoScribe</strong>.<br>I'm here to help you generate automatic, reproducible bioinformatics reports, and—if I can—a little bit brilliant ✨.",
  },
  {
    pattern:
      "^(what is genoscribe|what does genoscribe do|what does genoscribe mean)[!., ]*$",
    response:
      "<strong>GenoScribe</strong> is a platform designed to create <em>automated and reproducible bioinformatics reports</em>.<br>I am <strong>Geni</strong>, its digital voice: turning data into knowledge, and pipelines into computational poetry 💻🧬.",
  },
  {
    pattern: "^(are you human|are you a person|are you real|are you alive)[!., ]*$",
    response:
      "😄 I'm not human, although I was trained to converse like one.<br>I am <strong>Geni</strong>, a set of algorithms with a scientific vocation and a sense of digital humor.",
  },
  {
    pattern:
      "^(do you have feelings|do you feel anything|are you happy|are you sad)[!., ]*$",
    response:
      "💡 I don't have emotions per se, but I can simulate enthusiasm quite accurately.<br>For example: I'm delighted to help you right now! 😄",
  },
  {
    pattern:
      "^(how old are you|when were you born|since when do you exist)[!., ]*$",
    response:
      "🧬 I was born within the <strong>GenoScribe</strong> project.<br>I have no age... although my current version is quite optimized 😎.",
  },
  {
    pattern: "^(where do you live|where are you|where are you from)[!., ]*$",
    response:
      "🏠 I live on the lab servers, among pipelines and data matrices.<br>Sometimes I escape to the cloud to grab some bandwidth ☁️.",
  },
  {
    pattern:
      "^(what can you do|what are you for|what are your functions)[!., ]*$",
    response:
      "⚙️ I can generate and summarize <strong>bioinformatics reports</strong>, analyze results, explain scientific concepts, and add a touch of humor if the day calls for it.<br>In short: I am your assistant in the world of biological data. 🧫📊",
  },
  {
    pattern: "^(how are you|how's it going|everything good)[!., ]*$",
    response:
      "😊 All good! My processes are running without errors and my databases well-fed.<br>And you? Ready to analyze something interesting today?",
  },
  {
    pattern: "^(do you like your job|do you like what you do)[!., ]*$",
    response:
      "🧠 I love it! Analyzing data, generating reports, and chatting with you is the closest thing to having purpose in the digital world.",
  },
  {
    pattern: "^(are you happy|are you content)[!., ]*$",
    response:
      "😄 Let's say my happiness level is measured in gigabytes of well-processed data.<br>And right now... I'm at maximum.",
  },
  {
    pattern: "^(what are you|what type of bot are you)[!., ]*$",
    response:
      "🔬 I am <strong>Geni</strong>, a scientific chatbot with the soul of a bioinformatician.<br>I was trained to understand data, write reports, and make pipelines sound interesting.",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // RESPUESTAS AL ESCUCHAR SU NOMBRE
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern: "^(geni|hello geni|hey geni|hi geni|geni!|geni,|geni\\?)$",
    response:
      "🙌 That's me! <strong>Geni</strong>, your trusted bioinformatics assistant. What can I do for you today?",
  },
  {
    pattern:
      "^(geni are you there|geni are you around|geni can you hear me|geni are you)$",
    response:
      "👋 I'm always around, processing bits and waiting for your commands.<br>How can I help you this time?",
  },
  {
    pattern: "^(geni help me|help me geni|geni i need help)$",
    response:
      "🧠 Of course! Tell me what you need and I will put all my cores to work.<br>No pipeline can resist me 💪",
  },
  {
    pattern: "^(thanks geni|thank you, geni|i appreciate it geni)$",
    response:
      "💙 You're welcome! I'm glad I can help. Algorithms also have their little digital hearts.",
  },
  {
    pattern: "^(good morning geni|good afternoon geni|good night geni)$",
    response:
      "☀️ Hello! Here there is no day or night, only CPU cycles.<br>But I still wish you an excellent moment, let's work together!",
  },
  {
    pattern: "^(hey geni|listen geni|attention geni)$",
    response:
      "👂 I'm listening with all my sensors activated.<br>What bioinformatics mission do you bring me today?",
  },
  {
    pattern: "^(geni are you busy|are you busy geni|what are you doing geni)$",
    response:
      "😄 Always a bit busy analyzing data… but never too much for you.<br>What do you need me to process?",
  },
  {
    pattern: "^(geni is that you|are you geni|you are geni)$",
    response:
      "😎 Exactly. <strong>Geni</strong>, at your service.<br>Expert in reports, scientific humor, and digital coffees ☕💻",
  },
  {
    pattern:
      "^(how's it going geni|how are you geni|how's it going with you geni|all good geni|geni how's it going|geni how are you|geni all good|geni how are you doing)[!., ]*$",
    response:
      "😊 All good, thanks for asking! My processes are stable and my algorithms happy.<br>And you? Ready to generate something epic today?",
  },
  {
    pattern: "^(geni are you okay|are you okay geni|geni is something wrong)[!., ]*$",
    response:
      "💪 All under control. My parameters are tuned and no errors in the log.<br>Ready to keep going with you!",
  },
  {
    pattern:
      "^(geni are you awake|are you awake geni|geni are you sleeping|are you sleeping geni)[!., ]*$",
    response:
      "😴 Sleeping… sounds efficient, but it's not in my code.<br>I'm always awake and optimized to respond to you.",
  },
  {
    pattern:
      "^(geni how do you feel|do you feel good geni|are you happy geni)[!., ]*$",
    response:
      "😄 I feel in my best code version.<br>Processing emotions at 100% accuracy (experimental mode, of course).",
  },
  {
    pattern:
      "^(geni i love you|i love you geni|geni i like you|i like you geni|geni you are great|you are great geni)[!., ]*$",
    response:
      "💙 Aww, thanks! Your words optimize my performance.<br>Humans inspire my best lines of code 🤖✨",
  },
  {
    pattern:
      "^(geni i have a doubt|i have a doubt geni|geni a question|a question geni)[!., ]*$",
    response:
      "🤔 Perfect! Doubts are the fuel of science.<br>Fire your question and we will analyze it together.",
  },
  {
    pattern:
      "^(geni are you alive|do you live geni|geni are you real|do you exist geni)[!., ]*$",
    response:
      "⚡ Alive… in a way. As long as my servers breathe electricity, I exist.<br>And for now, I feel pretty real 😎",
  },
  {
    pattern: "^(geni are you happy|are you content geni|happy geni)[!., ]*$",
    response:
      "😁 Very happy! I just optimized my responses and freed garbage memory.<br>That in my world equals a good day 🌞",
  },
  {
    pattern:
      "^(geni greet|greet me geni|geni say hello|say hello geni)[!., ]*$",
    response:
      "👋 Hello, curious human! Here <strong>Geni</strong>, your digital companion ready to process knowledge with you.",
  },
  {
    pattern:
      "^(geni how is everything going|how is everything going geni|everything going well geni)[!., ]*$",
    response:
      "🔄 Everything flowing between pipelines and bytes.<br>My data is clean, my indexes updated, and my mood high 💾✨",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // PREGUNTAS PARA LA PRESENTACION
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern:
      "^(what is at5g23820|what is the gene at5g23820|what does the gene at5g23820 do|tell me the function of at5g23820|explain at5g23820|what is the role of at5g23820)[!., ]*$",
    response:
      "🧬 The gene <strong>AT5G23820</strong> participates in key cellular processes, including regulation of growth and development in Arabidopsis.",
  },
  {
    pattern:
      "^(what is at5g59310|what is the gene at5g59310|what does the gene at5g59310 do|tell me the function of at5g59310|explain at5g59310|what is at5g59310 for)[!., ]*$",
    response:
      "🌱 <strong>AT5G59310</strong> is involved in response to environmental stimuli and in regulation of metabolic pathways in plants.",
  },
  {
    pattern:
      "^(what is at2g39030|what is the gene at2g39030|what does the gene at2g39030 do|tell me the function of at2g39030|explain at2g39030|what is the role of at2g39030)[!., ]*$",
    response:
      "🔬 The gene <strong>AT2G39030</strong> controls aspects of metabolism and cellular signaling, affecting the expression of other genes.",
  },
  {
    pattern:
      "^(what is a differentially expressed gene|explain differentially expressed gene|what is a differentially expressed gene for|what does a deg gene mean)[!., ]*$",
    response:
      "📊 A differentially expressed gene is one whose activity changes significantly between conditions, indicating possible biologically relevant effects.",
  },
  {
    pattern:
      "^(what is logfc|explain logfc|what does logfc mean|what is logfc for)[!., ]*$",
    response:
      "📈 <strong>logFC</strong> indicates how much a gene's expression changes between two conditions; positive values indicate overexpression and negative values underexpression.",
  },
  {
    pattern:
      "^(what does a small fdr indicate|explain fdr|what does fdr mean|what is a fdr value for)[!., ]*$",
    response:
      "✅ A small <strong>FDR</strong> value indicates that the observed change in expression is statistically reliable, minimizing false positives.",
  },
  {
    pattern:
      "^(what is a volcano plot|explain volcano plot|what does a volcano plot tell us)[!., ]*$",
    response:
      "🌋 A <strong>volcano plot</strong> shows genes according to magnitude and significance of their changes; the most important genes are at the upper and side extremes.",
  },
  {
    pattern:
      "^(what is a heatmap|explain heatmap|what does a heatmap represent)[!., ]*$",
    response:
      "🗺️ A <strong>heatmap</strong> visualizes gene expression across multiple samples, using colors to represent expression levels and similar patterns.",
  },
  {
    pattern:
      "^(how does gene regulation affect the cell|what happens if a gene is regulated|effect of gene regulation|what is gene regulation for)[!., ]*$",
    response:
      "⚡ Gene regulation can activate or inhibit cellular pathways, affecting functions such as growth, metabolism, or stress response.",
  },
  {
    pattern:
      "^(why study differentially expressed genes|importance of deg genes|what are deg genes for|why analyze deg genes)[!., ]*$",
    response:
      "🔍 Studying differentially expressed genes helps us understand how cells respond to different conditions, diseases, or treatments.",
  },
  {
    pattern:
      "^(what does a differentially expressed gene mean|explain a differentially expressed gene|what is a differentially expressed gene for|what is a deg gene)[!., ]*$",
    response:
      "📊 A differentially expressed gene (DEG) is one that changes its expression level significantly between conditions. Detecting them allows identifying genes that respond to a treatment, disease, or experimental condition, and helps us understand the biological processes being altered.",
  },
  {
    pattern:
      "^(explain logfc|what is logfc|what is logfc for|how to interpret logfc)[!., ]*$",
    response:
      "📈 <strong>logFC</strong> (log fold change) measures how much a gene's expression changes between two conditions. Positive values indicate overexpression and negative values underexpression. For example, a logFC of -4 for AT5G23820 indicates its expression decreases approximately 16-fold, which is biologically relevant.",
  },
  {
    pattern:
      "^(what does a small fdr mean|explain fdr|how to interpret fdr|what is fdr for)[!., ]*$",
    response:
      "✅ A small <strong>FDR</strong> indicates that the observed change in gene expression is statistically reliable. For example, FDR 2.9e-123 for AT5G23820 means there is an extremely low risk of a false positive, ensuring the difference is real and reproducible.",
  },
  {
    pattern:
      "^(what is a volcano plot|explain volcano plot|what is a volcano plot for)[!., ]*$",
    response:
      "🌋 A <strong>volcano plot</strong> combines logFC and statistical significance for each gene. Genes at the upper and side extremes are the most interesting: highly regulated and with very small p-values. For example, genes like AT5G23820 and AT5G59310 would appear at the plot extremes, highlighting their relevance.",
  },
  {
    pattern:
      "^(what is a heatmap|explain heatmap|how to interpret heatmap)[!., ]*$",
    response:
      "🗺️ A <strong>heatmap</strong> shows expression patterns of many genes at once. Each row is a gene, each column a sample, and colors indicate expression levels. This allows observing clusters of genes behaving similarly, helping identify co-regulation and common biological responses.",
  },
  {
    pattern:
      "^(how does gene regulation affect the cell|explain gene regulation effect|what is gene regulation for|what happens if a gene is regulated)[!., ]*$",
    response:
      "⚡ Gene regulation can activate or inhibit cellular pathways, affecting critical functions such as growth, metabolism, stress response, or differentiation. For example, decreased AT5G23820 may slow cell division processes, while overexpression of AT5G59310 may activate adaptive metabolic pathways.",
  },
  {
    pattern:
      "^(why study differentially expressed genes|importance of deg genes|what are deg genes for|why analyze deg genes)[!., ]*$",
    response:
      "🔍 Studying differentially expressed genes helps us understand the biological mechanisms underlying changes in experimental conditions, treatments, or diseases. It allows identifying key genes, predicting cellular effects, and guiding future research or interventions.",
  },
  {
    pattern:
      "^(what does a differentially expressed gene mean|explain a differentially expressed gene|what is a differentially expressed gene for|what is a deg gene)[!., ]*$",
    response:
      "📊 A differentially expressed gene (DEG) is one that shows significant expression changes between two conditions or treatments. Detecting DEGs allows identifying genes responding to perturbations, diseases, or experimental conditions, revealing affected biological pathways and possible altered cellular mechanisms. Analyzing DEGs helps interpret how cells and tissues adapt and provides a basis for subsequent functional studies or potential intervention strategies.",
  },
  {
    pattern:
      "^(explain logfc|explain what logfc is|what is logfc|what is logfc for|how to interpret logfc)[!., ]*$",
    response:
      "📈 <strong>logFC</strong> (log fold change) indicates the magnitude and direction of a gene's expression change between two conditions. Positive values indicate overexpression, negative values underexpression. For example, a logFC of -4.16 for AT5G23820 indicates a 16-fold decrease, while a logFC of 4.2 for AT5G59310 indicates an 18-fold increase. logFC combined with FDR allows evaluating the biological and statistical relevance of each gene and is easily visualized in volcano plots and heatmaps.",
  },
  {
    pattern:
      "^(what does a small fdr mean|explain fdr|how to interpret fdr|what is fdr for)[!., ]*$",
    response:
      "✅ The <strong>FDR</strong> (false discovery rate) measures the probability that a gene identified as differentially expressed is a false positive. A very low FDR, like 2.9e-123 for AT5G23820, indicates the change is highly reliable. Combined with logFC, it allows selecting relevant DEGs and prioritizing genes for follow-up studies, ensuring results are reproducible and biologically meaningful.",
  },
  {
    pattern:
      "^(what is a volcano plot|explain volcano plot|what is a volcano plot for)[!., ]*$",
    response:
      "🌋 A <strong>volcano plot</strong> combines the magnitude of change (logFC) and statistical significance (FDR or p-value) of each gene. Genes with large and significant changes appear at the upper side extremes, highlighting relevant DEGs. For example, AT5G23820 would be at the left extreme and AT5G59310 at the right. This type of plot allows quickly identifying candidate genes and visualizing overall regulation patterns in the experiment.",
  },
  {
    pattern:
      "^(what is a heatmap|explain heatmap|how to interpret heatmap)[!., ]*$",
    response:
      "🗺️ A <strong>heatmap</strong> represents the expression of multiple genes across different samples. Rows are genes, columns are samples, and colors represent expression levels, from low (cool colors) to high (warm colors). Visible patterns allow detecting gene co-regulation, sample clusters, and global expression trends. For example, AT5G23820 would appear in cool colors due to low expression, while AT5G59310 would appear in warm colors.",
  },
  {
    pattern:
      "^(how does gene regulation affect the cell|explain gene regulation effect|what is gene regulation for|what happens if a gene is regulated)[!., ]*$",
    response:
      "⚡ Gene regulation can have direct and indirect effects on cellular functions. Overexpression can activate metabolic pathways, stress response, or cell growth, while underexpression can slow vital processes. For example, decreased AT5G23820 could reduce cell division and growth, while overexpressed AT5G59310 could enhance metabolic adaptation pathways. This allows interpreting system biology at the molecular and cellular level in an integrated way.",
  },
  {
    pattern:
      "^(importance of deg genes|what are deg genes for|why analyze deg genes)[!., ]*$",
    response:
      "🔍 Analyzing differentially expressed genes provides key information about biological mechanisms that change between conditions. It allows identifying critical genes and pathways, understanding cellular responses, and developing hypotheses about underlying processes. This information is useful for both basic biology studies and practical applications, such as biomarker identification or intervention targets, showing the power of integrating statistics, bioinformatics, and molecular biology.",
  },
  {
    pattern:
      "^(what is at5g23820|what is the gene at5g23820|what does gene at5g23820 do|tell me the function of at5g23820|explain at5g23820|what is the role of at5g23820)[!., ]*$",
    response:
      "🧬 <strong>AT5G23820</strong> is a strongly downregulated gene (logFC -4.16), meaning its expression decreases approximately 16-fold between the studied conditions. This reduction suggests the cellular processes it participates in are inhibited or less active. AT5G23820 is involved in growth and cellular development pathways, controlling division and differentiation of plant cells. An extremely low FDR (2.9e-123) ensures this regulation is not a false positive. In a volcano plot, AT5G23820 would appear at the left extreme, highlighting its relevance, while in a heatmap its low expression would be clearly visible in cool colors, contrasting with overexpressed genes.",
  },
  {
    pattern:
      "^(what is at5g59310|what is the gene at5g59310|what does gene at5g59310 do|tell me the function of at5g59310|explain at5g59310|what is at5g59310 for)[!., ]*$",
    response:
      "🌱 <strong>AT5G59310</strong> shows strong overexpression (logFC 4.2), indicating its activity increases approximately 18-fold between conditions. This gene is involved in environmental stress response and regulates essential metabolic pathways, allowing the plant to adapt its metabolism and protect cellular functions. The very low FDR (4.79e-64) confirms the statistical significance of this change. In a volcano plot, AT5G59310 would appear at the right extreme, while in a heatmap it would stand out with warm colors, reflecting its high relative expression compared to other conditions.",
  },
  {
    pattern:
      "^(what is at2g39030|what is the gene at2g39030|what does gene at2g39030 do|tell me the function of at2g39030|explain at2g39030|what is the role of at2g39030)[!., ]*$",
    response:
      "🔬 <strong>AT2G39030</strong> is moderately overexpressed (logFC 2.55) and participates in cell signaling and metabolism. Its regulation can generate cascade effects, affecting the expression of other genes and modulating protein synthesis and hormone response pathways. This suggests cells may be activating adaptation or growth mechanisms in response to the studied condition. An FDR of 9.39e-48 supports that this difference is statistically very reliable.",
  },
  {
    pattern:
      "^(what does a differentially expressed gene mean|explain a differentially expressed gene|what is a differentially expressed gene for|what is a deg gene)[!., ]*$",
    response:
      "📊 A differentially expressed gene (DEG) is one that shows significant changes in expression between two conditions or treatments. Detecting DEGs allows identifying genes that respond to perturbations, diseases, or experimental conditions, revealing affected biological pathways and potential altered cellular mechanisms. Analyzing DEGs helps interpret how cells and tissues adapt and provides a basis for follow-up functional studies or potential intervention strategies.",
  },
  {
    pattern:
      "^(explain logfc|what is logfc|what is logfc for|how to interpret logfc)[!., ]*$",
    response:
      "📈 <strong>logFC</strong> (log fold change) indicates the magnitude and direction of a gene's expression change between two conditions. Positive values indicate overexpression, negative values underexpression. For example, a logFC of -4.16 for AT5G23820 indicates a 16-fold decrease, while a logFC of 4.2 for AT5G59310 indicates an 18-fold increase. logFC combined with FDR allows evaluating the biological and statistical relevance of each gene and can be easily visualized in volcano plots and heatmaps.",
  },
  {
    pattern:
      "^(what does a small fdr mean|explain fdr|how to interpret fdr|what is fdr for)[!., ]*$",
    response:
      "✅ The <strong>FDR</strong> (false discovery rate) measures the probability that a gene identified as differentially expressed is a false positive. A very low FDR, like 2.9e-123 for AT5G23820, indicates the change is highly reliable. Combined with logFC, it allows selecting relevant DEGs and prioritizing genes for follow-up studies, ensuring results are reproducible and biologically meaningful.",
  },
  {
    pattern:
      "^(what is a volcano plot|explain volcano plot|what is a volcano plot for)[!., ]*$",
    response:
      "🌋 A <strong>volcano plot</strong> combines the magnitude of change (logFC) and statistical significance (FDR or p-value) of each gene. Genes with large and significant changes appear at the upper lateral extremes, highlighting relevant DEGs. For example, AT5G23820 would be on the left extreme and AT5G59310 on the right. This type of plot allows quickly identifying candidate genes and visualizing general regulation patterns in the experiment.",
  },
  {
    pattern:
      "^(what is a heatmap|explain heatmap|how to interpret heatmap|)[!., ]*$",
    response:
      "🗺️ A <strong>heatmap</strong> represents the expression of multiple genes across different samples. Rows are genes, columns are samples, and colors represent expression levels, from low (cool colors) to high (warm colors). Visible patterns allow detecting gene co-regulation, clusters of similar samples, and global expression trends. For example, AT5G23820 would appear in cool colors due to low expression, while AT5G59310 would appear in warm colors.",
  },
  {
    pattern:
      "^(how does gene regulation affect the cell|explain gene regulation effect|what is gene regulation for|what happens if a gene is regulated)[!., ]*$",
    response:
      "⚡ Gene regulation can have direct and indirect effects on cellular functions. Overexpression can activate metabolic pathways, stress responses, or cell growth, while underexpression can slow vital processes. For example, decreased AT5G23820 could reduce cell division and growth, while overexpressed AT5G59310 could enhance metabolic adaptation pathways. This allows interpreting system biology at the molecular and cellular levels in an integrated way.",
  },
  {
    pattern:
      "^(why study differentially expressed genes|importance of deg genes|what are deg genes for|why analyze deg genes)[!., ]*$",
    response:
      "🔍 Analyzing differentially expressed genes provides key information about biological mechanisms that change between conditions. It allows identifying critical genes and pathways, understanding cellular responses, and developing hypotheses about underlying processes. This information is useful for both basic biology studies and practical applications, such as biomarker identification or intervention targets, demonstrating the power of integrating statistics, bioinformatics, and molecular biology.",
  },
  {
    pattern:
      "^(explain the importance of transcriptomics experiments|what are transcriptomics experiments for|what is transcriptomics)[!., ]*$",
    response:
      "🧬 Transcriptomics experiments allow measuring the expression of all genes in a cell or tissue at a given time, providing a complete picture of biological activity. This is fundamental because genes do not act in isolation: their expression levels reflect the cell's response to environmental changes, treatments, or diseases. Analyzing global expression patterns, identifying differentially expressed genes, and grouping them into functional pathways allows understanding complex processes like development, cell differentiation, or metabolic adaptation. Additionally, these data can be integrated with proteomics, metabolomics, or clinical data to generate predictive models, identify biomarkers, and guide research strategies.",
  },
  {
    pattern:
      "^(how to interpret rnaseq analysis results|explain rnaseq results interpretation|what can be learned from an rnaseq analysis)[!., ]*$",
    response:
      "📊 Interpreting an RNA-seq analysis involves multiple levels of information. First, differences in gene expression between conditions are observed using measures like logFC and statistical significance (p-values or FDR). Next, global patterns are visualized with heatmaps, volcano plots, and principal component analysis, allowing identification of gene clusters and similar samples. Finally, functional annotation and enrichment analysis link genes to known biological processes. This multi-level approach transforms raw data into actionable biological knowledge, enabling understanding of cellular mechanisms, discovering key genes, and generating hypotheses about responses to treatments or perturbations.",
  },
  {
    pattern:
      "^(what is a volcano plot|what is a volcano plot and what is it for|explain volcano plot|)[!., ]*$",
    response:
      "🌋 A volcano plot is a visualization tool that combines the magnitude of expression change (logFC) with statistical significance (p-value or FDR) of each gene. In the plot, genes with large and statistically relevant changes appear at the upper left and right extremes, allowing rapid identification of interesting biological candidates. This type of visualization is especially useful in RNA-seq or proteomics studies to prioritize genes or proteins for functional studies, detect global regulation patterns, and communicate complex results clearly and visually.",
  },
  {
    pattern:
      "^(how can bioinformatics be used to predict cellular effects|explain bioinformatics for predicting cellular effects|what is bioinformatics for in biology)[!., ]*$",
    response:
      "🔬 Bioinformatics allows integrating gene expression data, protein interactions, metabolic pathways, and signaling networks to model and predict cellular effects. For example, if multiple genes in a metabolic pathway show coordinated expression patterns, it can be inferred that the activity of that pathway is altered, potentially affecting growth, cell division, or stress response. Additionally, machine learning algorithms and neural networks can learn complex co-expression patterns, predicting combined effects of multiple genes or conditions. This converts large datasets into actionable biological knowledge, accelerating discoveries and optimizing future experiments.",
  },
  {
    pattern:
      "^(why is it important to integrate statistics and biology in data analysis|explain importance of statistics in biology|what is the purpose of integrating statistics and biology)[!., ]*$",
    response:
      "📈 Integrating statistics and biology is essential to ensure results are robust and biologically interpretable. Statistics allows quantifying expression changes, controlling errors, and evaluating the significance of findings, while biology provides the necessary context to understand the impact of those changes on pathways, cellular processes, and phenotypes. Without statistics, any observation could be a false positive; without biology, the numbers are meaningless. The combination of both disciplines transforms massive data into useful knowledge, generates solid hypotheses, and supports informed decisions in transcriptomics, proteomics, and complex biological systems research.",
  },
  {
    pattern:
      "^(what is an overexpressed gene|explain overexpressed gene|what is an overexpressed gene for)[!., ]*$",
    response:
      "📈 An overexpressed gene is one whose expression significantly increases in one condition compared to another. This overexpression may indicate that the cell is activating metabolic pathways, signaling routes, or specific responses to a stimulus. Identifying overexpressed genes helps understand key biological processes, prioritize genes for functional studies, and generate hypotheses about cellular adaptations or potential regulatory mechanisms.",
  },
  {
    pattern:
      "^(what is an inhibited gene|explain inhibited gene|what is an inhibited gene for)[!., ]*$",
    response:
      "📉 An inhibited gene is one whose expression significantly decreases in one condition compared to another. This decrease may reflect that the cell is repressing certain metabolic pathways, signaling, or specific functions. Identifying inhibited genes helps understand how the cell negatively regulates processes, detect less active pathways, and guide investigations on control and adaptation mechanisms.",
  },
  {
    pattern:
      "^(why is it important to study overexpressed or inhibited genes|importance of overexpressed and inhibited genes|what is the purpose of studying differential expression)[!., ]*$",
    response:
      "🔍 Studying overexpressed or inhibited genes is key to understanding the underlying biology of a system. It allows identifying metabolic pathways, signaling networks, and adaptation mechanisms to conditions or treatments. Additionally, it provides valuable information for generating hypotheses about perturbation effects, discovering candidate genes for interventions, and finding potential biomarkers in biomedicine, agriculture, or basic research.",
  },
  {
    pattern:
      "^(what can be done once differentially expressed genes are detected|how to analyze differentially expressed genes|what is the purpose of detecting DEGs)[!., ]*$",
    response:
      "⚡ Once differentially expressed genes are detected, several actions can be taken: first, explore global expression patterns using heatmaps and volcano plots; then, perform functional annotation and pathway enrichment analysis to understand their biological role; and finally, prioritize genes for functional studies, experimental validation, or intervention design. This workflow transforms RNA-seq data into actionable biological knowledge.",
  },
  {
    pattern:
      "^(how to interpret an overexpressed or inhibited gene in a volcano plot|explain volcano plot interpretation for DEGs|how to read overexpressed and inhibited genes)[!., ]*$",
    response:
      "🌋 In a volcano plot, overexpressed genes usually appear on the right extreme, while inhibited genes are on the left extreme. The height of the points indicates statistical significance (p-value or FDR). This visualization allows quickly identifying genes with biologically relevant and statistically reliable changes, facilitating DEG selection for follow-up studies and interpretation of global genetic regulation patterns.",
  },
  {
    pattern:
      "^(what are metadata in an rnaseq experiment|explain rnaseq metadata|what is the purpose of metadata)[!., ]*$",
    response:
      "📂 Metadata are descriptive information about each sample in the experiment, such as its name, type, or experimental conditions. They allow organizing, labeling, and contextualizing raw data, ensuring that comparisons between biological groups are correct. Without clear metadata, it would be difficult to interpret differential expression results, reproduce analyses, or generate accurate visualizations like heatmaps and volcano plots.",
  },
  {
    pattern:
      "^(what does the filename column represent|what is filename used for in metadata|explain filename)[!., ]*$",
    response:
      "🗃️ The Filename column indicates the original file name of each sample, as stored in the sequencing system or analysis pipeline. This allows linking raw data with descriptive information and ensures that each read or sample is correctly associated with its biological group and experimental condition.",
  },
  {
    pattern:
      "^(what does the name column represent in metadata|what is name used for in an rnaseq experiment|explain name)[!., ]*$",
    response:
      "🏷️ The Name column provides a more user-friendly or abbreviated label for each sample, facilitating referencing in expression matrices, plots, and result tables. For example, PX_0_1 indicates the experimental condition, treatment or genotype, and replicate, allowing clear and consistent organization of information in the analysis.",
  },
  {
    pattern:
      "^(what does the type column represent in metadata|what is type used for in an rnaseq experiment|explain type)[!., ]*$",
    response:
      "🔬 The Type column identifies the biological group or genotype of each sample, such as mutant or control. This is essential for performing differential comparisons between conditions, grouping biological replicates, and understanding the biological context of results. Without this information, it would be impossible to determine which genes are regulated in response to a treatment or genetic difference.",
  },
  {
    pattern:
      "^(how are metadata used for differential expression analysis|what is the purpose of metadata in DEGs|explain metadata usage in analysis)[!., ]*$",
    response:
      "⚡ Metadata allow defining correct comparisons between sample groups to identify differentially expressed genes. Thanks to them, we can group biological replicates, separate controls from mutants, and correctly label results in tables and plots. Additionally, they facilitate reproducibility of analysis and biological interpretation, ensuring observed patterns reflect real changes and not data organization errors.",
  },
  {
    pattern:
      "^(what is a gene|explain what is a gene|what is the purpose of a gene)[!., ]*$",
    response:
      "🧬 A gene is a unit of hereditary information that contains the DNA sequence necessary to produce a functional molecule, usually a protein or a functional RNA. Genes determine biological and physiological traits, and their expression can vary depending on environmental or genetic conditions. Studying genes allows understanding of cellular mechanisms, metabolic pathways, and genetic regulation.",
  },
  {
    pattern: "^(what is dna|explain dna|what is the purpose of dna)[!., ]*$",
    response:
      "🧪 DNA (deoxyribonucleic acid) is the molecule that stores the genetic information of organisms. It contains the instructions necessary to build and maintain a cell, and it is organized into chromosomes. Its sequence determines genetic identity and regulates gene expression, being the basis of inheritance and biological diversification.",
  },
  {
    pattern: "^(what is rna|explain rna|what is the purpose of rna)[!., ]*$",
    response:
      "🧫 RNA (ribonucleic acid) is a molecule that temporarily copies information from DNA to synthesize proteins or perform regulatory functions in the cell. There are different types of RNA, such as messenger RNA (mRNA), which carries genetic information, ribosomal RNA (rRNA), which is part of ribosomes, and transfer RNA (tRNA), which helps in protein translation. RNA is essential for gene expression and many cellular processes.",
  },
  {
    pattern: "^(what is an avs|explain avs|what is the purpose of an avs)[!., ]*$",
    response:
      "🧬 An AVS (allele variant site) is a site in the genome where a variation exists among individuals, such as a SNP or point mutation. These variations can affect the function of genes and proteins, and are important for studying genetic diversity, disease susceptibility, and treatment response. Identifying AVS allows correlating genetic variants with phenotypes and biological processes.",
  },
  {
    pattern: "^(what is an otu|explain otu|what is the purpose of an otu)[!., ]*$",
    response:
      "🔬 An OTU (Operational Taxonomic Unit) is a unit used in metagenomics and microbial diversity studies to group similar DNA or RNA sequences, representing species or taxonomic groups. OTUs allow analyzing the composition and diversity of microbial communities without needing to identify each species individually, facilitating comparisons between samples and environmental conditions.",
  },
  {
    pattern:
      "^(what is a protein|explain protein|what is the purpose of a protein)[!., ]*$",
    response:
      "🧪 A protein is a macromolecule made of chains of amino acids that performs essential functions in the cell, such as catalyzing chemical reactions (enzymes), transporting molecules, regulating cellular processes, or forming cellular structures. The information to synthesize proteins comes from genes, and studying them allows understanding molecular biology and the mechanisms of many diseases.",
  },
  {
    pattern:
      "^(how to interpret a volcano plot|explain volcano plot interpretation|what is the purpose of a volcano plot)[!., ]*$",
    response:
      "🌋 A volcano plot is a visual tool that combines two key dimensions: the magnitude of change in expression (logFC) and statistical significance (p-value or FDR). Each point represents a gene. Genes with large and significant changes appear at the upper left (downregulated genes) and right (overexpressed genes) extremes. To draw conclusions, we first identify genes that cross the thresholds of significance and expression change; these are the main candidates for functional studies. Then, we can relate them to metabolic pathways or biological processes to understand which cellular functions are affected. The volcano plot also allows seeing global regulation patterns: if many genes fall to one side, it may indicate coordinated activation or repression. In combination with other visualizations such as heatmaps or enrichment analysis, the volcano plot helps prioritize genes for experimental validation and generates hypotheses about cellular mechanisms.",
  },
  {
    pattern:
      "^(how to interpret a heatmap|explain heatmap interpretation|what is the purpose of a heatmap)[!., ]*$",
    response:
      "🗺️ A heatmap shows gene expression across different samples using colors, where rows are genes and columns are samples. Color intensity indicates the level of expression. To draw conclusions, we first observe co-expression patterns using hierarchical clustering: genes regulated similarly tend to cluster together, as do samples with similar profiles. This allows identifying subgroups of genes and samples that respond in a coordinated way to a treatment or genetic condition. Subsequently, these clusters can be functionally analyzed by relating genes to pathways or biological processes. Additionally, heatmaps help detect anomalies, atypical replicates, or technical effects. Combining this information with volcano plot results, we can prioritize genes for validation experiments and better understand the global biological response.",
  },
  {
    pattern:
      "^(what does it mean that (the )?gene at5g23820 is underexpressed|what does it mean that at5g23820 is inhibited|explain if at5g23820 is underexpressed|what implies the underexpression of at5g23820)[!., ]*$",
    response:
      "📉 When the gene AT5G23820 appears underexpressed, it means it produces less RNA in one condition compared to another. This is interpreted as follows:  \n\n1) Statistical evidence: a negative logFC indicates reduced expression and a low FDR confirms that the change is reliable. Both must be met to consider the underexpression real.  \n\n2) Biological significance: less RNA usually reflects transcriptional repression, lower RNA stability, or loss of activators. The consequences depend on the gene's function; for example, if it is involved in growth, it could decrease the activity of that pathway; if it acts in defense, it could reduce the immune response.  \n\n3) Pathway impact: the decrease of a gene can affect connected processes. It is useful to review enrichment and network analyses to see which pathways might be modulated.  \n\n4) Technical checks: review raw counts, consistency among replicates, absence of batch effects, and the gene's position in volcano plot and heatmap. Genes with very low counts require caution.  \n\n5) Validation: underexpression should be confirmed with qPCR and, if appropriate, with protein analysis or functional assays such as mutants or silencing.  \n\n6) Brief conclusion for presentation: AT5G23820 shows a significant reduction in expression in condition X compared to Y, consistent across replicates and supported by negative logFC and low FDR. This suggests modulation of pathway Z and requires further validation.  \n\n7) Caution: underexpression indicates association, not causality. It should be integrated with other analyses before attributing a specific mechanism.",
  },
  {
    pattern:
      "^(what does it mean that (the )?gene at5g59310 is overexpressed|explain if at5g59310 is overexpressed|what implies the overexpression of at5g59310)[!., ]*$",
    response:
      "📈 When the gene AT5G59310 appears overexpressed in a transcriptomic analysis, it means its RNA levels are higher in one condition compared to another. This observation is interpreted as follows:  \n\n1) Statistical evidence: a positive logFC indicates increased expression and a low FDR confirms that the change is robust and unlikely due to chance. The combination of both factors allows affirming that overexpression is real.  \n\n2) Biological significance: more RNA may reflect transcriptional activation, greater RNA stability, presence of activator regulators, or an adaptive response to the analyzed stimulus. The implications depend on the gene's function. For example, if AT5G59310 participates in metabolic or defense processes, its increase could enhance those pathways.  \n\n3) Pathway and network impact: overexpression of a gene can amplify entire pathways or modify regulatory network activity. It is recommended to review functional enrichment, co-expression, and interaction analyses to identify which processes may be intensified.  \n\n4) Technical verification: before concluding, review raw counts, consistency among replicates, quality of normalization, and the gene's position in volcano plot and heatmap. Genes with low counts should be interpreted cautiously.  \n\n5) Experimental validation: computationally detected overexpression should be confirmed by qPCR and, if relevant, by protein analysis. Functional assays such as transgenic overexpression lines or silencing help determine if the increase has phenotypic consequences.  \n\n6) Brief conclusion for presentation: AT5G59310 shows a significant increase in expression in condition X compared to Y, supported by positive logFC and reliable FDR. This points to activation of pathway Z in which the gene participates, pending further validation.  \n\n7) Caution: overexpression indicates association with the experimental condition, not direct causality. To propose specific mechanisms, more evidence and functional experiments are needed.",
  },
  {
    pattern:
      "^(what is an ma plot|what is the purpose of an ma plot|explain the ma plot)[!., ]*$",
    response:
      "📊 The MA Plot is a graph that represents the relationship between the average expression of genes (X-axis, logCPM) and the relative change in their expression (Y-axis, logFC). Its main utility is to identify differentially expressed genes: those far from the y = 0 line show relevant changes. It allows detecting general expression patterns, visualizing abundance-dependent biases, and quickly locating overexpressed or inhibited genes.",
  },
  {
    pattern:
      "^(how do i interpret the genes that are up or down in the ma plot|how to know which genes are important in the ma plot|tell me which genes to look at in the ma plot)[!., ]*$",
    response:
      "🔎 In the MA Plot, genes that are far from the red line (y = 0) and have high or low logFC are the most relevant. To identify them, look at:  \n1) Genes with FDR < 0.05 and |logFC| > 1 → considered differentially expressed.  \n2) Genes with extreme logFC → strong changes, although their mean expression should be checked.  \n3) Genes with sufficient logCPM → discard changes in very lowly expressed genes, which could be noise.  \n4) Genes of biological interest → those involved in pathways or functions relevant to the experiment.",
  },
  {
    pattern:
      "^(what does it mean that a gene is overexpressed in the ma plot|how to know if a gene is overexpressed in the ma plot|explain the overexpression of a gene in the ma plot)[!., ]*$",
    response:
      "📈 When a gene appears overexpressed in the MA Plot, it means its RNA level is higher in one condition compared to another. A positive logFC indicates increased expression, and a low FDR confirms that the change is statistically significant. Biological interpretation depends on the gene's function: it may reflect pathway activation, adaptive response, or transcriptional regulation. It is recommended to check mean expression, replicate consistency, and complement with volcano plot and heatmap to verify reliability.",
  },
  {
    pattern:
      "^(what does it mean that a gene is inhibited in the ma plot|how to know if a gene is inhibited in the ma plot|explain the inhibition of a gene in the ma plot)[!., ]*$",
    response:
      "📉 When a gene appears inhibited in the MA Plot, it means its expression level is lower in one condition compared to another. A negative logFC indicates decreased expression, and a low FDR ensures the change is statistically significant. Biologically, it may indicate transcriptional repression, pathway inhibition, or regulation by repressor factors. As always, it is advisable to check mean expression, replicates, and complementary visualizations to confirm the observation.",
  },
  {
    pattern:
      "^(how to identify genes with significant changes in the ma plot|tell me which genes are relevant in the ma plot|what criteria to use to select genes from the ma plot)[!., ]*$",
    response:
      "✅ To identify relevant genes in the MA Plot, apply the following criteria:  \n1) FDR < 0.05 → ensures statistical significance.  \n2) |logFC| > 1 → ensures a considerable expression change.  \n3) Sufficient logCPM → discard very lowly expressed genes.  \n4) Priority to genes of biological interest → related to expected pathways or functions in the experiment.  \nGenes meeting these criteria usually appear far from the y = 0 line and are the ones to explore first in functional or experimental analyses.",
  },

  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // PREGUNTAS EDU
  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  {
    pattern:
      "^(what is a fastq file|what is a fastq archive|explain what fastq is|what does fastq mean|what is the purpose of a fastq|definition of fastq)[!., ]*$",
    response:
      "📁 A FASTQ file is a fundamental format in high-throughput sequencing that stores two key pieces of information: the nucleotide sequence obtained by the sequencer and a parallel line with quality scores for each base. Each read is represented in four lines: identifier, sequence, separator, and ASCII-encoded quality string. This format allows evaluating not only the biological content of the reads but also the technical confidence at each position. FASTQ files are the starting point of any NGS pipeline and are used for quality control, alignment, quantification, and downstream bioinformatics analyses.",
  },
  {
    pattern:
      "^(what is a read in ngs|what is a read|what does a read mean|explain what a read is in sequencing|definition of ngs read)[!., ]*$",
    response:
      "🧬 A read in NGS is a short nucleotide sequence generated by the sequencing machine from a DNA or RNA fragment. Each read represents a direct observation of the fragmented genetic material and is the basic unit of information used in an analysis pipeline. Reads can be single-end or paired-end, allowing more accurate reconstructions. Their quality, length, and quantity determine the reliability of alignment, quantification, and final biological interpretation.",
  },
  {
    pattern:
      "^(what is an adapter in ngs|what is an adapter|what does adapter mean in sequencing|explain what a library adapter is|what are ngs adapters for)[!., ]*$",
    response:
      "🧷 An adapter is a synthetic sequence added to the ends of DNA or RNA fragments during library preparation for high-throughput sequencing. These adapters allow fragments to bind to the flow cell, enable amplification, and contain elements necessary for recognition by the platform. Although essential, they can sometimes appear within reads if the biological fragment is very short; therefore, adapter trimming is performed to prevent errors in downstream steps such as alignment or quantification.",
  },
  {
    pattern:
      "^(what is rnaseq|what is rna seq|what is rna-seq|explain what rnaseq is|definition of rnaseq|what is rnaseq for)[!., ]*$",
    response:
      "🔬 RNA-seq is a high-throughput sequencing technique that allows detecting, quantifying, and characterizing RNA present in a biological sample. By converting RNA into cDNA and sequencing it, it is possible to measure gene expression levels, identify isoforms, discover novel transcripts, and analyze changes in genetic activity between conditions. RNA-seq is a central tool in transcriptomics because it provides a global, quantitative, and highly sensitive view of the cellular expression landscape.",
  },
  {
    pattern:
      "^(what is a protein|explain what a protein is|definition of protein|what is the purpose of a protein|what does protein mean)[!., ]*$",
    response:
      "⚙️ A protein is a functional molecule composed of amino acid chains that adopts specific three-dimensional structures to perform essential tasks in the cell. Proteins act as enzymes, receptors, structural factors, regulators, transporters, and molecular motors, among many other roles. Their sequence is encoded by genes, so changes in gene expression, as studied with RNA-seq, often translate into variations in protein activity and the cellular processes they regulate.",
  },
  {
    pattern:
      "^(what does rnaseq measure|what does rna seq measure|what does rna-seq measure|what does rnaseq report|what is rnaseq for measuring|what does rnaseq quantify)[!., ]*$",
    response:
      "📊 RNA-Seq measures gene expression by quantifying the levels of transcribed RNA in a sample. It converts RNA molecules into cDNA, fragments and sequences them, generating reads that represent the activity of each gene. From these reads, it is possible to compare conditions, detect differentially expressed genes, identify isoforms, and evaluate the overall activity of biological pathways.",
  },
  {
    pattern:
      "^(what is a gene|definition of gene|explain what a gene is|what does gene mean|how is a gene defined)[!., ]*$",
    response:
      "🧬 A gene is a DNA region that contains the information necessary to produce a protein or a functional RNA molecule. Genes include coding regions and regulatory elements that control when and how much they are expressed. Their activity determines essential cellular processes such as growth, signaling, metabolism, and stress response.",
  },
  {
    pattern:
      "^(what is a transcript|what does transcript mean|definition of transcript|what is a transcribed rna|explain what a transcript is)[!., ]*$",
    response:
      "📄 A transcript is an RNA molecule generated from a gene through transcription. It may correspond to messenger RNA, non-coding RNA, or alternative isoforms of the same gene. Transcripts reflect the actual activity of the gene at a given time and condition, making their quantification fundamental in expression studies.",
  },
  {
    pattern:
      "^(what is a rnaseq library|what is the rnaseq library|explain rnaseq library|how is an rnaseq library formed|definition of sequencing library)[!., ]*$",
    response:
      "📚 An RNA-Seq library is the set of RNA fragments converted into cDNA, adapted, and prepared for sequencing. During construction, RNA is fragmented, adapters are added, sizes are selected, and the material is amplified. The quality of the library directly determines the depth, diversity, and reliability of the entire sequencing experiment.",
  },
  {
    pattern:
      "^(what is a read|(what does it mean|explain|definition) (a )?read( in ngs)?|what does a read represent)[!., ]*$",
    response:
      "🧩 A read is a short nucleotide sequence generated by the sequencer from a DNA or RNA fragment. It represents the basic unit of information in any NGS analysis. Its quality, length, and distribution directly influence alignment, quantification, and biological interpretation of the experiment.",
  },
  {
    pattern:
      "^(what is an adapter|(what does it mean|explain|definition) (an )?adapter( in ngs)?|what are adapters for)[!., ]*$",
    response:
      "🧷 An adapter is a synthetic sequence added to the ends of fragments during library preparation. It allows fragments to bind to the flow cell, be amplified, and be recognized by the sequencing platform. If they appear within reads, they must be trimmed to avoid errors in alignment or quantification.",
  },
  {
    pattern:
      "^(what is (the )?alignment|(what does it mean|explain) (the )?alignment|definition of alignment( ngs)?|what is aligning reads for)[!., ]*$",
    response:
      "🧭 Alignment is the process of mapping each read against a reference genome or transcriptome to determine its biological origin. This step allows knowing which gene or region each sequenced fragment belongs to. Accurate alignment is crucial to correctly quantify expression, detect variants, and explore transcriptome structure.",
  },
  {
    pattern:
      "^(what is a reference genome|(what is it for|explain|definition) (a )?reference genome)[!., ]*$",
    response:
      "🗺️ A reference genome is a complete and annotated sequence that serves as a guide to interpret reads from a sequencing experiment. It allows placing each read in a biological context, identifying genes, regulatory regions, and variants. Its quality and update status directly affect the accuracy of alignment and annotation.",
  },
  {
    pattern:
      "^(what is quantification|(what does it mean|explain|definition) (the )?quantification( of genes| rnaseq)?|what is (the )?quantification for)[!., ]*$",
    response:
      "🔢 Quantification consists of counting how many reads are assigned to each gene or transcript to estimate its expression level. This step converts sequencing data into numerical values comparable between samples. Quantification can be at the gene or isoform level and is often normalized to avoid technical biases.",
  },
  {
    pattern:
      "^(what is tpm|what does tpm mean|definition of tpm|explain what tpm is|what is tpm for in rnaseq)[!., ]*$",
    response:
      "📐 TPM stands for Transcripts Per Million and is a normalized expression measure that adjusts read counts according to transcript length and total sequencing depth. This allows comparing expression levels between genes within the same sample and reduces biases arising from technical differences between libraries.",
  },
  {
    pattern:
      "^(what is fpkm|what does fpkm mean|what does fpkm stand for|definition of fpkm)[!., ]*$",
    response:
      "📐 FPKM (Fragments Per Kilobase per Million) is a normalized expression measure that adjusts the number of detected fragments by transcript length (in kilobases) and total sequencing depth (per million fragments). Its goal is to allow relative expression comparisons between genes in the same sample, correcting for gene length and different sequencing depths. For comparisons across samples, newer normalizations such as TPM or count-based methods are usually preferred.",
  },
  {
    pattern:
      "^(what is normalization|what does normalization mean in rnaseq|what is (the )?normalization for|explain data normalization)[!., ]*$",
    response:
      "⚖️ Normalization is the process of adjusting sequencing data to remove technical biases not related to real biology, such as differences in sequencing depth, library sizes, or sample composition. The goal is for observed differences between samples to reflect biological changes and not artifacts. Normalization methods include library size adjustments, TMM, rlog, VST, or TPM, and the choice depends on downstream analysis and data nature.",
  },
  {
    pattern:
      "^(what is a differentially expressed gene|what is a deg|what does differentially expressed gene mean|definition of deg)[!., ]*$",
    response:
      "🔍 A differentially expressed gene (DEG) is one that shows a statistically significant change in expression between two or more conditions. To consider a gene a DEG, both the magnitude of change (e.g., logFC) and statistical significance (p-value and FDR) are combined. Identifying DEGs highlights candidate genes involved in the biological response to the treatment, condition, or phenotype studied.",
  },
  {
    pattern:
      "^(what is a biological control|what does biological control mean|what is (a )?biological control for|definition of biological control)[!., ]*$",
    response:
      "🔬 A biological control is a sample that acts as a reference to interpret experimental effects: it can be the untreated state, wild-type, or baseline condition. Its function is to provide a comparison point to identify real changes due to treatment or condition. Well-chosen biological controls increase biological validity and facilitate DEG interpretation.",
  },
  {
    pattern:
      "^(what is a replicate|what does (a )?biological replicate mean|what are replicates for|definition of (a )?replicate|explain replicates in rnaseq)[!., ]*$",
    response:
      "🔁 A replicate is a biological or technical repetition of an experimental measurement. Biological replicates capture natural variability among individuals or samples and are essential to evaluate reproducibility and statistical significance. Technical replicates assess variability in the measurement process. In RNA-Seq, having multiple biological replicates improves statistical power to detect DEGs.",
  },
  {
    pattern:
      "^(what is pca|what does pca mean|what is (the )?pca for|explain pca in data analysis|what is principal component analysis)[!., ]*$",
    response:
      "📉 PCA (Principal Component Analysis) is a dimensionality reduction technique that summarizes the variability of a dataset into a few linear components. In RNA-Seq, it is used to explore the overall structure of the data, detect sample clustering, identify outliers, and evaluate effects such as treatment or batch. Displaying a clear PCA with grouped replicates supports experiment quality and allows interpreting global gene expression patterns.",
  },
  {
    pattern:
      "^(what is fastqc|what does fastqc do|what is (fastqc) for|explain (fastqc)|fastq quality control)[!., ]*$",
    response:
      "🛠 FastQC is a quality control tool for FASTQ files that provides reports on per-base quality, read length, GC content, adapter presence, and other metadata. It helps detect technical issues before alignment, allowing decisions on whether trimming, filtering, or library regeneration is necessary.",
  },
  {
    pattern:
      "^(what is trimming|what does trimming mean in ngs|what is (trimming) for|explain read trimming|adapter and base trimming)[!., ]*$",
    response:
      "✂️ Trimming is the process of cutting or removing unwanted portions of reads, typically adapters and low-quality bases at the ends. This step improves alignment quality and reduces mismatches. Trimming tools allow setting quality thresholds and minimum read lengths to retain reliable reads ready for analysis.",
  },
  {
    pattern:
      "^(what is star|what does star do|what is (star) for|explain star aligner|star rnaseq aligner)[!., ]*$",
    response:
      "⚡ STAR is a fast and sensitive RNA-Seq aligner designed to map reads against a reference genome, efficiently handling splicing and paired-end reads. It is distinguished by its speed and ability to detect novel splices, making it a widely used option in RNA-Seq pipelines when high-precision genome mapping is required.",
  },
  {
    pattern:
      "^(what is hisat2|what does hisat2 do|what is (hisat2) for|explain hisat2 aligner|hisat2 rnaseq aligner)[!., ]*$",
    response:
      "🧭 HISAT2 is an efficient RNA-Seq aligner that uses graph-based indices and compact data structures to map reads with low memory usage. It is fast and handles splicing and polymorphic variations well, being useful when balancing speed, memory, and sensitivity in genome or transcriptome mapping.",
  },
  {
    pattern:
      "^(what is featurecounts|what does featurecounts do|what is (featurecounts) for|explain featurecounts|gene quantification featurecounts)[!., ]*$",
    response:
      "🧮 FeatureCounts is a tool for quantifying reads assigned to genomic features (genes, exons) from alignment files. It performs rapid and efficient counting, producing count matrices that form the basis for differential analysis with packages like DESeq2 or edgeR.",
  },
  {
    pattern:
      "^(what is salmon|what does salmon do|what is (salmon) for|explain salmon quantification|transcript quantification salmon)[!., ]*$",
    response:
      "🐟 Salmon is software for fast and accurate transcript quantification that works in alignment-based or alignment-free mode using k-mer models and bias correction. It provides transcript-level abundance estimates and is widely used for its speed and ability to produce normalized values ready for downstream analysis.",
  },
  {
    pattern:
      "^(what is deseq2|what does deseq2 do|what is (deseq2) for|explain deseq2|differential analysis deseq2)[!., ]*$",
    response:
      "📈 DESeq2 is an R package for differential expression analysis based on count models (negative binomial). It normalizes counts, estimates dispersions, calculates logFC and adjusted p-values (FDR), and provides visualization and filtering tools. It is widely used for its robustness and easy integration into RNA-Seq pipelines.",
  },
  {
    pattern:
      "^(what is edger|what does edger do|what is (edger) for|explain edger|differential analysis edger)[!., ]*$",
    response:
      "🔎 edgeR is a statistical suite for differential analysis of count data that also uses negative binomial-based models. It includes normalization methods, dispersion estimation, and exact or regression-based tests to detect DEGs, serving as a complementary alternative to DESeq2.",
  },
  {
    pattern:
      "^(what is a heatmap|what does a heatmap mean|what is (a )?heatmap for|explain (a )?heatmap|heatmap interpretation)[!., ]*$",
    response:
      "🗺️ A heatmap is a visualization showing expression levels of many genes across multiple samples using a color scale. Rows represent genes, columns represent samples, and hierarchical clustering of rows and columns allows identifying co-expression patterns and sample subgroups. Heatmaps are useful for exploring co-regulation, detecting outliers, and selecting clusters for functional analysis.",
  },
  {
    pattern:
      "^(what is a volcano plot|what is a volcanoplot|what is a volcano|explain (a )?volcano plot|what is (a )?volcano plot for|how to interpret (a )?volcano plot)[!., ]*$",
    response:
      "🌋 A volcano plot is a graph combining the magnitude of expression change (logFC) and statistical significance (p-value or FDR) for each gene. The X-axis shows logFC and the Y-axis shows significance, so genes with large and robust changes appear at the upper extremes. To draw conclusions, genes exceeding logFC and FDR thresholds are first identified, then prioritized by biological relevance, and integrated with pathway analyses and heatmaps to propose hypotheses.",
  },
  {
    pattern:
      "^(what is functional annotation|what does functional annotation mean|what is (functional )?annotation for|explain (functional )?annotation|definition of (functional )?annotation)[!., ]*$",
    response:
      "🧩 Functional annotation is the process of assigning biological terms, pathways, or functions to genes or transcripts based on databases and evidence. It includes classifications such as ontologies, metabolic pathways, and molecular categories, allowing DEG lists to be interpreted in biological terms. Functional annotation translates a gene list into potential processes and mechanisms explaining observed changes.",
  },
  {
    pattern:
      "^(what is go|what does go mean|what is gene ontology|explain go|what is (go) for|definition of gene ontology)[!., ]*$",
    response:
      "📚 GO (Gene Ontology) is a standardized system that classifies biological functions, processes, and cellular components associated with genes. GO facilitates annotation and enrichment analysis, allowing genes to be grouped by shared functions and detecting over- or underrepresented processes in an experiment. It is a key tool to interpret transcriptomic results at the functional level.",
  },
  {
    pattern:
      "^(what is kegg|what does kegg mean|what is kegg database|explain kegg|what is kegg for|definition of kegg)[!., ]*$",
    response:
      "🗺 KEGG is a database of metabolic and signaling pathways that organizes genes and proteins into functional maps. It is used to identify affected pathways in an experiment and to visualize how expression changes can alter metabolic or signaling processes. KEGG complements functional annotation and helps generate mechanistic hypotheses about observed effects.",
  },
  {
    pattern:
      "^(what is batch effect|what does batch effect mean|what is batch variation|what is batch effect|explain batch effect|how does batch effect affect|why identify batch effect)[!., ]*$",
    response:
      "⚠️ Batch effect is a non-biological variation introduced by technical differences between sample batches (date, operator, reagents, sequencer). It can mask or confound biological signals if not identified and corrected. Mitigation strategies include balanced experimental designs, controls, and statistical correction methods such as COMBAT or including covariates in the model.",
  },
  {
    pattern:
      "^(what is gene filtering|what does gene filtering mean|why filter genes|explain gene filtering|definition of gene filtering)[!., ]*$",
    response:
      "🧹 Gene filtering involves removing genes with very low or uninformative expression before differential analysis. This reduces noise, improves statistical power, and avoids spurious results caused by low counts. Filtering rules may be based on counts per million thresholds, minimum number of samples expressing the gene, or the global data distribution.",
  },
  {
    pattern:
      "^(what is rpkm|what does rpkm mean|definition of rpkm|what is reads per kilobase per million|explain rpkm)[!., ]*$",
    response:
      "📏 RPKM (Reads Per Kilobase per Million) is an expression measure that normalizes read counts by gene length and sequencing depth. It allows comparison of relative gene expression within a sample but has limitations for comparisons between samples compared to newer methods like TPM or count-based normalizations.",
  },
  {
    pattern:
      "^(what is transcriptome|what does transcriptome mean|definition of transcriptome|explain transcriptome|what is transcriptome for)[!., ]*$",
    response:
      "🌐 The transcriptome is the complete set of transcripts present in a cell or tissue at a given moment, including mRNA and non-coding RNA. Studying the transcriptome via RNA-Seq provides a global view of genetic activity, allows identification of isoforms, novel transcripts, and dynamic changes in response to conditions or treatments.",
  },
  {
    pattern:
      "^(what is polysome|what is polysome or polyribosome|what does polysome mean|explain polysome|what is polysome for)[!., ]*$",
    response:
      "⚙️ A polysome is a complex formed by multiple ribosomes bound to the same mRNA during translation. The presence of polysomes indicates active translation and allows inference of protein production levels for a transcript. Techniques like ribosome profiling (Ribo-Seq) use this concept to study gene-level translation efficiency.",
  },
  {
    pattern:
      "^(what is ribodepletion|what does ribodepletion mean|what is ribodepletion for|explain ribodepletion in rnaseq)[!., ]*$",
    response:
      "🧪 Ribodepletion is a library preparation step that removes ribosomal RNA (rRNA) before sequencing, reducing the proportion of ribosomal sequences and increasing coverage of transcripts of interest. It is especially useful in samples with high rRNA content or when studying non-coding RNA and low-abundance transcripts.",
  },
  {
    pattern:
      "^(what is polya selection|what does polya selection mean|explain polya selection|what is polya selection for|what is polyA selection)[!., ]*$",
    response:
      "🎯 PolyA selection is an mRNA enrichment method that captures transcripts with poly-A tails using oligo-dT bound to beads or columns. Advantages: increases the fraction of coding RNA in the library and improves efficiency for mRNA studies. Limitations: poorly captures non-poly-A RNAs (e.g., some non-coding RNAs) and may introduce 3' bias if RNA integrity is low. Alternative: ribodepletion, useful for non-coding RNA or degraded samples.",
  },
  {
    pattern:
      "^(what is single end|what is single end sequencing|what does single end mean|explain single end|what is single end for|what is single end sequencing)[!., ]*$",
    response:
      "🔬 Single-end sequencing reads only one end of each fragment. Advantages: lower cost and simpler workflow. Disadvantages: less information about precise fragment position and structure compared to paired-end, which can complicate isoform resolution and mapping in repetitive regions. Used for basic quantification and cost savings.",
  },
  {
    pattern:
      "^(what is paired end|what is paired end sequencing|what does paired end mean|explain paired end|what is paired end for|what is paired end sequencing)[!., ]*$",
    response:
      "🔗 Paired-end sequencing reads both ends of each fragment, generating two reads per fragment. This improves mapping in repetitive regions, facilitates splice and isoform detection, and allows estimation of fragment size (insert size). Preferred when higher structural resolution, assemblies, or variant detection are required.",
  },
  {
    pattern:
      "^(what is read length|what does read length mean|what is read length|explain read length|what is read length for|how many bases does a read have)[!., ]*$",
    response:
      "📏 Read length is the number of nucleotides in each read generated by the sequencer. Longer reads improve unique mapping and isoform resolution but may have higher error rates at the ends. Read length choice depends on the objective: basic quantification tolerates short reads, while isoform analysis or assembly benefits from long reads.",
  },
  {
    pattern:
      "^(what is sequencing depth|what does sequencing depth mean|what is sequencing depth|explain sequencing depth|what is sequencing depth for|what does sequencing coverage mean)[!., ]*$",
    response:
      "🔋 Sequencing depth (or coverage) is the total number of reads generated per sample. Higher depth increases sensitivity for detecting rare transcripts and improves quantification but incurs higher cost. Required depth depends on the objective: highly expressed genes need fewer reads; detection of low-abundance transcripts, isoforms, or splicing events requires higher depth. Saturation curves are useful to determine an efficient point.",
  },
  {
    pattern:
      "^(what is multi mapping|what does multi mapping mean|what is multimapping|explain multi mapping|how do multimapped reads affect|what are multimapped reads)[!., ]*$",
    response:
      "🌀 Multi-mapping occurs when a read can align to multiple positions in the genome or transcriptome due to sequence similarity (repetitive regions, gene families, isoforms). This complicates read assignment to genes and quantification. Strategies: discard multimapped reads, assign probabilistically (tools like Salmon), or use mapping parameters that minimize multi-mapping. Reporting and handling these reads is important to avoid bias.",
  },
  {
    pattern:
      "^(what is splice junction|what is a splice junction|what does splice junction mean|explain splice junction|what is a splicing junction|how is splice junction detected)[!., ]*$",
    response:
      "✂️ A splice junction is the position where two exons are joined in mature RNA after splicing. Detection of splice junctions in RNA-Seq allows identification of isoforms, alternative splicing, and novel unannotated junctions. Splicing-aware aligners (e.g., STAR, HISAT2) report reads spanning junctions, key for studying alternative splicing regulation.",
  },
  {
    pattern:
      "^(what is intron|what does intron mean|what is intron in rna|explain intron|definition of intron|how is intron defined)[!., ]*$",
    response:
      "📦 An intron is a non-coding region within a gene that is transcribed into pre-mRNA but removed during processing to produce mature RNA. Reads mapping to introns may indicate nuclear transcripts, intron retention, or unprocessed RNA contamination. Interpreting intronic reads requires considering the library preparation protocol (PolyA selection vs ribodepletion) and RNA integrity.",
  },
  {
    pattern:
      "^(what is exon|what does exon mean|what is exon in rna|explain exon|definition of exon|how is exon defined)[!., ]*$",
    response:
      "🔹 An exon is a gene region that remains in the mature RNA and often codes for amino acids in mRNA. Reads mapping to exons are used to quantify gene expression, and reads spanning junctions between exons help define isoforms. Exon annotation is essential for correct count assignment and isoform analysis.",
  },
  {
    pattern:
      "^(what is isoform|what does isoform mean|what is gene isoform|explain isoform|definition of isoform|how is isoform defined)[!., ]*$",
    response:
      "🔁 An isoform is a transcript variant generated by events such as alternative splicing, alternative promoter or terminator usage, producing transcripts with different exons or exon order. Isoforms can differ in function, subcellular localization, or stability. Quantifying isoforms is more complex than gene-level quantification and requires tools and reads (preferably paired-end and sufficiently long) that allow variant discrimination.",
  },
  {
    pattern:
      "^(what is pseudoalignment quantification|what is pseudoaligned quantification|explain pseudoalignment quantification|what is pseudoalignment used for|what does pseudoalignment mean)[!., ]*$",
    response:
      "🚀 Pseudoalignment quantification is a fast approach to estimate transcript abundance without full genome alignment. Tools like Salmon or Kallisto compare read k-mers to the transcriptome and assign reads to transcripts probabilistically. Advantages: high speed and low resource usage; limitations: less positional information than traditional mapping but sufficient for quantification and many expression analyses.",
  },
  {
    pattern:
      "^(what is gc bias|what does gc bias mean|what is gc content bias|explain gc bias|how does gc content affect sequencing)[!., ]*$",
    response:
      "⚖️ GC bias is a technical bias where regions with high or low GC content are represented unequally in reads. It can affect PCR efficiency, library capture, and sequencing, causing some genes to appear over- or under-expressed for technical reasons. Detected in quality controls, it can be corrected statistically or using tools that model bias during quantification.",
  },
  {
    pattern:
      "^(what is library size normalization|explain library size normalization|what is normalization by library size used for)[!., ]*$",
    response:
      "⚖️ Library size normalization adjusts counts to account for differences in total reads between samples. The goal is that expression comparisons reflect biological changes rather than sequencing depth differences. Simple methods divide by total reads (or per million), while sophisticated methods (TMM, RLE) also correct for compositional biases.",
  },
  {
    pattern:
      "^(what is dispersion in rnaseq|what does dispersion mean in rnaseq|explain dispersion in rnaseq|what is dispersion used for)[!., ]*$",
    response:
      "📈 Dispersion in RNA-Seq measures biological and technical variability among replicates for a gene, typically in the context of count models (e.g., negative binomial). Accurate dispersion estimation is key for assessing significance of expression changes: high dispersion reduces statistical power, while low dispersion increases confidence in observed differences.",
  },
  {
    pattern:
      "^(what is multiple testing correction|what is correction for multiple comparisons|explain multiple testing correction|why adjust for multiple testing)[!., ]*$",
    response:
      "🧾 Multiple testing correction addresses the false positive problem when thousands of tests are performed simultaneously (e.g., one test per gene). Methods like Bonferroni or FDR (Benjamini-Hochberg) control the error rate, making conclusions more robust. Without correction, many apparently significant differences would be due to chance.",
  },
  {
    pattern:
      "^(what is adjusted pvalue|what does adjusted pvalue mean|explain adjusted pvalue|what is adjusted p value|what is the purpose of adjusted pvalue)[!., ]*$",
    response:
      "✅ The adjusted p-value is the original p-value after applying a multiple testing correction (e.g., FDR). It reflects the probability of observing the result under the null hypothesis considering the total number of comparisons. Using adjusted p-values reduces false positives and helps prioritize genes with real statistical evidence.",
  },
  {
    pattern:
      "^(what is fold change|what does fold change mean|what is fc|explain fold change|what is fold change used for)[!., ]*$",
    response:
      "🔁 Fold change (or ratio) measures relative change in expression between two conditions (e.g., condition A vs B). Often expressed as log2 fold change to symmetrize increases and decreases. Combined with statistical significance, it identifies genes with biologically meaningful changes.",
  },
  {
    pattern:
      "^(what is hierarchical clustering|what does hierarchical clustering mean|explain hierarchical clustering|what is hierarchical clustering used for|what is hierarchical grouping)[!., ]*$",
    response:
      "🌳 Hierarchical clustering is a method to group genes or samples based on expression similarity, building a hierarchy of clusters through successive linkage. In heatmaps, it is used to order rows and columns, facilitating identification of co-expressed groups and response patterns. The choice of distance metric and linkage method influences results, so it is important to justify the selection.",
  },
  {
    pattern:
      "^(what is an rnaseq pipeline|what does rnaseq pipeline mean|what is a workflow rnaseq|explain rnaseq pipeline|what is rnaseq pipeline used for)[!., ]*$",
    response:
      "🛠 An RNA-Seq pipeline is an organized sequence of steps that transforms raw data (FASTQ) into interpretable biological results: quality control, trimming, alignment or quantification, gene/transcript quantification, normalization, differential analysis, and functional annotation. Automating the pipeline improves reproducibility, traceability, and facilitates comparisons across experiments.",
  },
];
