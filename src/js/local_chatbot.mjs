import { createThreadAssistant, sendMessage } from './thread_ollama.mjs';

const converter = new showdown.Converter()

const chatInput = 
	document.querySelector('.chat-input textarea');
const sendChatBtn = 
	document.querySelector('.chat-input button');
const chatbox = document.querySelector(".chatbox");

let userMessage;
// let thread;
// let assistant;
let openai;

(async () => {
	console.log('Creating thread...⏳');
	openai = await createThreadAssistant();
	console.log('Thread created! ✅');
  })();



const createChatLi = (message, className) => {
	const chatLi = document.createElement("li");
	chatLi.classList.add("chat", className);
	let chatContent = 
		className === "chat-outgoing" ? `<p>${message}</p>` : `<p>${message}</p>`;
	chatLi.innerHTML = chatContent;
	return chatLi;
}

const createChatDiv = (message, className) => {
	const chatDiv = document.createElement("div");
	chatDiv.classList.add("chat", className);
	chatDiv.id ="chat-div";
	let chatContent = message;
	chatDiv = chatContent;
	return chatDiv;
}



const generateResponse = async (incomingChatLi) => {
	const messageElement = incomingChatLi.querySelector("p");

    
	console.log(`Sending message...⏳ ${userMessage}`);
	try {
		const response = await sendMessage(openai, userMessage);
		console.log('Message sent! ✅');
		console.log('Response: ', response);
		console.log('response.content: ', response.content);
		
		messageElement.textContent = converter.makeHtml(response.content);
		
	} catch(error) {
		console.log('☹ ⚠ error:', error);
	}
	chatbox.scrollTo(0, chatbox.scrollHeight)

}

const handleChat = () => {
	userMessage = chatInput.value.trim();
	if (!userMessage) {
		return;
	}
	chatbox
	.appendChild(createChatLi(userMessage, "chat-outgoing"));
	chatbox
	.scrollTo(0, chatbox.scrollHeight);

	setTimeout(() => {
		const incomingChatLi = createChatLi("Thinking...", "chat-incoming")
		chatbox.appendChild(incomingChatLi);
		chatbox.scrollTo(0, chatbox.scrollHeight);
		generateResponse(incomingChatLi);
	}, 600);
}

sendChatBtn.addEventListener("click", handleChat);
