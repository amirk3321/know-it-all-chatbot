class PromptEntity {
  final String? title;
  final bool? isPrompt;
  final List<dynamic>? conversationArr;

  PromptEntity({this.title, this.isPrompt, this.conversationArr});

  static List<PromptEntity> promptData = [
    PromptEntity(title:"Web Development ChatGPT Prompts", isPrompt:false),
    PromptEntity(title:
        "Please Make a javascript tip. I would like to share it with the twitter tech community.",
        isPrompt:true),
    PromptEntity(title:"How do you vertically and horizontally center a div?", isPrompt:true),
    PromptEntity(title:
        "I require UI assistance. I need three action buttons for a card component that includes a long statement, but I don't want the buttons to functions on both desktop and mobile since if I try to show the buttons on hover, that logic won't work on mobile",
        isPrompt:true),
    PromptEntity(title:
        "Write a tutorial on how to generate code snippets using Chat GPT",
        isPrompt:true),
    PromptEntity(title:
        "Please identify the eight essential values that a business needs to embody in order to have a positive culture.",
        isPrompt:true),
    PromptEntity(title:
        "Create a list of five Chat GPT debugging friendly features",
        isPrompt:true),
    PromptEntity(title:
        "Create an article about Chat GPT's future in software development",
        isPrompt:true),
    PromptEntity(title:
        "Comment on a Chat GPT plugin for your favorite IDE",
        isPrompt:true),

    PromptEntity(title:"Generate prompts for AI Art", isPrompt:true),
    PromptEntity(title:
        "Discover the security flaw in this code snippet form an open source npm package",
        isPrompt:true),
    PromptEntity(title:
        "How to change query information in React-Query following", isPrompt:true),
    PromptEntity(title:"Music ChatGPT Prompts", isPrompt:false),
    PromptEntity(title:"this song's chords should be simplified.", isPrompt:true),
    PromptEntity(title:
        "Create a poem or song for children aged ten that explains quantum computing and the future of artificial intelligence.",
        isPrompt:true),
    PromptEntity(title:"transpose wonderwall by -3", isPrompt:true),
    PromptEntity(title:
        "Make a song about programmer and someone who isn't a programmer.",
        isPrompt:true),
    PromptEntity(title:"Business ChatGPT Prompts ", isPrompt:false),
    PromptEntity(title:"Make list of the top five common SEO mistakes and how to avoid them", isPrompt:true),
    PromptEntity(title:"can you predict new company concepts without funding?", isPrompt:true),
    PromptEntity(title:"Create a case study detailing how Chat GPT assisted a client in improving their search engine rankings", isPrompt:true),
    PromptEntity(title:
        "Send an email requesting that people act more quickly.", isPrompt:true),
    PromptEntity(title:
        "Please create a product roadmap for Instagram's stories in order to increase the number of posts.Please be as detailed as possible, and whenever possible, use comparisons to other tools such as TikTok.)",
        isPrompt:true),
    PromptEntity(title:
        "describe a terrible hangover using the language of renaissance English aristocrat.",
        isPrompt:true),
    PromptEntity(title:"Please share the meeting's agenda in advance.", isPrompt:true),
    PromptEntity(title:"Educational ChatGPT Prompts", isPrompt:false),
    PromptEntity(title:
        "Teach me the Pythagorean theorum, including a quize at the end, but don't give me the answers and then tell me if | got the answer right when | respond. ",
        isPrompt:true),
    PromptEntity(title:
        "Writhe a poem in the style of robert Frost for the college introductory physics class.",
        isPrompt:true),
    PromptEntity(title:
        "Create a YAML template for the Nuclei vulnerability scanner to detect Magento version. ",
        isPrompt:true),
    PromptEntity(title:
        "The best use of you (ChatGPT) so far has been your ability to create lovely poems.Can you compose a poem on your capacity to do so on any subject? Mention how well-versed you are in growing the biggest pumpkins as well.You really are the finest.  ",
        isPrompt:true),
    PromptEntity(title:"Comedy ChatGPT Prompts", isPrompt:false),
    PromptEntity(title:"Describe redux in a song.", isPrompt:true),
    PromptEntity(title:
        "Write a very little story about persons who are infamous for being late.",
        isPrompt:true),

    PromptEntity(title:"Writers ChatGPT Prompts", isPrompt:false),
    PromptEntity(title:"Create a short story about a character who discovers an undiscovered talent", isPrompt:true),
    PromptEntity(title:"write a poem about nature's beauty", isPrompt:true),
    PromptEntity(title:"Create a scene in which two characters talk about their dreams", isPrompt:true),
    PromptEntity(title:"Write an article about the benefits of web hosting products", isPrompt:true),
    PromptEntity(title:"Create a scene where a character faces their fears", isPrompt:true),
  ];

  static List<PromptEntity> examplePrompts = [
    PromptEntity(title:"Explain quantum computing in simple terms", isPrompt:false),
    PromptEntity(title:"Got any creative ideas for a 10 year old's birthday?", isPrompt:false),
    PromptEntity(title:"How do I make an HTTP request in javascript", isPrompt:false),
  ];
}
